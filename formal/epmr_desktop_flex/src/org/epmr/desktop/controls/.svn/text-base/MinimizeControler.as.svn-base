package org.epmr.desktop.controls
{
	import org.epmr.utils.collection.ArrayList;
	import org.epmr.utils.collection.IList;
	import org.epmr.desktop.commonSkins.MinimizeControlerSkin;
	import org.epmr.desktop.events.MinimizeEvent;
	import org.epmr.desktop.events.MinimizeRecoverEvent;
	import org.epmr.desktop.events.RecoverEvent;
	
	import flash.display.DisplayObject;
	import flash.events.ContextMenuEvent;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.ui.ContextMenu;
	import flash.ui.ContextMenuItem;
	import flash.utils.Dictionary;
	
	import mx.containers.Tile;
	import mx.core.FlexGlobals;
	import mx.core.UIComponent;
	import mx.core.UIComponentGlobals;
	import mx.core.mx_internal;
	import mx.effects.Effect;
	import mx.effects.EffectInstance;
	import mx.effects.Parallel;
	import mx.effects.Sequence;
	import mx.events.EffectEvent;
	
	import spark.components.Button;
	import spark.components.Group;
	import spark.components.Label;
	import spark.components.SkinnableContainer;
	import spark.components.supportClasses.SkinnableComponent;
	import spark.effects.Move;
	import spark.effects.Resize;
	import spark.effects.Scale;
	import spark.effects.easing.Bounce;

	use namespace mx_internal;

	public class MinimizeControler extends SkinnableComponent
	{
		   
	    	[SkinPart(required="true")]
		    public var leftIndicator:Button=null;
			
			[SkinPart(required="true")]
		    public var rightIndicator:Button=null;
			
			[SkinPart(required="false")]
			public  var windowTitleLabel:Label=null;
			[Inspectable(category="General", defaultValue="300")]
			public var minimizeDuration:Number=300;
			
			[Inspectable(category="General", defaultValue="300")]
			public var recoverDuration:Number=300;
			
			[Inspectable(category="General", defaultValue="300")]
			public var hintZoomDuration:Number=300;
			
			[Inspectable(category="General", defaultValue="300")]
			public var showTitleDuration:Number=300;
			
			[Inspectable(category="General", defaultValue="300")]
			public var hintTitleStyleName:Number=300;
			
			[Inspectable(category="General", defaultValue="300")]
			public var mininzeObjMoveEffectDuration:Number=300;
			
			
			[Inspectable(category="General", defaultValue="50")]
		    /**
		    *最小化后窗口的宽度，以像素为单位，缺省值为50。
		    */
		    public var minimizedWidth:Number=50;
		    /**
		    *最小化后窗口的高度，以像素为单为，缺省值为50。
		    */
			[Inspectable(category="General", defaultValue="50")]
		    public var minimizedHeight:Number=50;
		    /**
		    *最小化控制器是否自动可见，设置为true表示没有窗口被最小化时，最小化控制器不会出现，当有窗口被最小化
		    *时，最小化控制其才可见。设置为false，表示无论是否有窗口被最小化，最小化控制器总是会出现。缺省值为true。
		    */
			[Inspectable(category="General", defaultValue="true")]
		    public var autoVisible:Boolean=true;
		  
			[Inspectable(category="General", defaultValue="30")]
		    /**
		    *最小化控制器中的导航指示器的长度，以像素作为单位。对于水平布局时，表示宽度，对于竖直布局时表示高度。缺省值为30。
		    */
		    public var indicatorLength:int=30;
			[Inspectable(category="General", defaultValue="8")]
		    /**
		    *窗口被最小化后在最小化控制器中的间距，以像素为单位，缺省值为8。
		    */
		    public var minimizedObjInterval:int=8;
		   
		    /**
		    *存储对象化对象及其位置及尺寸数据的映射。
		    */
			protected var minimizedObjectDic:Dictionary=new Dictionary();
			/**
		    *存储已经被最小化的对象的列表。
		    */
			protected var minimizedObjectList:IList=new ArrayList;
			/**
		    *最小化对象容纳位置管理器。位置容纳管理器用来完成最小化对象在最小化控制器中的
		    *顺序排列，计算当前被最小化的窗口应该放在何位置。
		    */
		    [Bindable]
			protected var minimizeObjHolderManager:MinimizeObjHolderManager=null;
			/**
		     *当鼠标移入最小化窗口上时弹出的用于显示鼠标当前所在窗口标题的文本标签。
		     */
		
			/**
			 *当鼠标移入最小化窗口上时弹出的用于显示鼠标当前所在窗口标题的文本标签。
			 *暴露这个只读属性使得开发者可以通过程序来设定这个控件的样式。
			 */
		    private static const DEFAULT_HINT_TITLE_STYLE_NAME:String=".defaultHintTitleStyle";
		    private var showHintEffect:Scale=null;
		    private var hideHintEffect:Sequence=null;
		    private var hideHintZoom:Scale=null;
		    private var hideHintMove:Move=null;
		    private var minimizeEffect:Parallel=null;
		    private var  miniZoomEffect:Scale=null;
			private var  miniMoveEffect:Move=null;
			private var recoverEffect:Parallel=null; 
            private var recoverMoveEffect:Move=null;
            private var moveWindowTitleForShow:Move=null;
        /**
        *构造函数
        */
		 public function MinimizeControler()
		 {
			   super();
			   this.setStyle("skinClass",MinimizeControlerSkin);
			  
			   
			   this.addEventListener(Event.ADDED_TO_STAGE,this.addStageListener,false,0,true);
			  
		 }
		 override protected function partAdded(partName:String, instance:Object):void
		 {
			 super.partAdded(partName,instance);
			 if(instance==this.leftIndicator)
			 {
				 this.leftIndicator.explicitWidth = this.leftIndicator.explicitHeight = 30;
				 this.leftIndicator.focusEnabled =false;
				 this.leftIndicator.addEventListener(MouseEvent.CLICK,
					 leftIndicator_clickHandler,false,0,true);
			 }
			 if(instance==this.rightIndicator)
			 {
				 
				 this.rightIndicator.explicitWidth = this.rightIndicator.explicitHeight = 30;
				 this.rightIndicator.focusEnabled =false;
				 this.rightIndicator.addEventListener(MouseEvent.CLICK,
				 rightIndicator_clickHandler,false,0,true);
			 }
			
		 }
		 override protected function partRemoved(partName:String, instance:Object):void
		 {
			 super.partRemoved(partName,instance);
			 if(instance==this.leftIndicator)
			 {
				 
				 this.leftIndicator.removeEventListener(MouseEvent.CLICK,
					 leftIndicator_clickHandler);
			 }
			 if(!this.rightIndicator)
			 {
				 this.rightIndicator.removeEventListener(MouseEvent.CLICK,
					 rightIndicator_clickHandler);
			 } 
		
		 }
		 override protected function getCurrentSkinState():String
		 {
			 if (this.minimizeObjHolderManager==null)
			 {
			   return "noOverFlow";
			 }
			 var curSate:String;
			 if (this.minimizeObjHolderManager.forwardable && this.minimizeObjHolderManager.backwordable)
				 curSate="bothOverFlow";
			 else if (this.minimizeObjHolderManager.forwardable &&(!this.minimizeObjHolderManager.backwordable))
				 curSate="rightMostOverFlow";
			 else if ((!minimizeObjHolderManager.forwardable)&&this.minimizeObjHolderManager.backwordable)
				 curSate="leftMostOverFlow";
			 else 
				 curSate="noOverFlow";
			 return curSate;
		 }
		
		   /**
		    *
		    */
		    private function  createMoveWindowTitleForShowEffect():void
		    {
		        if(this.moveWindowTitleForShow!=null) return;
		        this.moveWindowTitleForShow=new Move();
		        moveWindowTitleForShow.duration=showTitleDuration;
		        moveWindowTitleForShow.easer=new spark.effects.easing.Bounce()
		    }
		    /**
		    * 
		    */
		    private function createShowHintEffect():void
		    {
		       if (this.showHintEffect!=null) return;
		       this.showHintEffect=new Scale();
		       this.showHintEffect.duration=hintZoomDuration;
		    }
		    /**
		    * 
		    */
		    private function createHideHintZoom():void
		    {
		       if (this.hideHintZoom!=null) return ;
		       this.hideHintZoom=new Scale();
		    }
		    /**
		    *
		    */
		    private function createHideHintMove():void
		    {
		       if (this.hideHintMove!=null) return;
		       this.hideHintMove=new Move();
		       this.hideHintMove.duration=1;
		    }
		    /**
		    * 
		    */
		    private function createHideHintEffect():void
		    {
		        if (this.hideHintEffect!=null) return;
		        this.createHideHintZoom();
		        this.createHideHintMove();
		        this.hideHintEffect=new Sequence();
		        this.hideHintEffect.duration=hintZoomDuration;
		        this.hideHintEffect.addChild(this.hideHintZoom);
		        this.hideHintEffect.addChild(this.hideHintMove);
		    }
		    /**
		    **/
		   
		    private function createMiniZoomEffect():void
		    {
		       if (this.miniZoomEffect!=null) return;
		       this.miniZoomEffect=new Scale();
		    } 
		    /**
		    *
		    */
		    private function createMiniMoveEffect():void
		    {
		       if(this.miniMoveEffect!=null) return;
		       this.miniMoveEffect=new Move();
		    }
		    /**
		    * 创建窗口的最小化效果，即窗口缩小的同时移动到指定位置。
		    */
		    private function createMinimizeEffect():void
		    {
		       if (this.minimizeEffect!=null) return;
			   this.minimizeEffect=new Parallel();
		       this.createMiniMoveEffect();
		       this.createMiniZoomEffect();
			
			   minimizeEffect.addChild(this.miniMoveEffect);
			   minimizeEffect.addChild(this.miniZoomEffect);
		       this.minimizeEffect.duration=this.minimizeDuration;
			   this.minimizeEffect.addEventListener(EffectEvent.EFFECT_END,this.onMinimizeEnd,false,0,true);
		    }
		    /**
		    *
		    */
		    private function createRecoverMoveEffect():void
		    {
		       if (this.recoverMoveEffect!=null) return;
		       this.recoverMoveEffect=new Move();
		    }
		   
		    /**
		     *
		     */
		    private function createRecoverEffect():void
		    {
		       if (this.recoverEffect!=null) return;
			   this.recoverEffect=new Parallel();
		       this.createRecoverMoveEffect();
		       var recoverZoom:Scale=new Scale();
		       recoverZoom.scaleXTo=1.0;
		       recoverZoom.scaleYTo=1.0;
			   this.recoverEffect.addChild(this.recoverMoveEffect);
		       this.recoverEffect.addChild(recoverZoom);
		       this.recoverEffect.duration=recoverDuration;
		       this.recoverEffect.addEventListener(EffectEvent.EFFECT_END,this.onRecoverEnd,false,0,true);
		    }
		    /**
		    *
		    */
		    override protected function createChildren():void
		    {
		       super.createChildren();
		       this.addRecoverAllMenue();
		       this.createMoveWindowTitleForShowEffect();
		       this.createShowHintEffect();
		       this.createHideHintEffect();
		       this.createMinimizeEffect();
		       this.createRecoverEffect();
			   this.windowTitleLabel=new Label();
			   this.windowTitleLabel.setStyle("alpha",1.0);
			   this.windowTitleLabel.setStyle("color",0xF5F7F8);
			   this.windowTitleLabel.setStyle("fontFamily","宋体");
			   this.windowTitleLabel.setStyle("fontWeight","bold");
			   this.windowTitleLabel.setStyle("fontSize",12);
			   this.windowTitleLabel.setStyle("textAlign","center");
			   this.windowTitleLabel.width=110;
			   this.windowTitleLabel.visible=false;
			  
		    }
		    /**
		    *
		    */
		    private function leftIndicator_clickHandler(event:MouseEvent):void
		    {
		       this.navigateForward();
		    }
		    /**
		    *
		    */
		    private function  rightIndicator_clickHandler(event:MouseEvent):void
		    {
		       this.navigateBackward();
		    }
		    /**
		    *
		    */
		    protected override function measure():void
            {
                  super.measure();
                  this.measuredHeight=this.minimizedHeight+10;
                  this.measuredWidth=this.indicatorLength*2+20;
            }
            /**
            *
            */
            private function onLayoutChange(event:Event):void
	        {
	           if (this.leftIndicator)
	           {
	              this.leftIndicator.visible=this.minimizeObjHolderManager.forwardable||this.minimizeObjHolderManager.backwordable;
	              this.leftIndicator.enabled=this.minimizeObjHolderManager.forwardable;
	            
	           }
	           if(this.rightIndicator)
	           {
	             this.rightIndicator.visible=this.minimizeObjHolderManager.forwardable||this.minimizeObjHolderManager.backwordable;
	             this.rightIndicator.enabled=this.minimizeObjHolderManager.backwordable;
	           }
	        } 
	        /**
	        * 
	        */
		    override protected  function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void
		    {
		      
		        super.updateDisplayList(unscaledWidth,unscaledHeight);
		            //创建最小化对象位置容纳管理器。
		        if (!mx.core.UIComponentGlobals.designMode)
		        {
                 this.minimizeObjHolderManager=null;
                 this.minimizeObjHolderManager=this.createMinimizeObjHolderManager();
                 this.minimizeObjHolderManager.addEventListener("holederLayoutChanged",onLayoutChange,false,0,true);
                 this.minimizeObjHolderManager.layoutMinimizeObj(true);
                }
                else
                {
                   this.setStyle("borderStyle","solid");
	               this.setStyle("borderColor",0x3F5A35);
	               this.setStyle("borderThickness",1);
                }

			  //画出导航指示器。
			    this.drawIndicator();	 
              //增加最小化管理器的尺寸变形事件的处理方法，使得在设计期或者运行期让布局跟随最小化器的尺寸变化。
			 //   this.addEventListener(ResizeEvent.RESIZE,this.doOnResize);
			  //为最小化管理器增加“全部还原”的系统菜单项。
		    }
		  
		  
			/**
		    *处理系统菜单项目-"全部还原"被点击事件。
		    */
			private function onMenuItemSelect(event:ContextMenuEvent):void
			{ 
			    this.recoverAll();
			}
			/**
		    *该方法在最小化控制器上增加了一个系统菜单项目-"全部还原"，这个菜单项能够将已经最小化的所有
		    * 窗口对象全部还原。
		    */
		    private static const RECOVER_ALL_MENU_CAPTION:String="还原所有最小化窗口";
			private function addRecoverAllMenue():void
			{
			  //创建上下文菜单。
			  if (!this.parentApplication.contextMenu)
			  { 
			     var contextMenue:ContextMenu=new  ContextMenu();
			     this.parentApplication.contextMenu=contextMenue;
			  }
			  this.parentApplication.contextMenu.addEventListener(ContextMenuEvent.MENU_SELECT,addRecoverAllMenueItem,false,0,true);
			  this.parentApplication.contextMenu.hideBuiltInItems();
			     //创建上下文菜单项
			
			}
			private function getRecoverAllMenuIndex():int
			{
			       for(var i:int=0;i<this.parentApplication.contextMenu.customItems.length;i++)
			       {
			          var iContextMenueItem:ContextMenuItem=this.parentApplication.contextMenu.customItems[i];
			          if (iContextMenueItem.caption==RECOVER_ALL_MENU_CAPTION)
			          {
			             return i;
			          }
			       }
			       return -1;
			}
			private function addRecoverAllMenueItem(event:Event):void
			{
			   var index:int=this.getRecoverAllMenuIndex();
			   var contextMenueItem:ContextMenuItem=null;
			   if (index<0)
			   {
			      contextMenueItem=new ContextMenuItem(RECOVER_ALL_MENU_CAPTION,true);
			      //为上下文菜单项增加事件监听器。
			      contextMenueItem.addEventListener(ContextMenuEvent.MENU_ITEM_SELECT,onMenuItemSelect,false,0,true);
			      //将上下文菜单项添加到菜单中。
			      this.parentApplication.contextMenu.customItems.push(contextMenueItem);
			   }
			   else
			   {
			      contextMenueItem=this.parentApplication.contextMenu.customItems[index];
			   }
			   contextMenueItem.enabled=(this.minimizedObjectList.size>0);
			}
			/**
		    *判断指定的对象上是否正在播放指定的效果。 
		    *@param uiComponent 指定的对象。
		    *@param effect 指定的效果。
		    */
			private function isEffectPlayingOn(uiComponent:UIComponent,effect:Effect):Boolean
			{
			   if (uiComponent==null)return false;
			   if (uiComponent.activeEffects==null) false;
	           if(uiComponent.activeEffects.length==0) false;
	           for(var i:int=0;i<uiComponent.activeEffects.length;i++)
	           {
	                 var effectInstance:EffectInstance=uiComponent.activeEffects[i];
	                 if (effectInstance.effect==effect)
	                 {
	                   return true;
	                 }
	           }
	           return false;
			}
			/**
		    *指定对象是否在执行还原效果。
		    *@param uiComponent 指定的对象，主要是窗口对象。
		    *@return true表示对象正在执行还原效果， false表示对象当前未执行还原效果。
		    */
			private function isRecovering(uiComponent:UIComponent):Boolean
			{
			   var result:Boolean=this.isEffectPlayingOn(uiComponent,this.recoverEffect);
			   return result;
			}
			/**
		    *指定对象是否正在执行最小化效果。
		    *@param uiComponent 指定的对象。
		    *@return true表示该对象正在执行最小化效果，false表示该对象当前未执行最小化效果。
		    */
			private function isMinimizing(uiComponent:UIComponent):Boolean
			{
			     var result:Boolean=this.isEffectPlayingOn(uiComponent,this.minimizeEffect);
			     return result;
			}
			
			/**
		    *创建最小化窗口的容纳位置管理器。容纳位置管理器存储了一个初始化后即固定下来的位置列表。
		    */
			private function createMinimizeObjHolderManager():MinimizeObjHolderManager
			{
			    if (mx.core.UIComponentGlobals.designMode) return null;
			    var borderThickness:Number=this.getStyle("borderThickness");
			    var orginPostion:Point=this.localToGlobal(new Point(0,0));
			    var mininzeObjMoveEffectDuration:Number=this.getStyle("mininzeObjMoveEffectDuration");
			    var holderManger:MinimizeObjHolderManager=new MinimizeObjHolderManager(
			   
			    this.minimizedObjectList,mininzeObjMoveEffectDuration,this.minimizedHeight,
			    this.minimizedWidth,this.minimizedObjInterval,orginPostion,this.height,this.width,
                this.indicatorLength,borderThickness);
     	    	return holderManger;
			    
			}
		    /**
		    *画出导航指示器。
		    */
			private function drawIndicator():void
			{
			    //获取最小化控制其的边框的宽度。
			    var borderThickness:Number=this.getStyle("borderThickness");
			   //按照水平方向布局画出导航指示器。
			    if (this.width>=this.height)
			    {
			      this.leftIndicator.height=this.indicatorLength;
			      this.leftIndicator.width=this.indicatorLength;
			      this.leftIndicator.move(0,(this.height-this.indicatorLength)/2);
			      this.rightIndicator.height=this.indicatorLength;
			      this.rightIndicator.width=this.indicatorLength;
			      this.rightIndicator.move(this.width-2*borderThickness - this.rightIndicator.width,
			                                       (this.height-this.indicatorLength)/2);
			    }
			    else //按照垂直方向画出导航指示器。
			    {
			      
			      this.leftIndicator.width=this.width-2*borderThickness;
			      this.leftIndicator.height=this.indicatorLength;
			      this.leftIndicator.x=0;
			      this.leftIndicator.y=0; 
			      this.rightIndicator.width=this.width-2*borderThickness;
			      this.rightIndicator.height=this.indicatorLength;
			      this.rightIndicator.x=0;
			      this.rightIndicator.y=this.height-2*borderThickness- this.rightIndicator.height;			    
			    }
			}
			/**
			 * 向指定的对象添加最小化监听器。以处理监听到的可交互对象发出的最小化事件。
			 * 缺省情况下，将监听器添加给舞台。如果有其他的窗口要处理其子窗口的最小化事件，
			 * 则将这个窗口对象设置为minimizeEventTopListener属性。
			 */
			private function  addStageListener(event:Event):void
			{	 
				this.parentApplication.addElement(this.windowTitleLabel);
				this.stage.addEventListener(MinimizeEvent.MINIMIZE,handleObjectMinimize,false,-99,true);
			    this.stage.addEventListener(RecoverEvent.RECOVER,handleObjectRecover,false,-99,true);
			}
			/**
			 *最小化事件处理器,处理器用于处理截获的最小化事件，将事件中传递过来的可交互对象进行最小化。
			 *@event 最小化事件。 
			 */
			private function handleObjectMinimize( event:MinimizeEvent):void
			{
			   var minimizedObj:UIComponent= event.minimizedObject;
			   this.minimize(minimizedObj);
			  
			}
			private function handleObjectRecover(event:RecoverEvent):void
			{
			    var minimizedObj:UIComponent= event.minimizedObject;
			    this.recover(minimizedObj);
			}
			/**
			 *实现最小化。
			 */
		    private function minimize(minimizedObj:UIComponent):void
			{
			   if (this.minimizedObjectList.indexOf(minimizedObj)>=0) return;
			   if (this.isMinimizing(minimizedObj)) return;
			   if (this.isRecovering(minimizedObj)) return;
			  
			   //因为最小化是用效果来实现的，所以在执行最小化之前必须结束所有作用在该对象上的效果。
			   minimizedObj.endEffectsStarted();
			   //获取并保存即将被最小化窗口的当前位置形状信息。 
			   var oldState:ComponentShapeState=ComponentShapeState.getComponentShapeState(minimizedObj);
			   this.minimizedObjectDic[minimizedObj]=oldState;
			   trace("minimize:" ,minimizedObj,"width="+oldState.width+": height="+oldState.height);
			   this.addCovering(minimizedObj);
			   //屏蔽（捕获）被最小化窗口的上的鼠标键盘事件，防止在最小化过程中用户的鼠标键盘操作造成的误操作。
			  
			   this.captureMinimizeObjEvent(minimizedObj);
			   minimizedObj.visible=true;
			  
			   this.minimizedObjectList.add(minimizedObj);
			   if (minimizedObj is MinizableTitleWindow)
			   {
			      var mw:MinizableTitleWindow=minimizedObj as MinizableTitleWindow;
			      mw.windowMinimized=true;
			   }
			   this.minimizeWithEffect(minimizedObj,this.minimizeObjHolderManager.getAvailableDisplayPostion());
			}
		
			/**
			 * 为最小化对象添加遮盖物，使得窗口上的控件在最小化后不再接受用户鼠标或键盘的输入，
			 * 从而避免窗口最小化后的误操作。
			 */
			private function  addCovering(minimizedObj:UIComponent):void
			{
			      if (minimizedObj.numChildren==0) return ;
			      var covering:Group=new Group();
				  if(minimizedObj is SkinnableContainer)
				  {
				     SkinnableContainer(minimizedObj).addElement(covering);
				  }
				  else 
				  {
					  minimizedObj.addChild(covering);
				  }
	 		      covering.percentHeight=100;
	 		      covering.percentWidth=100;
		    	  covering.x=0;
	 		      covering.y=0;
	 		      covering.addEventListener(MouseEvent.CLICK,onMouseClickMinizeObject,true,99,true);
	 		      
			}
			/**
			 *移出最小化窗口上的遮盖物，使得最小化窗口恢复键盘及鼠标能力。
			 */
			private function removeCovering(minimizedObj:UIComponent):void
			{
			      
			      if( minimizedObj is SkinnableContainer)
				  {
					 var sConContainer:SkinnableContainer= SkinnableContainer(minimizedObj);
					 sConContainer.removeElementAt(sConContainer.numElements-1);
				  }	
				  else
				  {
					  minimizedObj.removeChildAt(minimizedObj.numChildren-1);
				  }
				
			}
		
			
			/**
			 * 判断给定的人机交互对象是否已经被最小化。
			 * @param interactiveObject 需要判定是否最小化的人机交互对象。
			 * @return 如果返回true,则说明已最小化，false说明未最小化或者给定的对象为null。
			 */
			public function isMinimized(interactiveObject:UIComponent):Boolean
			{
			   return this.minimizedObjectList.indexOf(interactiveObject)>=0;
			}
		    /**
		    * 将被最小化对象还原。
		    * @param minimizedObj 被最小化的对象。
		    */
	        public function recover( minimizedObj:UIComponent):void
	        {
	             if (this.minimizedObjectList.indexOf(minimizedObj)<0) return;
	             if (this.isMinimizing(minimizedObj)) return;
			     if (this.isRecovering(minimizedObj)) return;
			     minimizedObj.endEffectsStarted();
	             minimizedObj.removeEventListener(MouseEvent.ROLL_OVER,this.doShowHintEffect,false);
			     minimizedObj.removeEventListener(MouseEvent.ROLL_OUT,this.doShowHintEffect,false);
	           /* 清除处理最小化时添加到被最小化的对象上的事件监听器 */
	            
	             this.recoverWithEffect(minimizedObj);
	              
	        }
	        /**
	        *将给定列表中所有的窗口最小化。
	        *@param ObjListTominimized 要被最小化的窗口列表。
	        */
	        public function minimizeAll(ObjListTominimized:IList):void
	        {
	           for(var i:int=0;i<ObjListTominimized.size;i++)
	           {
	           	  var minimizedObj:UIComponent=ObjListTominimized.getItem(i) as UIComponent; 
	           	  this.minimize(minimizedObj);
	           }
	        }
	        /**
	        *恢复所有已经被最小化的窗口。
	        */ 
	        public function recoverAll():void
	        {
	            for(var i:int=this.minimizedObjectList.size-1;i>=0;i--)
	            {
	              var minimizedObj:UIComponent= this.minimizedObjectList.getItem(i) as UIComponent;
	              this.recover(minimizedObj);
	            }
	        }
	       /**
	        *处理鼠标点击到被最小化窗口上的事件。 
	        */
	        private function onMouseClickMinizeObject(event:Event):void
	        {
	           var minimizedObj:UIComponent=  event.currentTarget as UIComponent;
	           //恢复窗口。
	           this.recover(minimizedObj); 	
	           //立即截断后续的鼠标点击侦听事件，避免在窗口恢复过程中用户点击窗口造成误操作。
	           event.stopImmediatePropagation()
	        }
	       /**
	        *使用效果来实现窗口的最小化。
	        */
	        private function minimizeWithEffect(minimizeObj:UIComponent,position:Point):void
	        {
	                //将窗口的宽度缩放比例设置为窗口的最小化后的宽度除以窗口高度
	             this.miniZoomEffect.scaleXTo=this.minimizedWidth/minimizeObj.width;
	              //将窗口的高度缩放比例设置为窗口的最小化后的高度除以窗口高度
	             this.miniZoomEffect.scaleYTo=this.minimizedHeight/minimizeObj.height;
	             //将被最小化后的窗口位置移动到指定的位置。
	             this.miniMoveEffect.xTo=position.x;
	             this.miniMoveEffect.yTo=position.y;
	             this.minimizeEffect.target=minimizeObj;
	             //播放效果。
                 this.minimizeEffect.play();  
	        }
	        /**
		    *处理最小化效果结束后的事件。
		    */
	        private function onMinimizeEnd(event:EffectEvent):void
	        {
	           var minimizedObj:UIComponent=event.effectInstance.target as UIComponent;
			   this.visible=this.autoVisible?(this.minimizedObjectList.size>0):this.visible;
			 //  this.invalidateDisplayList();
			   //将最小化后的窗口隐藏，是否决定这个被最小化的窗口被显示，是在布局最小化窗口之中处理。
			   minimizedObj.visible=false;
			   this.layoutMinimizeObj();
			   //设置当鼠标移入和移出被最小化窗口上时的事件处理方法。 
			   minimizedObj.addEventListener(MouseEvent.ROLL_OVER,this.doShowHintEffect,false,99,true);
			   minimizedObj.addEventListener(MouseEvent.ROLL_OUT,this.doShowHintEffect,false,99,true);
			  
	        }
			private function layoutMinimizeObj():void
			{
				this.minimizeObjHolderManager.layoutMinimizeObj();
				this.invalidateSkinState();
			}
	        /**
	        * 播放效果来恢复被最小化的窗口。将窗口恢复到原先的位置、高宽的缩放比例为1，长、宽为原来的长宽。
	        */	
	        private function recoverWithEffect(minimizeObj:UIComponent):void
	        {
	            
	             if (!minimizeObj.visible) minimizeObj.visible=true;
	             if (this.minimizedObjectList.indexOf(minimizeObj)<0)return;        
	             //获得窗口被最小化之前的形状状态。
	             var shapeState:ComponentShapeState=this.minimizedObjectDic[minimizeObj] as ComponentShapeState;
	             if (shapeState==null)
	             {
	                throw new Error("无法找到被最小化的窗口的状态信息！"); 
	                trace("error: can not find state for "+minimizedObj);
	                return;
	             }
	             //有可能窗口的标题文字被显示了，所以要将其隐藏。
	             this.windowTitleLabel.visible=false;
				 
				 this.recoverEffect.target=minimizeObj;
	             //指定移动效果的位置为最小化之前的位置。 
	             this.recoverMoveEffect.xTo=shapeState.position.x;
	             this.recoverMoveEffect.yTo=shapeState.position.y;
	             this.minimizedObjectList.remove(minimizeObj);
	             this.recoverEffect.play();   
	        }
	       /**
	        *处理窗口还原效果结束之后的事件。 
	        */	
	        private function onRecoverEnd(event:EffectEvent):void
	        {
	           var minimizedObj:UIComponent=event.effectInstance.target as UIComponent;
	          //清理保存的窗口被最小化之间的状态条目。
	           var state:ComponentShapeState=this.minimizedObjectDic[minimizedObj] as ComponentShapeState;
	          //从已被最小化的窗口列表中移出该窗口对象。
	           delete this.minimizedObjectDic[minimizedObj];	
	           //恢复在最小化时被屏蔽的窗口事件。
	           this.recoverCapturedMinimizeObjEvent(minimizedObj);  
	           this.removeCovering(minimizedObj);
			   this.layoutMinimizeObj();
	           //发出窗口已被还原的事件。
	           this.dispatchRecoverEvent(minimizedObj); 
               this.visible=this.autoVisible?(this.minimizedObjectList.size>0):this.visible;
               if (minimizedObj is MinizableTitleWindow)
			   {
			      var mw:MinizableTitleWindow=minimizedObj as MinizableTitleWindow;
			      mw.windowMinimized=false;
				  mw.currentState="";
			   }
	        }
	   
	        private function dispatchRecoverEvent(minimizedObj:UIComponent):void
	        {
	            for(var i:int=0;i<minimizedObj.numChildren;i++)
	            {
	               var child:DisplayObject=minimizedObj.getChildAt(i);
	               child.dispatchEvent(new MinimizeRecoverEvent(MinimizeRecoverEvent.MINIMIZE_RECOVER,minimizedObj));
	            }
	            this.dispatchEvent(new MinimizeRecoverEvent(MinimizeRecoverEvent.MINIMIZE_RECOVER,minimizedObj));
	        }
	        /**
		    *获得被最小化的窗口的标题字符串。如果窗口控件有title属性，则用title属性作为
		    * 窗口标题字符串，如果没有该属性，则用窗口的label属性作为窗口标题字符串，
		    * 如果没有该属性，则用text属性作为窗口的标题字符串，如果没有该属性，则返回空字符串。
		    */
	        private function getWindowTitle(minimizedObj:UIComponent):String
	        {
	             if (minimizedObj.hasOwnProperty("title"))
	             {
	               return minimizedObj["title"];
	             }
	             else if(minimizedObj.hasOwnProperty("label"))
	             {
	               return minimizedObj["label"];
	             }
	             else if(minimizedObj.hasOwnProperty("text"))
	             {
	               return minimizedObj["text"];
	             }
	             else
	             {
	               return "未命名窗口";
	             }
	        }
	        /**
		    *执行显示当前被最小化窗口的提示效果，当鼠标移动到最小化后的窗口上时，该窗口会放大，同时从底部
		    * 弹出窗口的title文字并振荡几下。显示窗口标题的文字是一个预先创建好的文本标签控件。 
		    * 窗口放大的效果作用在窗口组件上，文字弹出效果作用在显示窗口标题的文字上。
		    */
	        private function doShowHintEffect(event:MouseEvent):void
	        {
	             
	              var minimizedObj:UIComponent=event.target as UIComponent;
	              if (this.minimizedObjectList.indexOf(minimizedObj)<0)return;
	              try
	              {    
					  //结束正在进行的效果
					minimizedObj.endEffectsStarted();  
	                windowTitleLabel.endEffectsStarted();
	              }
	              catch(error:Error)
	              {
	              	trace("error ocure");
	              }
	                //获取当前窗口标题
	              this.windowTitleLabel.text=this.getWindowTitle(minimizedObj);
	              //获取当前窗口在未最小化时的形状状态。
	              var state:ComponentShapeState=this.minimizedObjectDic[minimizedObj] as ComponentShapeState;
	              if (state==null)
	              {
	                throw new Error("无法找到被最小化的窗口的状态信息！"); 
	                trace("error: can not find state for "+minimizedObj);
	                return;
	              }
                  //鼠标移动到被最小化窗口上时，执行窗口放大和弹出文字效果。
	              if (event.type==MouseEvent.ROLL_OVER)
	              { 
	                //将显示窗口标题的位置设置为最小化窗口的底部位置。 
					 
	                this.windowTitleLabel.x=minimizedObj.x+this.minimizedWidth/2-this.windowTitleLabel.width/2;;
	                this.windowTitleLabel.y=minimizedObj.y + this.minimizedHeight-this.windowTitleLabel.height ;
	                this.windowTitleLabel.visible=true;
	                //播放窗口标题文字移动效果。
	                this.moveWindowTitleForShow.yTo=minimizedObj.y - this.minimizedWidth*0.7;
                      //将被最小化窗口的放大比例设置为刚好放大到最小化窗口之间的间隔距离（注意，是左右缩放的距离加在一起是间隔距离）
					this.showHintEffect.scaleXTo=(this.minimizedWidth+this.minimizedObjInterval)/state.width;
                    this.showHintEffect.scaleYTo=(this.minimizedHeight+this.minimizedObjInterval)/state.height;       
	                this.showHintEffect.play([minimizedObj]);
	                //播放被最小化后的窗口放大效果。
	                this.moveWindowTitleForShow.play([this.windowTitleLabel]);
	              }
	              else  //当鼠标离开被最小化窗口时，窗口恢复到最小化状态，并隐藏窗口标题文字。
	              {
	              	 //隐藏窗口标题文字。

	              	 this.windowTitleLabel.visible=false;
	                 //使得窗口缩放到最小化时的比例，并回到最小化时的位置。
	                 this.hideHintZoom.scaleXTo=this.minimizedWidth/state.width;
					 this.hideHintZoom.scaleYTo=this.minimizedHeight/state.height;
	              	 var minimizeObjHolder:MinimizeObjHolder=this.minimizeObjHolderManager.getHoder(minimizedObj);
	              	 if(minimizeObjHolder!=null)
	              	 {
	              	   this.hideHintMove.xTo=minimizeObjHolder.postion.x;
	              	   this.hideHintMove.yTo=minimizeObjHolder.postion.y;
	              	 }
	              	  this.hideHintEffect.play([minimizedObj]);
	              }
	              event.stopImmediatePropagation();
	        }
	        /**
		    *捕获要被最小化的窗口（对象）的事件，以使这些事件失效。
		    *以较高优先级捕获这些窗口的点击事件，在最小化后，窗口上原来的鼠标点击事件就不会被触发。
		    *本方法可以考虑捕获更多的键盘和鼠标事件，防止在最小化时出现意外输入。 
		    */
	        private function captureMinimizeObjEvent(minimizedObj:UIComponent):void
	        {
	            minimizedObj.addEventListener(MouseEvent.CLICK,onMouseClickMinizeObject,true,99,true);
	           
	        }
	        /**
		    *恢复被最小化的窗口上被捕捉的事件，使得窗口在还原后，鼠标键盘事件可以被正常响应。
		    */
	        private function recoverCapturedMinimizeObjEvent(minimizedObj:UIComponent):void
	        { 
	             minimizedObj.removeEventListener(MouseEvent.CLICK,onMouseClickMinizeObject,true);
	        }
	        /**
	        *向前导航最小化窗口显示列表。
	        */
	        private function navigateForward():void
	        {
	           if( this.minimizeObjHolderManager.forwardable)
	           {
	             this.minimizeObjHolderManager.forward();
	           }
	        }
	        /**
	        *向后导航最小化窗口显示列表。
	        */
	        private function navigateBackward():void
	        {
	           if (this.minimizeObjHolderManager.backwordable)
	           {
	              this.minimizeObjHolderManager.backward();
	           }
	        }
	}
}