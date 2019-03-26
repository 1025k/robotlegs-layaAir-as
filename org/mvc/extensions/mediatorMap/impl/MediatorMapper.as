package org.mvc.extensions.mediatorMap.impl {
    import org.mvc.extensions.mediatorMap.api.IMediatorMapping;
    import org.mvc.extensions.mediatorMap.dsl.IMediatorConfigurator;
	import org.mvc.extensions.mediatorMap.dsl.IMediatorMapper;
	import org.mvc.extensions.mediatorMap.dsl.IMediatorUnmapper;
	
	/**
     * ...
     * @author hoywe
     */
    public class MediatorMapper implements IMediatorMapper, IMediatorUnmapper {
        
        private const _mappings:Object = new Object();
        
        private var _typeClass:Class;

		private var _handler:MediatorViewHandler;

        public function MediatorMapper(typeClass:Class, handler:MediatorViewHandler) {
            
            _typeClass = typeClass;
            _handler = handler;
        }
        
        /* INTERFACE com.zhang.extensions.mediatorMap.dsl.IMediatorUnmapper */
            
        public function fromMediator(mediatorClass:Class):void {
            
            const mapping:IMediatorMapping = _mappings[mediatorClass];
			mapping && deleteMapping(mapping);
        }
        
        public function fromAll():void {
            
            for each (var mapping:IMediatorMapping in _mappings) {
				deleteMapping(mapping);
			}
        }
        
        /* INTERFACE com.zhang.extensions.mediatorMap.dsl.IMediatorMapper */
        
        public function toMediator(mediatorClass:Class):IMediatorConfigurator {
            
            const mapping:IMediatorMapping = _mappings[mediatorClass];
			return mapping
				? overwriteMapping(mapping)
				: createMapping(mediatorClass);
        }
        
        private function createMapping(mediatorClass:Class):MediatorMapping {
            
			const mapping:MediatorMapping = new MediatorMapping(_typeClass, mediatorClass);
			_handler.addMapping(mapping);
			_mappings[mediatorClass] = mapping;
			return mapping;
		}

		private function deleteMapping(mapping:IMediatorMapping):void {
            
			_handler.removeMapping(mapping);
			delete _mappings[mapping.mediatorClass];
		}

		private function overwriteMapping(mapping:IMediatorMapping):IMediatorConfigurator {
            
			deleteMapping(mapping);
			return createMapping(mapping.mediatorClass);
		}
        
    }

}
