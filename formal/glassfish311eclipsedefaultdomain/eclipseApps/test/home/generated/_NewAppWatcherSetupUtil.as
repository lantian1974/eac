






package
{
import mx.core.IFlexModuleFactory;
import mx.binding.ArrayElementWatcher;
import mx.binding.FunctionReturnWatcher;
import mx.binding.IWatcherSetupUtil2;
import mx.binding.PropertyWatcher;
import mx.binding.RepeaterComponentWatcher;
import mx.binding.RepeaterItemWatcher;
import mx.binding.StaticPropertyWatcher;
import mx.binding.XMLWatcher;
import mx.binding.Watcher;

[ExcludeClass]
public class _NewAppWatcherSetupUtil
    implements mx.binding.IWatcherSetupUtil2
{
    public function _NewAppWatcherSetupUtil()
    {
        super();
    }

    public static function init(fbs:IFlexModuleFactory):void
    {
        import NewApp;
        (NewApp).watcherSetupUtil = new _NewAppWatcherSetupUtil();
    }

    public function setup(target:Object,
                          propertyGetter:Function,
                          staticPropertyGetter:Function,
                          bindings:Array,
                          watchers:Array):void
    {
        import mx.core.DeferredInstanceFromClass;
        import __AS3__.vec.Vector;
        import mx.binding.IBindingClient;
        import mx.core.ClassFactory;
        import mx.rpc.events.ResultEvent;
        import mx.core.IFactory;
        import mx.core.DeferredInstanceFromFunction;
        import spark.components.Application;
        import flash.events.EventDispatcher;
        import org.epmr.facility.remoting.event.ChannelSetInitializeEvent;
        import spark.components.Button;
        import mx.controls.Alert;
        import mx.core.IFlexModuleFactory;
        import mx.binding.BindingManager;
        import mx.messaging.ChannelSet;
        import mx.core.IDeferredInstance;
        import mx.core.IPropertyChangeNotifier;
        import flash.events.IEventDispatcher;
        import spark.components.Label;
        import mx.rpc.remoting.mxml.RemoteObject;
        import mx.events.FlexEvent;
        import mx.core.mx_internal;
        import org.epmr.facility.remoting.ChannelsConfig;
        import mx.messaging.channels.AMFChannel;
        import flash.events.Event;

        // writeWatcher id=0 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher shouldWriteChildren=true
        watchers[0] = new mx.binding.PropertyWatcher("ro",
                                                                             {
                propertyChange: true
            }
,
                                                                         // writeWatcherListeners id=0 size=1
        [
        bindings[0]
        ]
,
                                                                 propertyGetter
);

        // writeWatcher id=1 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher shouldWriteChildren=true
        watchers[1] = new mx.binding.PropertyWatcher("hello",
                                                                             {
                operationsChange: true
            }
,
                                                                         // writeWatcherListeners id=1 size=1
        [
        bindings[0]
        ]
,
                                                                 null
);

        // writeWatcher id=2 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher shouldWriteChildren=true
        watchers[2] = new mx.binding.PropertyWatcher("lastResult",
                                                                             {
                resultForBinding: true
            }
,
                                                                         // writeWatcherListeners id=2 size=1
        [
        bindings[0]
        ]
,
                                                                 null
);


        // writeWatcherBottom id=0 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher
        watchers[0].updateParent(target);

 





        // writeWatcherBottom id=1 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher
        watchers[0].addChild(watchers[1]);

 





        // writeWatcherBottom id=2 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher
        watchers[1].addChild(watchers[2]);

 





    }
}

}
