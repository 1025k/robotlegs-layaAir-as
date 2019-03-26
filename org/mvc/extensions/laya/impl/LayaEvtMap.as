package org.mvc.extensions.laya.impl {
    import org.mvc.extensions.laya.api.ILayaEvtMap;
    import org.mvc.extensions.layaCommandMap.api.CommandEvtType;
    import org.mvc.framework.api.IContextEvent;
    import org.mvc.framework.api.IInjector;
    import org.mvc.framework.impl.Injector;
	/**
     * ...
     * @author hoywe
     */
    public class LayaEvtMap implements ILayaEvtMap {
        
        private var injector:IInjector = Injector.instance;
        private var _listeners:Object;
        private var _dispatcher:IContextEvent;
        
        public function LayaEvtMap()
        {
            _listeners = { };
            _dispatcher = injector.getInstance('Context') as IContextEvent;
        }
        
        /* INTERFACE test.common.layaEvtMap.ILayaEvtMap */
        
        public function mapListener(dispatcher:*, type:String, caller:*, listener:Function, args:Array = null):void {
            var target:*;
            var matchtype:*;
            if (dispatcher == null) {
                target = _dispatcher;
                matchtype = type;
            }
            else {
                target = dispatcher;
                matchtype = listener;
            }
            target.on(type, caller, listener, args);
            if (_listeners[matchtype]) {
                trace('has listener：' + matchtype, dispatcher);
                return;
            }
            _listeners[matchtype] = { dispatcher: target, type: type, caller: caller, listener: listener };
        }
        
        public function mapMEvt(type:String, caller:*, listener:Function, args:Array = null):void {
            mapListener(null, type, caller, listener, args);
        }
        
        public function unmapListener(type:String, listener:Function):void {
            
            var obj:* = _listeners[type] || _listeners[listener];
            if (obj) {
                obj.dispatcher.off(obj.type, obj.caller, listener, false);
                //trace('remove listener：' + obj.type);
                delete _listeners[type];
                delete _listeners[listener];
            }
        }
        
        public function unmapListeners():void {
            
            for (var type:* in _listeners) {
                var obj:* = _listeners[type];
                unmapListener(obj.type, obj.listener);
            }
        }
        
        public function mapSignal(dispatcher:*, caller:*, listener:Function, args:Array = null):void {
            
            var type:String;
            if (dispatcher is Class) {
                type = getClassName(dispatcher);
                dispatcher = injector.getInstance(dispatcher);
            }
            
            mapListener(dispatcher, type, caller, listener, args);
        }
        
        private function getClassName(tar:Object):String {
            
			if (tar is Function) return tar.name;
			return tar['constructor'].name;
		}
    }
}
