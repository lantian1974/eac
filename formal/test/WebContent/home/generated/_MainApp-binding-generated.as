

import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;
import mx.core.IPropertyChangeNotifier;
import mx.events.PropertyChangeEvent;
import mx.utils.ObjectProxy;
import mx.utils.UIDUtil;

import mx.rpc.remoting.mxml.RemoteObject;

class BindableProperty
{
	/*
	 * generated bindable wrapper for property ro (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'ro' moved to '_3645ro'
	 */

    [Bindable(event="propertyChange")]
    public function get ro():mx.rpc.remoting.mxml.RemoteObject
    {
        return this._3645ro;
    }

    public function set ro(value:mx.rpc.remoting.mxml.RemoteObject):void
    {
    	var oldValue:Object = this._3645ro;
        if (oldValue !== value)
        {
            this._3645ro = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "ro", oldValue, value));
        }
    }



}
