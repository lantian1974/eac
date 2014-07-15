package org.epmr.desktop.controls
{
	import org.epmr.utils.collection.ArrayList;
	import org.epmr.utils.collection.IList;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.geom.Point;
	import mx.core.UIComponent;
	import mx.effects.Effect;
	import mx.effects.EffectInstance;
	import mx.effects.Move;
	/**
	 *@author  兰天
	 *@date 2008-3
	 * 
	 */
	[Bindable]
	public class MinimizeObjHolderManager extends EventDispatcher
	{
		
		 /**
		    *表示水平方向布局的常量。
		 */
	    public static const DIR_HORIZON:String="Horizon";
		/**
		 *表示竖直方向布局的常量。
		*/
		public static const DIR_VERTICAL:String="vertical";
		/**
		 *存储用于显示最小化对象的容纳位置的列表。
		 */
		private var _minimizeObjHolders:IList; 
		/**
		 *对保存已经最小化对象的列表的引用。
		 */
		private var _minimizeObjList:IList;
		/**
		 *最小化对象显示列表的位置。这个位置是_minimizeObjList的一个合法的index，
		 *表示最小化对象显示列表从_minimizeObjList的哪个index开始将最小化对象在显示位置上显示。
		 * 取值范围为：0<=currentPostion<=_minimizeObjList.size - 1
		 */
        private var currentPostion:int=0;
        /**
        *布局最小化对象显示列表时用于移动最小对象的效果。
        */
        private var moveEffect:Move=new Move();
        /**
        * 最小化对象在布局时移动效果的持续时间，以毫秒为单位。
        */
        private var _mininzeObjMoveEffectDuration:int;
        /**
        * 被最小化后对象的高度
        */
        private var _miniMizeObjHeight:Number;
        /**
        *被最小化后对象的宽度。
        */
        private var _miniMizeObjWidth:Number;
        /**
        * 最小化对象之间的间隔。 
        */
        private var _minimizedObjInterval:Number;
        /**
        *计算最小化对象显示区域的起点全局坐标，并不是第一个最小化对象的全局坐标。
        * 这个坐标所代表的区域可能有一定的边框宽度。
        */
        private var _originPostion:Point;
        /**
        *最小化对象显示区域的宽度。 
        */
        private var _displayAreaWidth:Number;
        /**
        *最小化对象显示区域的高度。
        */
        private var _displayAreaHeight:Number
        /**
        *最小化对象在现实区域的布局方向。
        */
        private var _layoutDir:String;
        /**
        *导航指示器控件在布局方向上的长度。
        */
        private var _indicatorLength:Number;
        /**
        *最小化对象显示区域容器的边框宽度。
        */
        private var _borderWidth:Number;
        
        /**
        *构造函数，用来初始化计算所需各种参数。
        *@param minimizeObjList  对保存已经最小化对象的列表的引用。
        *@param mininzeObjMoveEffectDuration 最小化对象在布局时移动效果的持续时间，以毫秒为单位。
        *@param miniMizeObjHeight  被最小化后对象的高度
        *@param miniMizeObjWidth 被最小化后对象的宽度
        *@param minimizedObjInterval 最小化对象之间的间隔
        *@param originPostion 计算最小化对象显示区域的起点全局坐标，并不是第一个最小化对象的全局坐标。
        *                      这个坐标所代表的区域可能有一定的边框宽度。
        *@param displayAreaHeight 最小化对象显示区域的高度
        *@param displayAreaWidth 最小化对象显示区域的高度
        *@param indicatorLength 导航指示器控件在布局方向上的长度
        *@param borderWidth 最小化对象显示区域容器的边框宽度
        */
        public function MinimizeObjHolderManager(minimizeObjList:IList,mininzeObjMoveEffectDuration:int,
               miniMizeObjHeight:Number,miniMizeObjWidth:Number,minimizedObjInterval:Number,
               originPostion:Point,displayAreaHeight:Number,displayAreaWidth:Number,
               indicatorLength:Number,borderWidth:Number)
		{
		    this._minimizeObjList= minimizeObjList;
		    this._mininzeObjMoveEffectDuration=mininzeObjMoveEffectDuration;
		    this.moveEffect.duration=this._mininzeObjMoveEffectDuration;
		    this._miniMizeObjHeight=miniMizeObjHeight;
		    this._miniMizeObjWidth=miniMizeObjWidth;
		    this._minimizedObjInterval=minimizedObjInterval;
		    this._originPostion=originPostion;
		    this._displayAreaWidth=displayAreaWidth;
		    this._displayAreaHeight=displayAreaHeight;
		    this._indicatorLength=indicatorLength;
		    this._borderWidth=borderWidth;
		    //注意：必须先计算出布局方向，才能生成容纳位置对象列表。
		    this.calculateLayoutDirection();
  	        this._minimizeObjHolders=this.generateHolderList();
		}
		 /**
		 * 布局方向，表示最小化控制其水平布局方向。缺省值为水平方向布局。
		 */
		public function get layoutDir():String
		{
		  return this._layoutDir;
		}
		/**
		 * 该属性表示最小化对象之间的间距，这个间距不一定同初始化时给定的间距相同，
		 * 因为本类计算位置时会优化这个间距，但是可以肯定地是，优化后的间距一定大于给定的间距，
		 * 不会造成两个最小化窗口连在一起的情况。
		 */
		public function get minimizedObjInterval():Number
		{
		   return this._minimizedObjInterval;
		}
		/**
	     *确定布局方向。
         */
	    private function calculateLayoutDirection():void
	    {
			   if (this._displayAreaWidth>=this._displayAreaHeight) 
			   
			   {
			      this._layoutDir=DIR_HORIZON
			   }
			   else
			   {
			      this._layoutDir=DIR_VERTICAL;
			   }
	    }
	    /**
	    *根据初始化数据来生成位置容纳对象列表。
	    *@return IList 位置容纳对象列表。
	    */
		private function generateHolderList():IList
		{
		   
			    var minimizeObjHolderList:IList=new ArrayList();
				var holderSize:int;
				var globalX0:Number;
				var globalY0:Number;
				var i:int;
				var globalPosition:Point;
				var minimizeHolder:MinimizeObjHolder;
			    if (this.layoutDir==DIR_HORIZON)//水平布局的情况下计算最小化对象的容纳位置。
			    { 
	                globalX0=this._originPostion.x+this._borderWidth+this._indicatorLength+this._minimizedObjInterval;
	                globalY0=this._originPostion.y+Math.round((this._displayAreaHeight/2-this._miniMizeObjHeight/2));
	                this._originPostion=new Point(globalX0,globalY0);
			        var realDisplayAreaWidth:Number=this._displayAreaWidth - this._borderWidth*2 - this._indicatorLength*2;
			    	holderSize=Math.floor((realDisplayAreaWidth -this._minimizedObjInterval) /(this._minimizedObjInterval+this._miniMizeObjWidth));
			    	//重新优化最小化对象之间的间隔。
			    	this._minimizedObjInterval=(realDisplayAreaWidth - holderSize*this._miniMizeObjWidth)/(holderSize+1);
			        for(i=0;i<holderSize;i++)
			        {
			            var globalX:int=globalX0+this._minimizedObjInterval*i+this._miniMizeObjWidth * i;
			            globalPosition=new Point(globalX,this._originPostion.y);
			            minimizeHolder=new MinimizeObjHolder(globalPosition);
			            minimizeObjHolderList.add(minimizeHolder);
			        }
			    }
			    else//根据竖直方向的布局来构建每个容纳位置。
			    {
			    	var realDisplayAreaHeight:Number=this._displayAreaHeight - this._borderWidth*2 - this._indicatorLength*2;
			    	holderSize=Math.floor((realDisplayAreaHeight -this._miniMizeObjHeight)/(this._minimizedObjInterval+this._miniMizeObjHeight));
			    	//重新优化最小化对象之间的间隔。
			    	this._minimizedObjInterval=(realDisplayAreaHeight- holderSize*this._miniMizeObjHeight)/(holderSize+1);
			    	globalX0=this._originPostion.x+Math.round((this._displayAreaWidth/2-this._miniMizeObjWidth/2));
			    	globalY0=this._originPostion.y+this._borderWidth+this._indicatorLength+this._minimizedObjInterval;
	                this._originPostion=new Point(globalX0,globalY0);
			    	for(i=0;i<holderSize;i++)
			        {
			            var globalY:int=globalY0+this._minimizedObjInterval*i+this._miniMizeObjHeight * i;
			            globalPosition=new Point(this._originPostion.x,globalY);
			            minimizeHolder=new MinimizeObjHolder(globalPosition);
			            minimizeObjHolderList.add(minimizeHolder);
			        }  
			    }
			    return minimizeObjHolderList;
		}
	
		/**
		 * 是否可以向前滚动。
		 */
	    [Bindable(event="holederLayoutChanged")]
		public function get forwardable():Boolean
		{
		   return this.currentPostion>0
		}
		/**
		 * 是否可以向后滚动。
		 */
		[Bindable(event="holederLayoutChanged")]
		public function get backwordable():Boolean
		{
		   return this.currentPostion<this._minimizeObjList.size-this._minimizeObjHolders.size;
		}
		/**
		 *向前滚动。
		 */
        public function forward():void
        {
           this.currentPostion--;
           this.layoutMinimizeObj(false);
        }
        /**
        *向后滚动。
        */
        public function backward():void
        {
           this.currentPostion++;
           this.layoutMinimizeObj(false);
        } 
        /**
        * 对最小化对象进行布局。
        * @param  autoPostion 是否自动确定当前位置指针。如果为true表示随着当前最小化窗口列表中的元素个数
        * 自动确定最小化窗口显示列表相对于最小化窗口列表的位置并进行布局。如果为false，则表示不改变当前最小化窗口显示列表
        * 相对于最小化窗口列表的位置而进行布局。
        */
        public function layoutMinimizeObj(autoPostion:Boolean=true):void
        {
          if (this._minimizeObjList.size==0) return;
          if (autoPostion)
          {
             this.currentPostion=this._minimizeObjList.size - this._minimizeObjHolders.size;
             if (this.currentPostion<0) this.currentPostion=0;
          }
          for(var i:int=0;i<this._minimizeObjList.size;i++)
          {
               var minimizeObject:UIComponent=this._minimizeObjList.getItem(i);
               if ((i<this.currentPostion)||(i>=(this.currentPostion+this._minimizeObjHolders.size)))
               {
                  if (this._layoutDir==DIR_HORIZON)
                  {
                    minimizeObject.x=(i+1-this.currentPostion)*this._minimizedObjInterval+(i-this.currentPostion)*this._miniMizeObjWidth+this._originPostion.x;
                    minimizeObject.y=this._originPostion.y;
                  }
                  else
                  {
                      minimizeObject.x=this._originPostion.x;
                      minimizeObject.y=(i+1-this.currentPostion)*this._minimizedObjInterval+(i-this.currentPostion)*this._miniMizeObjHeight+this._originPostion.y;
                  }
                  minimizeObject.visible=false;
               }
               else
               {
                  var minimizeObjectHolder:MinimizeObjHolder=this._minimizeObjHolders.getItem(i-this.currentPostion);
                 this.placeMiniObjInHolder(minimizeObjectHolder,minimizeObject);
               }
          }
          this.dispatchEvent(new Event("holederLayoutChanged"));
        }
        /**
        *获得最小化对象的容纳位置对象。
        *@param minimizedObj 被最小化的对象。
        *@return 该最小化对象的容纳位置。
        */
        public function getHoder(minimizedObj:UIComponent):MinimizeObjHolder
        {
           var indexInObjList:int=this._minimizeObjList.indexOf(minimizedObj);
           if (indexInObjList<this.currentPostion)return null;
           if (indexInObjList>=(this._minimizeObjHolders.size+this.currentPostion)) return null;
           var indexInHolderList:int=indexInObjList- this.currentPostion;
           return this._minimizeObjHolders.getItem(indexInHolderList);
        }
        /**
        *获取当前可用最小化窗口摆放位置。
        *@return 可用的位置。
        */
        public function getAvailableDisplayPostion():Point
        {
  
           var index:int=this._minimizeObjList.size>=this._minimizeObjHolders.size ?
                this._minimizeObjHolders.size-1:(this._minimizeObjList.size==0?0:this._minimizeObjList.size-1);
           var minimizeObjHolder:MinimizeObjHolder=this._minimizeObjHolders.getItem(index);
           return minimizeObjHolder.postion;
          
        }
        /**
        *将最小化的对象放入容纳位置。
        *@param holder 容纳位置
        *@param minimizedObj 被最小化的对象。
        */
        private function placeMiniObjInHolder(holder:MinimizeObjHolder,minimizedObj:UIComponent):void
        {
            if ((minimizedObj.x==holder.postion.x)&&(minimizedObj.y==holder.postion.y))
            {
               minimizedObj.visible=true;
               return;	
            } 
            moveEffect.xTo=holder.postion.x;
            moveEffect.yTo=holder.postion.y;
            minimizedObj.visible=true;
            moveEffect.play([minimizedObj]);
           
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
	}
}