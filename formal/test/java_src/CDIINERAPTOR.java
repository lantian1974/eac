001    /*
002      GRANITE DATA SERVICES
003      Copyright (C) 2011 GRANITE DATA SERVICES S.A.S.
004    
005      This file is part of Granite Data Services.
006    
007      Granite Data Services is free software; you can redistribute it and/or modify
008      it under the terms of the GNU Library General Public License as published by
009      the Free Software Foundation; either version 2 of the License, or (at your
010      option) any later version.
011    
012      Granite Data Services is distributed in the hope that it will be useful, but
013      WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
014      FITNESS FOR A PARTICULAR PURPOSE. See the GNU Library General Public License
015      for more details.
016    
017      You should have received a copy of the GNU Library General Public License
018      along with this library; if not, see <http://www.gnu.org/licenses/>.
019    */
020    
021    package org.granite.cdi;
022    
023    import java.util.Iterator;
024    import java.util.Map;
025    
026    import javax.enterprise.context.Conversation;
027    import javax.enterprise.inject.spi.Bean;
028    import javax.enterprise.inject.spi.BeanManager;
029    import javax.naming.InitialContext;
030    import javax.naming.NameNotFoundException;
031    import javax.servlet.ServletRequestEvent;
032    
033    import org.granite.context.GraniteContext;
034    import org.granite.logging.Logger;
035    import org.granite.messaging.amf.process.AMF3MessageInterceptor;
036    import org.granite.messaging.service.ServiceException;
037    import org.granite.messaging.webapp.HttpGraniteContext;
038    import org.granite.messaging.webapp.HttpServletRequestParamWrapper;
039    import org.granite.tide.cdi.ConversationState;
040    import org.granite.tide.cdi.EventState;
041    import org.granite.tide.cdi.SessionState;
042    import org.granite.util.ClassUtil;
043    import org.jboss.weld.servlet.WeldListener;
044    
045    import flex.messaging.messages.Message;
046    
047    
048    public class CDIInterceptor implements AMF3MessageInterceptor {
049            
050            private static final Logger log = Logger.getLogger(CDIInterceptor.class);
051    
052        private static final String CONVERSATION_ID = "conversationId";
053        private static final String IS_LONG_RUNNING_CONVERSATION = "isLongRunningConversation";
054        private static final String WAS_LONG_RUNNING_CONVERSATION_CREATED = "wasLongRunningConversationCreated";
055        private static final String WAS_LONG_RUNNING_CONVERSATION_ENDED = "wasLongRunningConversationEnded";
056            
057        private CDIConversationManager conversationManager;
058        
059        
060        public CDIInterceptor() {
061            try {
062                    Thread.currentThread().getContextClassLoader().loadClass("org.jboss.weld.context.http.HttpConversationContext");
063                    conversationManager = ClassUtil.newInstance("org.granite.cdi.Weld11ConversationManager", CDIConversationManager.class);
064                    log.info("Detected Weld 1.1");
065            }
066            catch (Exception e) {
067                    try {
068                            conversationManager = ClassUtil.newInstance("org.granite.cdi.Weld10ConversationManager", CDIConversationManager.class);
069                            log.info("Detected Weld 1.0");
070                    }
071                    catch (Exception f) {
072                            throw new RuntimeException("Could not load conversation manager for CDI implementation", f);
073                    }
074            }
075        }
076        
077        
078        public static BeanManager lookupBeanManager() {
079                    HttpGraniteContext context = (HttpGraniteContext)GraniteContext.getCurrentInstance();
080                    BeanManager manager = (BeanManager)context.getServletContext().getAttribute(BeanManager.class.getName());
081                    if (manager != null)
082                            return manager;
083                    
084                    InitialContext ic = null;
085                try {
086                            ic = new InitialContext();
087                    // Standard JNDI binding
088                    return (BeanManager)ic.lookup("java:comp/BeanManager");
089                }
090                catch (NameNotFoundException e) {
091                    if (ic == null)
092                            throw new RuntimeException("No InitialContext");
093                    
094                    // Weld/Tomcat
095                    try {
096                            return (BeanManager)ic.lookup("java:comp/env/BeanManager"); 
097                    }
098                    catch (Exception e1) {          
099                            // JBoss 5/6 (maybe obsolete in Weld 1.0+)
100                            try {
101                                    return (BeanManager)ic.lookup("java:app/BeanManager");
102                            }
103                        catch (Exception e2) {
104                            throw new RuntimeException("Could not find Bean Manager", e2);
105                        }
106                    }
107                }
108                catch (Exception e) {
109                    throw new RuntimeException("Could not find Bean Manager", e);
110                }
111        }
112        
113        
114            private WeldListener listener = new WeldListener();
115            
116            private static final String MESSAGECOUNT_ATTR = CDIInterceptor.class.getName() + "_messageCount";
117            private static final String REQUESTWRAPPER_ATTR = CDIInterceptor.class.getName() + "_requestWrapper";
118        
119        
120            public void before(Message amf3RequestMessage) {
121                    if (log.isTraceEnabled())
122                            log.trace("Pre processing of request message: %s", amf3RequestMessage);
123                    
124                    try {
125                            GraniteContext context = GraniteContext.getCurrentInstance();
126                            
127                            if (context instanceof HttpGraniteContext) {
128                                    HttpGraniteContext httpContext = ((HttpGraniteContext)context);
129                                    Integer wrapCount = (Integer)httpContext.getRequest().getAttribute(MESSAGECOUNT_ATTR);
130                                    if (wrapCount == null) {
131                                            log.debug("Clearing default Weld request context");
132                                    ServletRequestEvent event = new ServletRequestEvent(httpContext.getServletContext(), httpContext.getRequest());
133                                            listener.requestDestroyed(event);
134                                            httpContext.getRequest().setAttribute(MESSAGECOUNT_ATTR, 1);
135                                    }
136                                    else
137                                            httpContext.getRequest().setAttribute(MESSAGECOUNT_ATTR, wrapCount+1);
138                                    
139                            log.debug("Initializing wrapped AMF request");
140                            
141                        HttpServletRequestParamWrapper requestWrapper = new HttpServletRequestParamWrapper(httpContext.getRequest());
142                        httpContext.getRequest().setAttribute(REQUESTWRAPPER_ATTR, requestWrapper);
143                                    
144                            // Now export the headers - copy the headers to request object
145                            Map<String, Object> headerMap = amf3RequestMessage.getHeaders();
146                            if (headerMap != null && headerMap.size() > 0) {
147                                    Iterator<String> headerKeys = headerMap.keySet().iterator();
148                                    while (headerKeys.hasNext()) {
149                                            String key = headerKeys.next();
150                                            String value = headerMap.get(key) == null ? null : headerMap.get(key).toString();
151                                            if (value != null)
152                                                    requestWrapper.setParameter(key, value);
153                                    }
154                            }
155                        
156                            ServletRequestEvent event = new ServletRequestEvent(((HttpGraniteContext)context).getServletContext(), requestWrapper);
157                            listener.requestInitialized(event);
158                        
159                            // Initialize CDI Context
160                                String conversationId = (String)amf3RequestMessage.getHeader(CONVERSATION_ID);
161                                
162                                BeanManager beanManager = lookupBeanManager();
163                                
164                                Conversation conversation = conversationManager.initConversation(beanManager, conversationId);
165                                
166                                @SuppressWarnings("unchecked")
167                                Bean<EventState> eventBean = (Bean<EventState>)beanManager.getBeans(EventState.class).iterator().next();
168                                EventState eventState = (EventState)beanManager.getReference(eventBean, EventState.class, beanManager.createCreationalContext(eventBean));
169                                if (!conversation.isTransient())
170                                    eventState.setWasLongRunning(true);
171                                
172                                if (conversationId != null && conversation.isTransient()) {
173                                        log.debug("Starting conversation " + conversationId);
174                                        conversation.begin(conversationId);
175                                }
176                                    
177                            if (Boolean.TRUE.toString().equals(amf3RequestMessage.getHeader("org.granite.tide.isFirstCall"))) {
178                                    @SuppressWarnings("unchecked")
179                                    Bean<SessionState> ssBean = (Bean<SessionState>)beanManager.getBeans(SessionState.class).iterator().next();
180                                    ((SessionState)beanManager.getReference(ssBean, SessionState.class, beanManager.createCreationalContext(ssBean))).setFirstCall(true);
181                            }
182                                    
183                            if (Boolean.TRUE.toString().equals(amf3RequestMessage.getHeader("org.granite.tide.isFirstConversationCall")) && !conversation.isTransient()) {
184                                    @SuppressWarnings("unchecked")
185                                    Bean<ConversationState> csBean = (Bean<ConversationState>)beanManager.getBeans(ConversationState.class).iterator().next();
186                                    ((ConversationState)beanManager.getReference(csBean, ConversationState.class, beanManager.createCreationalContext(csBean))).setFirstCall(true);
187                            }
188                            }
189                    }
190                    catch(Exception e) {
191                log.error(e, "Exception while pre processing the request message.");
192                throw new ServiceException("Error while pre processing the request message - " + e.getMessage());
193                    }
194            }
195    
196    
197            public void after(Message amf3RequestMessage, Message amf3ResponseMessage) {            
198                    try {
199                            if (log.isTraceEnabled())
200                                    log.trace("Post processing of response message: %s", amf3ResponseMessage);
201    
202                            GraniteContext context = GraniteContext.getCurrentInstance();
203                            
204                            if (context instanceof HttpGraniteContext) {
205                                BeanManager beanManager = lookupBeanManager();
206                                    try {
207                                            // Add conversation management headers to response
208                                            if (amf3ResponseMessage != null) {
209                                                @SuppressWarnings("unchecked")
210                                                Bean<Conversation> conversationBean = (Bean<Conversation>)beanManager.getBeans(Conversation.class).iterator().next();
211                                                Conversation conversation = (Conversation)beanManager.getReference(conversationBean, Conversation.class, beanManager.createCreationalContext(conversationBean));
212                                                
213                                                @SuppressWarnings("unchecked")
214                                                Bean<EventState> eventBean = (Bean<EventState>)beanManager.getBeans(EventState.class).iterator().next();
215                                                EventState eventState = (EventState)beanManager.getReference(eventBean, EventState.class, beanManager.createCreationalContext(eventBean));
216                                                if (eventState.wasLongRunning() && !conversation.isTransient())
217                                                    amf3ResponseMessage.setHeader(WAS_LONG_RUNNING_CONVERSATION_ENDED, true);
218                                                    
219                                        if (eventState.wasCreated() && !conversation.isTransient())
220                                            amf3ResponseMessage.setHeader(WAS_LONG_RUNNING_CONVERSATION_CREATED, true);
221                                        
222                                        amf3ResponseMessage.setHeader(CONVERSATION_ID, conversation.getId());
223                                                    
224                                        amf3ResponseMessage.setHeader(IS_LONG_RUNNING_CONVERSATION, !conversation.isTransient());
225                                            }
226                                    }
227                                    finally {
228                                            conversationManager.destroyConversation(beanManager);
229                                            
230                                            HttpGraniteContext httpContext = ((HttpGraniteContext)context);
231                                        
232                                            // Destroy the CDI context
233                                            HttpServletRequestParamWrapper requestWrapper = (HttpServletRequestParamWrapper)httpContext.getRequest().getAttribute(REQUESTWRAPPER_ATTR);
234                                            httpContext.getRequest().removeAttribute(REQUESTWRAPPER_ATTR);
235                                    ServletRequestEvent event = new ServletRequestEvent(httpContext.getServletContext(), requestWrapper);
236                                    listener.requestDestroyed(event);
237                                        
238                                    log.debug("Destroying wrapped CDI AMF request");
239                                    
240                                            Integer wrapCount = (Integer)httpContext.getRequest().getAttribute(MESSAGECOUNT_ATTR);
241                                            if (wrapCount == 1) {
242                                                    log.debug("Restoring default Weld request context");
243                                            event = new ServletRequestEvent(((HttpGraniteContext)context).getServletContext(), httpContext.getRequest());
244                                                    listener.requestInitialized(event);
245                                                    httpContext.getRequest().removeAttribute(MESSAGECOUNT_ATTR);
246                                            }
247                                            else
248                                                    httpContext.getRequest().setAttribute(MESSAGECOUNT_ATTR, wrapCount-1);
249                                            
250                                    }
251                            }
252                    }
253                    catch (Exception e) {
254                log.error(e, "Exception while post processing the response message.");
255                throw new ServiceException("Error while post processing the response message - " + e.getMessage());
256                    }
257            }
258    }




























































