
/**
 *  Generated by mxmlc 4.0
 *
 *  Package:    
 *  Class:      NewApp
 *  Source:     D:\Project\formal\test\flex_src\NewApp.mxml
 *  Template:   flex2/compiler/mxml/gen/ClassDef.vm
 *  Time:       2011.10.08 15:17:13 CST
 */

package 
{

import flash.accessibility.*;
import flash.debugger.*;
import flash.display.*;
import flash.errors.*;
import flash.events.*;
import flash.external.*;
import flash.geom.*;
import flash.media.*;
import flash.net.*;
import flash.printing.*;
import flash.profiler.*;
import flash.system.*;
import flash.text.*;
import flash.ui.*;
import flash.utils.*;
import flash.xml.*;
import mx.binding.*;
import mx.binding.IBindingClient;
import mx.core.ClassFactory;
import mx.core.DeferredInstanceFromClass;
import mx.core.DeferredInstanceFromFunction;
import mx.core.IDeferredInstance;
import mx.core.IFactory;
import mx.core.IFlexModuleFactory;
import mx.core.IPropertyChangeNotifier;
import mx.core.mx_internal;
import mx.events.FlexEvent;
import mx.filters.*;
import mx.rpc.remoting.mxml.RemoteObject;
import mx.styles.*;
import spark.components.Application;
import spark.components.Button;
import spark.components.Label;


[Frame(extraClass="_NewApp_FlexInit")]

[Frame(factoryClass="_NewApp_mx_managers_SystemManager")]


//  begin class def
public class NewApp
    extends spark.components.Application
    implements mx.binding.IBindingClient
{

    //  instance variables
/**
 * @private
 **/
    public var _NewApp_Label1 : spark.components.Label;

    [Bindable]
	/**
 * @private
 **/
    public var ro : mx.rpc.remoting.mxml.RemoteObject;


    //  type-import dummies



    //  constructor (Flex display object)
    /**
     * @private
     **/
    public function NewApp()
    {
        super();

        mx_internal::_document = this;


        var bindings:Array = _NewApp_bindingsSetup();
        var watchers:Array = [];

        var target:Object = this;

        if (_watcherSetupUtil == null)
        {
            var watcherSetupUtilClass:Object = getDefinitionByName("_NewAppWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
        }

        _watcherSetupUtil.setup(this,
                    function(propertyName:String):* { return target[propertyName]; },
                    function(propertyName:String):* { return NewApp[propertyName]; },
                    bindings,
                    watchers);

        mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
        mx_internal::_watchers = mx_internal::_watchers.concat(watchers);


        // layer initializers

       
        // properties
        this.minWidth = 955;
        this.minHeight = 600;
        this.mxmlContentFactory = new mx.core.DeferredInstanceFromFunction(_NewApp_Array1_c);
        _NewApp_RemoteObject1_i();


        // events
        this.addEventListener("applicationComplete", ___NewApp_Application1_applicationComplete);










        for (var i:uint = 0; i < bindings.length; i++)
        {
            Binding(bindings[i]).execute();
        }


    }

    /**
     * @private
     **/ 
    private var __moduleFactoryInitialized:Boolean = false;

    /**
     * @private
     * Override the module factory so we can defer setting style declarations
     * until a module factory is set. Without the correct module factory set
     * the style declaration will end up in the wrong style manager.
     **/ 
    override public function set moduleFactory(factory:IFlexModuleFactory):void
    {
        super.moduleFactory = factory;
        
        if (__moduleFactoryInitialized)
            return;

        __moduleFactoryInitialized = true;


        // our style settings


        // ambient styles
        mx_internal::_NewApp_StylesInit();

                         
    }
 
    //  initialize()
    /**
     * @private
     **/
    override public function initialize():void
    {


        super.initialize();
    }


    //  scripts
    //  <Script>, line 11 - 36

			import mx.controls.Alert;
			import mx.messaging.ChannelSet;
			import mx.messaging.channels.AMFChannel;
			import mx.rpc.events.ResultEvent;
			
			import org.epmr.facility.remoting.ChannelsConfig;
			import org.epmr.facility.remoting.event.ChannelSetInitializeEvent;
			private var channelsConfig:ChannelsConfig;
			private var rci:RemotingConfigIni;
			private function initializeChannelSet():void
			{
				//ChannelsConfig.initialize("FlexChannelsConfig");
				//ChannelsConfig.getInstance().addEventListener(ChannelSetInitializeEvent.CHANNEL_SET_INITIALIZE,onChannelSetInitialize);
				//this.enabled=false;   
				trace("app creation compleate ");
				ro.channelSet=ChannelsConfig.getInstance().channelSet;
				ro.hello();  
			}
			private function onChannelSetInitialize(event:Event):void
			{
				this.enabled=true;
				ro.channelSet=ChannelsConfig.getInstance().channelSet;
				ro.hello();  
			}
		

    //  end scripts


    //  supporting function definitions for properties, events, styles, effects
private function _NewApp_RemoteObject1_i() : mx.rpc.remoting.mxml.RemoteObject
{
	var temp : mx.rpc.remoting.mxml.RemoteObject = new mx.rpc.remoting.mxml.RemoteObject();
	temp.destination = "TestFacade";
	temp.operations = {};
	temp.initialized(this, "ro")
	ro = temp;
	mx.binding.BindingManager.executeBindings(this, "ro", ro);
	return temp;
}

private function _NewApp_Array1_c() : Array
{
	var temp : Array = [_NewApp_Label1_i(), _NewApp_Button1_c(), _NewApp_Button2_c(), _NewApp_Button3_c()];
	return temp;
}

private function _NewApp_Label1_i() : spark.components.Label
{
	var temp : spark.components.Label = new spark.components.Label();
	temp.x = 228;
	temp.y = 61;
	temp.width = 245;
	temp.height = 38;
	temp.setStyle("fontSize", 29);
	temp.id = "_NewApp_Label1";
	if (!temp.document) temp.document = this;
	_NewApp_Label1 = temp;
	mx.binding.BindingManager.executeBindings(this, "_NewApp_Label1", _NewApp_Label1);
	return temp;
}

private function _NewApp_Button1_c() : spark.components.Button
{
	var temp : spark.components.Button = new spark.components.Button();
	temp.x = 179;
	temp.y = 157;
	temp.width = 130;
	temp.height = 43;
	temp.label = "Button";
	if (!temp.document) temp.document = this;
	return temp;
}

private function _NewApp_Button2_c() : spark.components.Button
{
	var temp : spark.components.Button = new spark.components.Button();
	temp.x = 40;
	temp.y = 158;
	temp.width = 113;
	temp.height = 42;
	temp.label = "Button";
	if (!temp.document) temp.document = this;
	return temp;
}

private function _NewApp_Button3_c() : spark.components.Button
{
	var temp : spark.components.Button = new spark.components.Button();
	temp.x = 345;
	temp.y = 157;
	temp.width = 128;
	temp.height = 43;
	temp.label = "Button";
	if (!temp.document) temp.document = this;
	return temp;
}

/**
 * @private
 **/
public function ___NewApp_Application1_applicationComplete(event:mx.events.FlexEvent):void
{
	this.initializeChannelSet()
}


    //  binding mgmt
    private function _NewApp_bindingsSetup():Array
    {
        var result:Array = [];

        result[0] = new mx.binding.Binding(this,
            function():String
            {
                var result:* = (ro.hello.lastResult);
                return (result == undefined ? null : String(result));
            },
            null,
            "_NewApp_Label1.text"
            );


        return result;
    }


    /**
     * @private
     **/
    public static function set watcherSetupUtil(watcherSetupUtil:IWatcherSetupUtil2):void
    {
        (NewApp)._watcherSetupUtil = watcherSetupUtil;
    }

    private static var _watcherSetupUtil:IWatcherSetupUtil2;

    //  initialize style defs for NewApp

    mx_internal var _NewApp_StylesInit_done:Boolean = false;

    mx_internal function _NewApp_StylesInit():void
    {
        //  only add our style defs to the style manager once
        if (mx_internal::_NewApp_StylesInit_done)
            return;
        else
            mx_internal::_NewApp_StylesInit_done = true;
            
        var style:CSSStyleDeclaration;
        var effects:Array;
                    

        var conditions:Array;
        var condition:CSSCondition;
        var selector:CSSSelector;

        styleManager.initProtoChainRoots();
    }


    //  embed carrier vars
    //  end embed carrier vars

    //  binding management vars
    /**
     * @private
     **/
    mx_internal var _bindings : Array = [];
    /**
     * @private
     **/
    mx_internal var _watchers : Array = [];
    /**
     * @private
     **/
    mx_internal var _bindingsByDestination : Object = {};
    /**
     * @private
     **/
    mx_internal var _bindingsBeginWithWord : Object = {};

//  end class def
}

//  end package def
}
