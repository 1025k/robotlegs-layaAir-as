package org.mvc.extensions.laya.impl {
    import org.mvc.extensions.laya.api.ILayaEvtMap;
	import org.mvc.extensions.mediatorMap.api.IMediator;
    import org.mvc.framework.api.IInjector;
    import org.mvc.framework.impl.Injector;
	
	/**
     * ...
     * @author hoywe
     */
    public class LayaMediator implements IMediator {
        
        protected const injector:IInjector = Injector.instance;
        protected const evtMap:ILayaEvtMap = new LayaEvtMap();
        public var view:*;
        
        /* INTERFACE com.zhang.extensions.mediatorMap.api.IMediator */
        
        public function init():void {
            
        }
        
        public function destroy():void {
            
            evtMap.unmapListeners();
        }
        
    }

}
