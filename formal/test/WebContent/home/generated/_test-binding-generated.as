

import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;
import mx.core.IPropertyChangeNotifier;
import mx.events.PropertyChangeEvent;
import mx.utils.ObjectProxy;
import mx.utils.UIDUtil;

import spark.components.TextArea;

class BindableProperty
{
	/*
	 * generated bindable wrapper for property TextArea_config1 (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'TextArea_config1' moved to '_14549354TextArea_config1'
	 */

    [Bindable(event="propertyChange")]
    public function get TextArea_config1():spark.components.TextArea
    {
        return this._14549354TextArea_config1;
    }

    public function set TextArea_config1(value:spark.components.TextArea):void
    {
    	var oldValue:Object = this._14549354TextArea_config1;
        if (oldValue !== value)
        {
            this._14549354TextArea_config1 = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "TextArea_config1", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property TextArea_config2 (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'TextArea_config2' moved to '_14549355TextArea_config2'
	 */

    [Bindable(event="propertyChange")]
    public function get TextArea_config2():spark.components.TextArea
    {
        return this._14549355TextArea_config2;
    }

    public function set TextArea_config2(value:spark.components.TextArea):void
    {
    	var oldValue:Object = this._14549355TextArea_config2;
        if (oldValue !== value)
        {
            this._14549355TextArea_config2 = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "TextArea_config2", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property TextArea_config3 (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'TextArea_config3' moved to '_14549356TextArea_config3'
	 */

    [Bindable(event="propertyChange")]
    public function get TextArea_config3():spark.components.TextArea
    {
        return this._14549356TextArea_config3;
    }

    public function set TextArea_config3(value:spark.components.TextArea):void
    {
    	var oldValue:Object = this._14549356TextArea_config3;
        if (oldValue !== value)
        {
            this._14549356TextArea_config3 = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "TextArea_config3", oldValue, value));
        }
    }



}
