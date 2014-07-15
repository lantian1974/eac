






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
public class _TestChannelConfigManagerWatcherSetupUtil
    implements mx.binding.IWatcherSetupUtil2
{
    public function _TestChannelConfigManagerWatcherSetupUtil()
    {
        super();
    }

    public static function init(fbs:IFlexModuleFactory):void
    {
        import TestChannelConfigManager;
        (TestChannelConfigManager).watcherSetupUtil = new _TestChannelConfigManagerWatcherSetupUtil();
    }

    public function setup(target:Object,
                          propertyGetter:Function,
                          staticPropertyGetter:Function,
                          bindings:Array,
                          watchers:Array):void
    {
        import mx.core.IFlexModuleFactory;
        import mx.binding.BindingManager;
        import mx.core.DeferredInstanceFromClass;
        import org.epmr.facility.preloader.BaseDownloadProgressBar;
        import __AS3__.vec.Vector;
        import mx.core.IDeferredInstance;
        import mx.binding.IBindingClient;
        import mx.core.IPropertyChangeNotifier;
        import flash.events.IEventDispatcher;
        import mx.core.ClassFactory;
        import mx.core.IFactory;
        import spark.components.TextArea;
        import mx.core.mx_internal;
        import mx.core.DeferredInstanceFromFunction;
        import mx.events.FlexEvent;
        import spark.components.Application;
        import mx.messaging.config.ServerConfig;
        import org.epmr.facility.remoting.ChannelsConfigManager;
        import flash.events.EventDispatcher;
        import flash.events.Event;

        // writeWatcher id=0 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher shouldWriteChildren=true
        watchers[0] = new mx.binding.PropertyWatcher("config",
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


        // writeWatcherBottom id=0 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher
        watchers[0].updateParent(target);

 





    }
}

}
