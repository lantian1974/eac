

import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;
import mx.core.IPropertyChangeNotifier;
import mx.events.PropertyChangeEvent;
import mx.utils.ObjectProxy;
import mx.utils.UIDUtil;

import flash.profiler.*;
import flash.external.*;
import flash.display.*;
import flash.net.*;
import flash.debugger.*;
import flash.utils.*;
import flash.printing.*;
import flash.text.*;
import flash.geom.*;
import flash.events.*;
import flash.accessibility.*;
import mx.binding.*;
import spark.components.TextArea;
import flash.ui.*;
import flash.media.*;
import flash.xml.*;
import mx.styles.*;
import mx.filters.*;
import flash.system.*;
import flash.errors.*;

class BindableProperty
{
	/*
	 * generated bindable wrapper for property textArea_config (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'textArea_config' moved to '_526533689textArea_config'
	 */

    [Bindable(event="propertyChange")]
    public function get textArea_config():spark.components.TextArea
    {
        return this._526533689textArea_config;
    }

    public function set textArea_config(value:spark.components.TextArea):void
    {
    	var oldValue:Object = this._526533689textArea_config;
        if (oldValue !== value)
        {
            this._526533689textArea_config = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "textArea_config", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property config (private)
	 * - generated setter
	 * - generated getter
	 * - original private var 'config' moved to '_1354792126config'
	 */

    [Bindable(event="propertyChange")]
    private function get config():String
    {
        return this._1354792126config;
    }

    private function set config(value:String):void
    {
    	var oldValue:Object = this._1354792126config;
        if (oldValue !== value)
        {
            this._1354792126config = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "config", oldValue, value));
        }
    }



}
