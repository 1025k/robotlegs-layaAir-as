package org.mvc.framework.impl {
    import org.mvc.extensions.layaCommandMap.api.ILayaEvent;
    import org.mvc.framework.api.IInjector;
    import org.mvc.framework.impl.Injector;
	import laya.events.EventDispatcher;
	
	/**
     * ...
     * @author hoywe
     */
    public class Signal implements ILayaEvent {
        
        private var injector:IInjector = Injector.instance;
        
        public function on(type:String, caller:*, listener:Function, args:Array = null):EventDispatcher {
            return injector.getInstance('Context').on(type, caller, listener, args);
        }
        
        public function once(type:String, caller:*, listener:Function, args:Array = null):EventDispatcher {
            return injector.getInstance('Context').once(type, caller, listener, args);
        }
        
        public function off(type:String, caller:*, listener:Function, onceOnly:Boolean = false):EventDispatcher {
            return injector.getInstance('Context').off(type, caller, listener, onceOnly);
        }
        
        public function offAll(type:String = null):EventDispatcher {
            return injector.getInstance('Context').offAll(type);
        }
        
        public function event(type:String, data:* = null):Boolean {
            return injector.getInstance('Context').event(type, data);
        }
        
        public function dispatch(data:* = null):Boolean {
            event(getClassName(this), data);
        }
        
        private function getClassName(tar:Object):String {
            
			if (tar is Function) return tar.name;
			return tar["constructor"].name;
		}
    }
}
