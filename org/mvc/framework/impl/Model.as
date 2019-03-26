package org.mvc.framework.impl {
    import org.mvc.framework.api.IInjector;
	
	/**
     * ...
     * @author hoywe
     */
    public class Model {
        
        protected const injector:IInjector = Injector.instance;
        
        protected var dispatcher:Signal = new Signal;
        
        /* INTERFACE com.zhang.framework.api.IModel */
        
        public function dispatch(type:String, data:* = null):void {
            
            dispatcher.event(type, data);
        }
        
    }

}
