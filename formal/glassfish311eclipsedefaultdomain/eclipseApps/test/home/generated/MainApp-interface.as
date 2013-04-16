
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
import mx.core.ClassFactory;
import mx.core.DeferredInstanceFromClass;
import mx.core.DeferredInstanceFromFunction;
import mx.core.IDeferredInstance;
import mx.core.IFactory;
import mx.core.IFlexModuleFactory;
import mx.core.IPropertyChangeNotifier;
import mx.core.mx_internal;
import mx.filters.*;
import mx.rpc.http.mxml.HTTPService;
import mx.rpc.remoting.mxml.RemoteObject;
import mx.styles.*;
import spark.components.Application;
import spark.components.Label;
import spark.components.Application;
import mx.controls.PopUpButton;
import spark.components.Button;

public class MainApp extends spark.components.Application
{
	public function MainApp() {}

	[Bindable]
	public var configSrv : mx.rpc.http.mxml.HTTPService;
	[Bindable]
	public var ro : mx.rpc.remoting.mxml.RemoteObject;

	mx_internal var _bindings : Array;
	mx_internal var _watchers : Array;
	mx_internal var _bindingsByDestination : Object;
	mx_internal var _bindingsBeginWithWord : Object;

include "D:/Project/formal/test/flex_src/MainApp.mxml:11,34";

}}
