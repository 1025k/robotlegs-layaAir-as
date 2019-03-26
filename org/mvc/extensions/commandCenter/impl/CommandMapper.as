package org.mvc.extensions.commandCenter.impl {
    
    import org.mvc.extensions.commandCenter.api.ICommandMapping;
    import org.mvc.extensions.commandCenter.api.ICommandMappingList;
	import org.mvc.extensions.commandCenter.dsl.ICommandConfigurator;
	import org.mvc.extensions.commandCenter.dsl.ICommandMapper;
	import org.mvc.extensions.commandCenter.dsl.ICommandUnmapper;
	
	/**
     * ...
     * @author hoywe
     */
    public class CommandMapper implements ICommandMapper, ICommandUnmapper, ICommandConfigurator {
        
        private var _mappings:ICommandMappingList;

		private var _mapping:ICommandMapping;
        
        public function CommandMapper(mappings:ICommandMappingList) {
            
            _mappings = mappings;
        }
        
        
        /* INTERFACE com.zhang.extensions.command.dsl.ICommandConfigurator */
        
        public function withExecuteMethod(name:String):ICommandConfigurator {
            _mapping.setExecuteMethod(name);
            return this;
        }
        
        public function once(value:Boolean = true):ICommandConfigurator {
            _mapping.setFireOnce(value);
			return this;
        }
        
        
        /* INTERFACE com.zhang.extensions.command.dsl.ICommandUnmapper */
        
        public function fromCommand(commandClass:Class):void {
            _mappings.removeMappingFor(commandClass);
        }
        
        public function fromAll():void {
            _mappings.removeAllMappings();
        }
        
        
        /* INTERFACE com.zhang.extensions.command.dsl.ICommandMapper */
        
        public function toCommand(commandClass:Class):ICommandConfigurator {
            _mapping = new CommandMapping(commandClass);
			_mappings.addMapping(_mapping);
			return this;
        }
        
    }

}
