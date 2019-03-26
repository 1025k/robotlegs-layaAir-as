package org.mvc.extensions.mediatorMap.impl {
    import org.mvc.extensions.mediatorMap.api.IMediatorMapping;
	/**
     * ...
     * @author hoywe
     */
    public class MediatorManager {
        
        private var _factory:MediatorFactory;
        
        public function MediatorManager(factory:MediatorFactory) {
            
            _factory = factory;
        }
        
        public function addMediator(mediator:Object, item:Object, mapping:IMediatorMapping):void {
            
            initializeMediator(mediator, item);
        }
        
        public function removeMediator(mediator:Object, item:Object, mapping:IMediatorMapping):void
		{
            destroyMediator(mediator);
		}
        
        private function initializeMediator(mediator:Object, mediatedItem:Object):void {
            
            if (mediator['preInit']) {
				mediator.preInit();
            }
            if (mediator.hasOwnProperty('view')) {
                mediator.view = mediatedItem;
            }
            if (mediator['init']) {
				mediator.init();
            }
        }
        
        private function destroyMediator(mediator:Object):void {
            
            if (mediator['preDestroy']) {
				mediator.preDestroy();
            }
            
            if (mediator['destroy']) {
				mediator.destroy();
            }
            
            if (mediator.view) {
                mediator.view = null;
            }
        }
        
    }

}
