package org.epmr.facility.view
{
	import flash.display.Sprite;
	import flash.events.ErrorEvent;
	import mx.controls.Alert;
	import mx.messaging.messages.ErrorMessage;
	import mx.rpc.Fault;
	import mx.rpc.events.FaultEvent;
	import mx.utils.StringUtil;
	
	public class MessageBox  
	{
		[Embed(source="resources/tip.gif")]
		public static const TIP:Class;
		
		[Embed(source="resources/note.gif")]
		public static const NOTE:Class;
		
		[Embed(source="resources/confirm.gif")]
		public static const CONFIRM:Class;
		
		[Embed(source="resources/warning.gif")]
		public static const WARNING:Class;
		
		[Embed(source="resources/error.gif")]
		public static const ERROR:Class;
		
		private static const TIP_TITLE:String="提示";
		private static const NOTE_TITLE:String="注意";
		private static const CONFIRM_TITLE:String="确认";
		private static const WARNING_TITLE:String="警告";
		private static const ERROR_TITLE:String="错误";
		public static const  OK:int=Alert.OK;
		public static const  YES:int=Alert.YES;
		public static const  CANCEL:int=Alert.CANCEL;
		public static const  NO:int=Alert.NO;
		
		public static const  NONMODAL:int=Alert.NONMODAL;
		
		public static function get LABEL_OK():String{
			return Alert.okLabel;
		}
		public static function get LABEL_CANCEL():String{
			return Alert.cancelLabel;
		}
		public static function get LABEL_YES():String{
			return Alert.yesLabel;
		}
		public static function get LABEL_NO():String{
			return Alert.noLabel;
		}
		public static function note(msg:Object, title:String = null, flags:uint = 0x4, parent:Sprite = null, closeHandler:Function = null, defaultButtonFlag:uint = 0x4):void{
			title=title==null?NOTE_TITLE:title;
			Alert.show(extract(msg),title,flags,parent,closeHandler,NOTE,defaultButtonFlag);
		}
		
		public static function tip(msg:Object, title:String =null , flags:uint = 0x4, parent:Sprite = null, closeHandler:Function = null, defaultButtonFlag:uint = 0x4):void{
			title=title==null?TIP_TITLE:title;
			Alert.show(extract(msg),title,flags,parent,closeHandler,TIP,defaultButtonFlag);
		}
		
		public static function confirm(msg:Object, title:String = null, flags:uint = 0xc, parent:Sprite = null, closeHandler:Function = null, defaultButtonFlag:uint = 0x4):void{
			title=title==null?CONFIRM_TITLE:title;
			Alert.show(extract(msg),title,flags,parent,closeHandler,CONFIRM,defaultButtonFlag);
		}
		
		public static function error(msg:Object, title:String = null, flags:uint = 0x4, parent:Sprite = null, closeHandler:Function = null, defaultButtonFlag:uint = 0x4):void{
			title=title==null?ERROR_TITLE:title;
			Alert.show(extract(msg),title,flags,parent,closeHandler,ERROR,defaultButtonFlag);
		}
		
		public static function warning(msg:Object, title:String =null , flags:uint = 0x4, parent:Sprite = null, closeHandler:Function = null, defaultButtonFlag:uint = 0x4):void{
			title=title==null?WARNING_TITLE:title;
			Alert.show(extract(msg),title,flags,parent,closeHandler,WARNING,defaultButtonFlag);
		}
		public static function extract(info:Object):String{
			if(info==null) return "";			
			var msg:String=null;
			if(info is FaultEvent){
				msg=extractFault(FaultEvent(info).fault);
				if(msg==null){
					var em:ErrorMessage=FaultEvent(info).message as ErrorMessage;
					if(em)
						msg=extractMessge(em);
				}
			}
			else if(info is Fault){
				msg=extractFault(info as Fault);
			}
			else if(info is ErrorMessage){
				msg=extractMessge(info as ErrorMessage);
			}	
			else if(info is ErrorEvent){
				var e:ErrorEvent=info as ErrorEvent;
				if(!isEmpty(e.text))
					msg=e.text;
			}
			else if(info is Error){
				var m:Error=info as Error;
				if(!isEmpty(m.message))
					msg=m.message;
			}
			if(msg==null)
				msg=info.toString();
			return msg;
		}
		private static function extractFault(fault:Fault):String{
			var msg:String=null;
			if(fault.rootCause){
				var root:Object=fault.rootCause;
				if("localizedMessage" in root)
					msg=fault.rootCause["localizedMessage"];
				else if("message" in root)	
					msg=root["message"];
			}
			if(msg==null && !isEmpty(fault.faultDetail))
				msg=fault.faultDetail;
			if(msg==null && !isEmpty(fault.faultString))
				msg=fault.faultString;
			if(msg==null){
				msg=fault.message;
			}		
			return msg;
		}
		private static function extractMessge(message:ErrorMessage):String{
			var msg:String=null;
			if(msg==null && !isEmpty(message.faultDetail))
				msg=message.faultDetail;
			if(msg==null && !isEmpty(message.faultString))
				msg=message.faultString;
			return message.toString();	
		}
		private static function isEmpty(str:String):Boolean{
			return StringUtil.trim(str).length==0;
		}
	}
}