






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
        import mx.controls.Alert;
        import mx.core.IFlexModuleFactory;
        import mx.binding.BindingManager;
        import mx.core.DeferredInstanceFromClass;
        import __AS3__.vec.Vector;
        import mx.messaging.ChannelSet;
        import mx.core.IDeferredInstance;
        import mx.binding.IBindingClient;
        import mx.core.IPropertyChangeNotifier;
        import flash.events.IEventDispatcher;
        import mx.rpc.events.ResultEvent;
        import spark.components.Label;
        import mx.core.ClassFactory;
        import mx.core.IFactory;
        import mx.rpc.remoting.mxml.RemoteObject;
        import mx.core.mx_internal;
        import mx.core.DeferredInstanceFromFunction;
        import mx.events.FlexEvent;
        import spark.components.Application;
        import mx.messaging.channels.AMFChannel;
        import flash.events.EventDispatcher;
        import flash.events.Event;
        import spark.components.Button;

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
