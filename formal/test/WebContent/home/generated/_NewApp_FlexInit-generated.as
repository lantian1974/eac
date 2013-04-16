package {
import flash.display.DisplayObject;
import flash.utils.*;
import mx.core.IFlexModuleFactory;
import mx.styles.IStyleManager2;
import mx.events.Request;
import mx.styles.StyleManagerImpl;
import mx.managers.systemClasses.ChildManager;
import mx.core.TextFieldFactory; TextFieldFactory;
import flash.system.*
import spark.accessibility.TextBaseAccImpl;
import mx.accessibility.UIComponentAccProps;
import spark.accessibility.ButtonBaseAccImpl;
import flash.net.registerClassAlias;
import flash.net.getClassByAlias;
import mx.managers.SystemManagerGlobals;
import mx.resources.ResourceManager;
import mx.collections.ArrayCollection;
import mx.collections.ArrayList;
import mx.messaging.config.ConfigMap;
import mx.messaging.messages.AcknowledgeMessage;
import mx.messaging.messages.AcknowledgeMessageExt;
import mx.messaging.messages.AsyncMessage;
import mx.messaging.messages.AsyncMessageExt;
import mx.messaging.messages.CommandMessage;
import mx.messaging.messages.CommandMessageExt;
import mx.messaging.messages.ErrorMessage;
import mx.messaging.messages.MessagePerformanceInfo;
import mx.messaging.messages.RemotingMessage;
import mx.utils.ObjectProxy;
import mx.effects.EffectManager;
import mx.core.mx_internal;
import mx.messaging.config.ServerConfig;
import mx.messaging.channels.SecureAMFChannel;
import mx.messaging.channels.AMFChannel;
[ResourceBundle("collections")]
[ResourceBundle("components")]
[ResourceBundle("core")]
[ResourceBundle("effects")]
[ResourceBundle("layout")]
[ResourceBundle("logging")]
[ResourceBundle("messaging")]
[ResourceBundle("rpc")]
[ResourceBundle("skins")]
[ResourceBundle("styles")]

[Mixin]
public class _NewApp_FlexInit
{
   public function _NewApp_FlexInit()
   {
       super();
   }
   public static function init(fbs:IFlexModuleFactory):void
   {
       new ChildManager(fbs);
       var styleManager:IStyleManager2;
       styleManager = new StyleManagerImpl(fbs);
       EffectManager.mx_internal::registerEffectTrigger("addedEffect", "added");
       EffectManager.mx_internal::registerEffectTrigger("creationCompleteEffect", "creationComplete");
       EffectManager.mx_internal::registerEffectTrigger("focusInEffect", "focusIn");
       EffectManager.mx_internal::registerEffectTrigger("focusOutEffect", "focusOut");
       EffectManager.mx_internal::registerEffectTrigger("hideEffect", "hide");
       EffectManager.mx_internal::registerEffectTrigger("mouseDownEffect", "mouseDown");
       EffectManager.mx_internal::registerEffectTrigger("mouseUpEffect", "mouseUp");
       EffectManager.mx_internal::registerEffectTrigger("moveEffect", "move");
       EffectManager.mx_internal::registerEffectTrigger("removedEffect", "removed");
       EffectManager.mx_internal::registerEffectTrigger("resizeEffect", "resize");
       EffectManager.mx_internal::registerEffectTrigger("rollOutEffect", "rollOut");
       EffectManager.mx_internal::registerEffectTrigger("rollOverEffect", "rollOver");
       EffectManager.mx_internal::registerEffectTrigger("showEffect", "show");
       // trace("Flex accessibility startup: " + Capabilities.hasAccessibility);
       if (Capabilities.hasAccessibility) {
          spark.accessibility.TextBaseAccImpl.enableAccessibility();
          mx.accessibility.UIComponentAccProps.enableAccessibility();
          spark.accessibility.ButtonBaseAccImpl.enableAccessibility();
       }
       // mx.collections.ArrayCollection
       try 
       { 
           if (flash.net.getClassByAlias("flex.messaging.io.ArrayCollection") != mx.collections.ArrayCollection) 
           { 
               flash.net.registerClassAlias("flex.messaging.io.ArrayCollection", mx.collections.ArrayCollection); 
               if (fbs != SystemManagerGlobals.topLevelSystemManagers[0]) 
               { 
                   trace(ResourceManager.getInstance().getString( "core", 
                         "remoteClassMemoryLeak",
                         ["mx.collections.ArrayCollection","NewApp","_NewApp_FlexInit"]));
               } 
           } 
       } 
       catch (e:Error) 
       { 
           flash.net.registerClassAlias("flex.messaging.io.ArrayCollection", mx.collections.ArrayCollection); 
           if (fbs != SystemManagerGlobals.topLevelSystemManagers[0]) 
           { 
               trace(ResourceManager.getInstance().getString( "core", 
                     "remoteClassMemoryLeak",
                     ["mx.collections.ArrayCollection","NewApp","_NewApp_FlexInit"]));
           } 
       } 

       // mx.collections.ArrayList
       try 
       { 
           if (flash.net.getClassByAlias("flex.messaging.io.ArrayList") != mx.collections.ArrayList) 
           { 
               flash.net.registerClassAlias("flex.messaging.io.ArrayList", mx.collections.ArrayList); 
               if (fbs != SystemManagerGlobals.topLevelSystemManagers[0]) 
               { 
                   trace(ResourceManager.getInstance().getString( "core", 
                         "remoteClassMemoryLeak",
                         ["mx.collections.ArrayList","NewApp","_NewApp_FlexInit"]));
               } 
           } 
       } 
       catch (e:Error) 
       { 
           flash.net.registerClassAlias("flex.messaging.io.ArrayList", mx.collections.ArrayList); 
           if (fbs != SystemManagerGlobals.topLevelSystemManagers[0]) 
           { 
               trace(ResourceManager.getInstance().getString( "core", 
                     "remoteClassMemoryLeak",
                     ["mx.collections.ArrayList","NewApp","_NewApp_FlexInit"]));
           } 
       } 

       // mx.messaging.config.ConfigMap
       try 
       { 
           if (flash.net.getClassByAlias("flex.messaging.config.ConfigMap") != mx.messaging.config.ConfigMap) 
           { 
               flash.net.registerClassAlias("flex.messaging.config.ConfigMap", mx.messaging.config.ConfigMap); 
               if (fbs != SystemManagerGlobals.topLevelSystemManagers[0]) 
               { 
                   trace(ResourceManager.getInstance().getString( "core", 
                         "remoteClassMemoryLeak",
                         ["mx.messaging.config.ConfigMap","NewApp","_NewApp_FlexInit"]));
               } 
           } 
       } 
       catch (e:Error) 
       { 
           flash.net.registerClassAlias("flex.messaging.config.ConfigMap", mx.messaging.config.ConfigMap); 
           if (fbs != SystemManagerGlobals.topLevelSystemManagers[0]) 
           { 
               trace(ResourceManager.getInstance().getString( "core", 
                     "remoteClassMemoryLeak",
                     ["mx.messaging.config.ConfigMap","NewApp","_NewApp_FlexInit"]));
           } 
       } 

       // mx.messaging.messages.AcknowledgeMessage
       try 
       { 
           if (flash.net.getClassByAlias("flex.messaging.messages.AcknowledgeMessage") != mx.messaging.messages.AcknowledgeMessage) 
           { 
               flash.net.registerClassAlias("flex.messaging.messages.AcknowledgeMessage", mx.messaging.messages.AcknowledgeMessage); 
               if (fbs != SystemManagerGlobals.topLevelSystemManagers[0]) 
               { 
                   trace(ResourceManager.getInstance().getString( "core", 
                         "remoteClassMemoryLeak",
                         ["mx.messaging.messages.AcknowledgeMessage","NewApp","_NewApp_FlexInit"]));
               } 
           } 
       } 
       catch (e:Error) 
       { 
           flash.net.registerClassAlias("flex.messaging.messages.AcknowledgeMessage", mx.messaging.messages.AcknowledgeMessage); 
           if (fbs != SystemManagerGlobals.topLevelSystemManagers[0]) 
           { 
               trace(ResourceManager.getInstance().getString( "core", 
                     "remoteClassMemoryLeak",
                     ["mx.messaging.messages.AcknowledgeMessage","NewApp","_NewApp_FlexInit"]));
           } 
       } 

       // mx.messaging.messages.AcknowledgeMessageExt
       try 
       { 
           if (flash.net.getClassByAlias("DSK") != mx.messaging.messages.AcknowledgeMessageExt) 
           { 
               flash.net.registerClassAlias("DSK", mx.messaging.messages.AcknowledgeMessageExt); 
               if (fbs != SystemManagerGlobals.topLevelSystemManagers[0]) 
               { 
                   trace(ResourceManager.getInstance().getString( "core", 
                         "remoteClassMemoryLeak",
                         ["mx.messaging.messages.AcknowledgeMessageExt","NewApp","_NewApp_FlexInit"]));
               } 
           } 
       } 
       catch (e:Error) 
       { 
           flash.net.registerClassAlias("DSK", mx.messaging.messages.AcknowledgeMessageExt); 
           if (fbs != SystemManagerGlobals.topLevelSystemManagers[0]) 
           { 
               trace(ResourceManager.getInstance().getString( "core", 
                     "remoteClassMemoryLeak",
                     ["mx.messaging.messages.AcknowledgeMessageExt","NewApp","_NewApp_FlexInit"]));
           } 
       } 

       // mx.messaging.messages.AsyncMessage
       try 
       { 
           if (flash.net.getClassByAlias("flex.messaging.messages.AsyncMessage") != mx.messaging.messages.AsyncMessage) 
           { 
               flash.net.registerClassAlias("flex.messaging.messages.AsyncMessage", mx.messaging.messages.AsyncMessage); 
               if (fbs != SystemManagerGlobals.topLevelSystemManagers[0]) 
               { 
                   trace(ResourceManager.getInstance().getString( "core", 
                         "remoteClassMemoryLeak",
                         ["mx.messaging.messages.AsyncMessage","NewApp","_NewApp_FlexInit"]));
               } 
           } 
       } 
       catch (e:Error) 
       { 
           flash.net.registerClassAlias("flex.messaging.messages.AsyncMessage", mx.messaging.messages.AsyncMessage); 
           if (fbs != SystemManagerGlobals.topLevelSystemManagers[0]) 
           { 
               trace(ResourceManager.getInstance().getString( "core", 
                     "remoteClassMemoryLeak",
                     ["mx.messaging.messages.AsyncMessage","NewApp","_NewApp_FlexInit"]));
           } 
       } 

       // mx.messaging.messages.AsyncMessageExt
       try 
       { 
           if (flash.net.getClassByAlias("DSA") != mx.messaging.messages.AsyncMessageExt) 
           { 
               flash.net.registerClassAlias("DSA", mx.messaging.messages.AsyncMessageExt); 
               if (fbs != SystemManagerGlobals.topLevelSystemManagers[0]) 
               { 
                   trace(ResourceManager.getInstance().getString( "core", 
                         "remoteClassMemoryLeak",
                         ["mx.messaging.messages.AsyncMessageExt","NewApp","_NewApp_FlexInit"]));
               } 
           } 
       } 
       catch (e:Error) 
       { 
           flash.net.registerClassAlias("DSA", mx.messaging.messages.AsyncMessageExt); 
           if (fbs != SystemManagerGlobals.topLevelSystemManagers[0]) 
           { 
               trace(ResourceManager.getInstance().getString( "core", 
                     "remoteClassMemoryLeak",
                     ["mx.messaging.messages.AsyncMessageExt","NewApp","_NewApp_FlexInit"]));
           } 
       } 

       // mx.messaging.messages.CommandMessage
       try 
       { 
           if (flash.net.getClassByAlias("flex.messaging.messages.CommandMessage") != mx.messaging.messages.CommandMessage) 
           { 
               flash.net.registerClassAlias("flex.messaging.messages.CommandMessage", mx.messaging.messages.CommandMessage); 
               if (fbs != SystemManagerGlobals.topLevelSystemManagers[0]) 
               { 
                   trace(ResourceManager.getInstance().getString( "core", 
                         "remoteClassMemoryLeak",
                         ["mx.messaging.messages.CommandMessage","NewApp","_NewApp_FlexInit"]));
               } 
           } 
       } 
       catch (e:Error) 
       { 
           flash.net.registerClassAlias("flex.messaging.messages.CommandMessage", mx.messaging.messages.CommandMessage); 
           if (fbs != SystemManagerGlobals.topLevelSystemManagers[0]) 
           { 
               trace(ResourceManager.getInstance().getString( "core", 
                     "remoteClassMemoryLeak",
                     ["mx.messaging.messages.CommandMessage","NewApp","_NewApp_FlexInit"]));
           } 
       } 

       // mx.messaging.messages.CommandMessageExt
       try 
       { 
           if (flash.net.getClassByAlias("DSC") != mx.messaging.messages.CommandMessageExt) 
           { 
               flash.net.registerClassAlias("DSC", mx.messaging.messages.CommandMessageExt); 
               if (fbs != SystemManagerGlobals.topLevelSystemManagers[0]) 
               { 
                   trace(ResourceManager.getInstance().getString( "core", 
                         "remoteClassMemoryLeak",
                         ["mx.messaging.messages.CommandMessageExt","NewApp","_NewApp_FlexInit"]));
               } 
           } 
       } 
       catch (e:Error) 
       { 
           flash.net.registerClassAlias("DSC", mx.messaging.messages.CommandMessageExt); 
           if (fbs != SystemManagerGlobals.topLevelSystemManagers[0]) 
           { 
               trace(ResourceManager.getInstance().getString( "core", 
                     "remoteClassMemoryLeak",
                     ["mx.messaging.messages.CommandMessageExt","NewApp","_NewApp_FlexInit"]));
           } 
       } 

       // mx.messaging.messages.ErrorMessage
       try 
       { 
           if (flash.net.getClassByAlias("flex.messaging.messages.ErrorMessage") != mx.messaging.messages.ErrorMessage) 
           { 
               flash.net.registerClassAlias("flex.messaging.messages.ErrorMessage", mx.messaging.messages.ErrorMessage); 
               if (fbs != SystemManagerGlobals.topLevelSystemManagers[0]) 
               { 
                   trace(ResourceManager.getInstance().getString( "core", 
                         "remoteClassMemoryLeak",
                         ["mx.messaging.messages.ErrorMessage","NewApp","_NewApp_FlexInit"]));
               } 
           } 
       } 
       catch (e:Error) 
       { 
           flash.net.registerClassAlias("flex.messaging.messages.ErrorMessage", mx.messaging.messages.ErrorMessage); 
           if (fbs != SystemManagerGlobals.topLevelSystemManagers[0]) 
           { 
               trace(ResourceManager.getInstance().getString( "core", 
                     "remoteClassMemoryLeak",
                     ["mx.messaging.messages.ErrorMessage","NewApp","_NewApp_FlexInit"]));
           } 
       } 

       // mx.messaging.messages.MessagePerformanceInfo
       try 
       { 
           if (flash.net.getClassByAlias("flex.messaging.messages.MessagePerformanceInfo") != mx.messaging.messages.MessagePerformanceInfo) 
           { 
               flash.net.registerClassAlias("flex.messaging.messages.MessagePerformanceInfo", mx.messaging.messages.MessagePerformanceInfo); 
               if (fbs != SystemManagerGlobals.topLevelSystemManagers[0]) 
               { 
                   trace(ResourceManager.getInstance().getString( "core", 
                         "remoteClassMemoryLeak",
                         ["mx.messaging.messages.MessagePerformanceInfo","NewApp","_NewApp_FlexInit"]));
               } 
           } 
       } 
       catch (e:Error) 
       { 
           flash.net.registerClassAlias("flex.messaging.messages.MessagePerformanceInfo", mx.messaging.messages.MessagePerformanceInfo); 
           if (fbs != SystemManagerGlobals.topLevelSystemManagers[0]) 
           { 
               trace(ResourceManager.getInstance().getString( "core", 
                     "remoteClassMemoryLeak",
                     ["mx.messaging.messages.MessagePerformanceInfo","NewApp","_NewApp_FlexInit"]));
           } 
       } 

       // mx.messaging.messages.RemotingMessage
       try 
       { 
           if (flash.net.getClassByAlias("flex.messaging.messages.RemotingMessage") != mx.messaging.messages.RemotingMessage) 
           { 
               flash.net.registerClassAlias("flex.messaging.messages.RemotingMessage", mx.messaging.messages.RemotingMessage); 
               if (fbs != SystemManagerGlobals.topLevelSystemManagers[0]) 
               { 
                   trace(ResourceManager.getInstance().getString( "core", 
                         "remoteClassMemoryLeak",
                         ["mx.messaging.messages.RemotingMessage","NewApp","_NewApp_FlexInit"]));
               } 
           } 
       } 
       catch (e:Error) 
       { 
           flash.net.registerClassAlias("flex.messaging.messages.RemotingMessage", mx.messaging.messages.RemotingMessage); 
           if (fbs != SystemManagerGlobals.topLevelSystemManagers[0]) 
           { 
               trace(ResourceManager.getInstance().getString( "core", 
                     "remoteClassMemoryLeak",
                     ["mx.messaging.messages.RemotingMessage","NewApp","_NewApp_FlexInit"]));
           } 
       } 

       // mx.utils.ObjectProxy
       try 
       { 
           if (flash.net.getClassByAlias("flex.messaging.io.ObjectProxy") != mx.utils.ObjectProxy) 
           { 
               flash.net.registerClassAlias("flex.messaging.io.ObjectProxy", mx.utils.ObjectProxy); 
               if (fbs != SystemManagerGlobals.topLevelSystemManagers[0]) 
               { 
                   trace(ResourceManager.getInstance().getString( "core", 
                         "remoteClassMemoryLeak",
                         ["mx.utils.ObjectProxy","NewApp","_NewApp_FlexInit"]));
               } 
           } 
       } 
       catch (e:Error) 
       { 
           flash.net.registerClassAlias("flex.messaging.io.ObjectProxy", mx.utils.ObjectProxy); 
           if (fbs != SystemManagerGlobals.topLevelSystemManagers[0]) 
           { 
               trace(ResourceManager.getInstance().getString( "core", 
                     "remoteClassMemoryLeak",
                     ["mx.utils.ObjectProxy","NewApp","_NewApp_FlexInit"]));
           } 
       } 

       var styleNames:Array = ["lineHeight", "unfocusedTextSelectionColor", "kerning", "showErrorSkin", "digitCase", "inactiveTextSelectionColor", "listAutoPadding", "showErrorTip", "justificationRule", "textDecoration", "dominantBaseline", "fontThickness", "textShadowColor", "trackingRight", "blockProgression", "leadingModel", "listStylePosition", "textAlignLast", "textShadowAlpha", "textAlpha", "letterSpacing", "chromeColor", "rollOverColor", "fontSize", "baselineShift", "focusedTextSelectionColor", "paragraphEndIndent", "fontWeight", "breakOpportunity", "leading", "symbolColor", "renderingMode", "fontSharpness", "paragraphStartIndent", "layoutDirection", "justificationStyle", "wordSpacing", "listStyleType", "contentBackgroundColor", "paragraphSpaceAfter", "contentBackgroundAlpha", "fontAntiAliasType", "textRotation", "errorColor", "cffHinting", "direction", "locale", "backgroundDisabledColor", "digitWidth", "touchDelay", "ligatureLevel", "textIndent", "firstBaselineOffset", "themeColor", "clearFloats", "fontLookup", "tabStops", "paragraphSpaceBefore", "textAlign", "fontFamily", "interactionMode", "lineThrough", "whiteSpaceCollapse", "fontGridFitType", "alignmentBaseline", "trackingLeft", "fontStyle", "dropShadowColor", "accentColor", "disabledColor", "downColor", "focusColor", "textJustify", "color", "alternatingItemColors", "typographicCase"];

       for (var i:int = 0; i < styleNames.length; i++)
       {
          styleManager.registerInheritingStyle(styleNames[i]);
       }

     ServerConfig.xml =
<services>
	<service id="remoting-service">
		<destination id="TestFacade">
			<channels>
				<channel ref="my-amf"/>
			</channels>
		</destination>
	</service>
	<service id="proxy-service">
		<destination id="DefaultHTTP">
			<channels>
				<channel ref="my-amf"/>
			</channels>
		</destination>
	</service>
	<service id="message-service">
	</service>
	<channels>
		<channel id="my-polling-amf" type="mx.messaging.channels.AMFChannel">
			<endpoint uri="http://{server.name}:{server.port}/test/messagebroker/amfpolling"/>
			<properties>
				<polling-enabled>true</polling-enabled>
				<polling-interval-seconds>4</polling-interval-seconds>
			</properties>
		</channel>
		<channel id="my-amf" type="mx.messaging.channels.AMFChannel">
			<endpoint uri="http://{server.name}:{server.port}/test/messagebroker/amf"/>
			<properties>
			</properties>
		</channel>
		<channel id="my-secure-amf" type="mx.messaging.channels.SecureAMFChannel">
			<endpoint uri="https://{server.name}:{server.port}/test/messagebroker/amfsecure"/>
			<properties>
			</properties>
		</channel>
	</channels>
</services>;
   }
   // static references for configured channels
   private static var mx_messaging_channels_SecureAMFChannel_ref:SecureAMFChannel;
   private static var mx_messaging_channels_AMFChannel_ref:AMFChannel;
}  // FlexInit
}  // package
