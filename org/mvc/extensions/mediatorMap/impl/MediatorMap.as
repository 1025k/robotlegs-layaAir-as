package org.mvc.extensions.mediatorMap.impl {
    import org.mvc.extensions.mediatorMap.dsl.IMediatorUnmapper;
	import org.mvc.extensions.mediatorMap.api.IMediatorMap;
    import org.mvc.extensions.mediatorMap.dsl.IMediatorMapper;
    import org.mvc.framework.api.IInjector;
    import org.mvc.framework.impl.Injector;
	
	/**
     * ...
     * @author hoywe
     */
    public class MediatorMap implements IMediatorMap {
        
        private var _injector:IInjector = Injector.instance;
        
        private const _mappers:Object = new Object();

		private var _factory:MediatorFactory;

		private var _viewHandler:MediatorViewHandler;
        
        public function MediatorMap() {
            
            _factory = new MediatorFactory(_injector);
			_viewHandler = new MediatorViewHandler(_factory);
        }
        
        
        /* INTERFACE com.zhang.extensions.mediatorMap.api.IMediatorMap */
        
        public function map(type:Class):IMediatorMapper {
            return _mappers[type] ||= createMapper(type);
        }
        
        public function unmap(type:Class):IMediatorUnmapper {
            
            return null;
        }
        
        public function mediate(item:Object):void {
            _viewHandler.handleItem(item, item['constructor']);
        }
        
        public function unmediate(item:Object):void
		{
			_factory.removeMediators(item);
		}

		/**
		 * @inheritDoc
		 */
		public function unmediateAll():void
		{
			_factory.removeAllMediators();
		}
        
        private function createMapper(type:Class):IMediatorMapper
		{
			return new MediatorMapper(type, _viewHandler);
		}
        
    }

}
