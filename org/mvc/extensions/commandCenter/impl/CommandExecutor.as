package org.mvc.extensions.commandCenter.impl {
    
	import org.mvc.extensions.commandCenter.api.ICommandExecutor;
    import org.mvc.extensions.commandCenter.api.ICommandMapping;
    import org.mvc.framework.api.IInjector;
	
	/**
     * ...
     * @author hoywe
     */
    public class CommandExecutor implements ICommandExecutor {
        
        private var _injector:IInjector;
        
        public function CommandExecutor(injector:IInjector) {
           
            _injector = injector;
        }
        
        
        /* INTERFACE com.zhang.extensions.command.api.ICommandExecutor */
        
        public function executeCommands(mappings:Vector.<ICommandMapping>, args:Array = null):void
		{
			const length:int = mappings.length;
			for (var i:int = 0; i < length; i++)
			{
				executeCommand(mappings[i], args);
			}
		}
        
        public function executeCommand(mapping:ICommandMapping, args:Array = null):void {
            
            var command:Object = null;
            var argsArr:Array = args;
            var commandClass:Class = mapping.commandClass;
            if (!_injector.hasMapRule(commandClass)) {
                _injector.mapClass(commandClass);
            }
            command = _injector.getInstance(commandClass);
            
            if (command && mapping.executeMethod) {
                
                const executeMethod:Function = command[mapping.executeMethod];
                (argsArr && executeMethod.length > 0) ? executeMethod.apply(null, argsArr) : executeMethod();
                //executeMethod();
            }
        }
        
    }

}
