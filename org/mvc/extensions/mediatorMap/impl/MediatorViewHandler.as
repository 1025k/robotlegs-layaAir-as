package org.mvc.extensions.mediatorMap.impl {
    import org.mvc.extensions.mediatorMap.api.IMediatorMapping;
	/**
     * ...
     * @author hoywe
     */
    public class MediatorViewHandler {
        
        private var _factory:MediatorFactory;
        private const _mappings:Vector.<IMediatorMapping> = new Vector.<IMediatorMapping>;
        
        public function MediatorViewHandler(factory:MediatorFactory) {
            _factory = factory;
        }
        
        public function addMapping(mapping:IMediatorMapping):void {
            
			const index:int = _mappings.indexOf(mapping);
			if (index > -1)
				return;
			_mappings.push(mapping);
		}
        
        public function removeMapping(mapping:IMediatorMapping):void {
            
			const index:int = _mappings.indexOf(mapping);
			if (index == -1)
				return;
			_mappings.splice(index, 1);
		}
        
        public function handleItem(item:Object, type:Class):void
		{
			var interestedMapping:IMediatorMapping = getInterestedMappingFor(type);
			if (interestedMapping) {
                _factory.createMediator(item, interestedMapping);
            }
		}
        
        private function getInterestedMappingFor(type:Class):IMediatorMapping
		{
			var mapping:IMediatorMapping;
            for each (mapping in _mappings)
            {
                if (mapping.typeClass === type)
                {
                    return mapping as IMediatorMapping;
                }
            }
            return null;
		}
    }
}
