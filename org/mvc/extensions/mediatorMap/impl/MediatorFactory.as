package org.mvc.extensions.mediatorMap.impl {
    
    import org.mvc.extensions.mediatorMap.api.IMediatorMapping;
    import org.mvc.framework.api.IInjector;
	/**
     * ...
     * @author hoywe
     */
    public class MediatorFactory {
        
        private const _mediators:Object = new Object();
        
        private var _injector:IInjector;

		private var _manager:MediatorManager;
        
        public function MediatorFactory(injector:IInjector) 
        {
            _injector = injector;
			_manager = new MediatorManager(this);
        }
        
        
        public function getMediator(item:Object, mapping:IMediatorMapping):Object
		{
			return _mediators[item] ? _mediators[item][mapping] : null;
		}
        
        public function removeMediators(item:Object):void
		{
			var mediators:Object = _mediators[item];
			if (!mediators)
				return;

			for (var mapping:Object in mediators)
			{
				_manager.removeMediator(mediators[mapping], item, mapping as IMediatorMapping);
			}
			delete _mediators[item];
		}

		/**
		 * @private
		 */
		public function removeAllMediators():void
		{
			for (var item:Object in _mediators)
			{
				removeMediators(item);
			}
		}
        
        public function createMediator(item:Object, mapping:IMediatorMapping):Object
		{
			var mediator:Object = getMediator(item, mapping);
			if (mediator)
				return mediator;

            var mediatorClass:Class = mapping.mediatorClass;
            mediator = _injector.mapValue(new (mediatorClass as Class));
            addMediator(mediator, item, mapping);
			return mediator;
		}
        
        private function addMediator(mediator:Object, item:Object, mapping:IMediatorMapping):void
		{
			_mediators[item] ||= new Object();
			_mediators[item][mapping] = mediator;
			_manager.addMediator(mediator, item, mapping);
		}
    }

}
