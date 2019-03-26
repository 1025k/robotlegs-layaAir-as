package org.mvc.extensions.commandCenter.impl {
    import org.mvc.extensions.commandCenter.api.ICommandMapping;
	import org.mvc.extensions.commandCenter.api.ICommandMappingList;
    import org.mvc.extensions.commandCenter.api.ICommandTrigger;
	
	/**
     * ...
     * @author hoywe
     */
    public class CommandMappingList implements ICommandMappingList {
        
        private const _mappingsByCommand:Object = new Object();
        private var _mappings:Vector.<ICommandMapping> = new Vector.<ICommandMapping>;
        private var _trigger:ICommandTrigger;
        
        public function CommandMappingList(trigger:ICommandTrigger) {
            
            _trigger = trigger;
        }
        
        /* INTERFACE com.zhang.extensions.command.api.ICommandMappingList */
        
        public function getList():Vector.<ICommandMapping>
		{
			return _mappings.concat();
		}
        
        public function addMapping(mapping:ICommandMapping):void {
            
            var oldMapping:ICommandMapping = _mappingsByCommand[mapping.commandClass];
			if (oldMapping)
			{
				overwriteMapping(oldMapping, mapping);
			}
			else
			{
				storeMapping(mapping);
				_mappings.length == 1 && _trigger.activate();
			}
        }
        
        public function removeMapping(mapping:ICommandMapping):void {
            
            if (_mappingsByCommand[mapping.commandClass])
			{
				deleteMapping(mapping);
				_mappings.length == 0 && _trigger.deactivate();
			}
        }
        
        public function removeMappingFor(commandClass:Class):void {
            
            var mapping:ICommandMapping = _mappingsByCommand[commandClass];
			mapping && removeMapping(mapping);
        }
        
        public function removeAllMappings():void {
            
            if (_mappings.length > 0)
			{
				const list:Vector.<ICommandMapping> = _mappings.concat();
				var length:int = list.length;
				while (length--)
				{
					deleteMapping(list[length]);
				}
				_trigger.deactivate();
			}
        }
        
        
        private function storeMapping(mapping:ICommandMapping):void
		{
			_mappingsByCommand[mapping.commandClass] = mapping;
			_mappings.push(mapping);
		}

		private function deleteMapping(mapping:ICommandMapping):void
		{
			delete _mappingsByCommand[mapping.commandClass];
			_mappings.splice(_mappings.indexOf(mapping), 1);
		}
        
        private function overwriteMapping(oldMapping:ICommandMapping, newMapping:ICommandMapping):void
		{
			deleteMapping(oldMapping);
			storeMapping(newMapping);
		}
    }

}
