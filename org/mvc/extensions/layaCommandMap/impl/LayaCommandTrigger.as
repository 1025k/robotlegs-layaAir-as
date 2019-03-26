package org.mvc.extensions.layaCommandMap.impl {
    
    import org.mvc.extensions.commandCenter.api.ICommandExecutor;
	import org.mvc.extensions.commandCenter.api.ICommandTrigger;
    import org.mvc.extensions.commandCenter.impl.CommandExecutor;
    import org.mvc.extensions.commandCenter.impl.CommandMapper;
    import org.mvc.extensions.commandCenter.impl.CommandMappingList;
    import org.mvc.extensions.layaCommandMap.api.CommandEvtType;
    import org.mvc.extensions.layaCommandMap.api.ILayaEvent;
    import org.mvc.framework.api.IInjector;
	
	/**
     * ...
     * @author hoywe
     */
    public class LayaCommandTrigger implements ICommandTrigger {
        
        private var _signalClass:Class;

		private var _injector:IInjector;
        
        private var _dispatcher:ILayaEvent;
        
        private var _mappings:CommandMappingList;

		private var _executor:ICommandExecutor;
        
        public function LayaCommandTrigger(injector:IInjector, signalClass:Class) {
            
            _injector = injector;
			_signalClass = signalClass;
            _mappings = new CommandMappingList(this);
            _executor = new CommandExecutor(injector);
        }
        
        private function toCommands(...$args):void {
            
            _executor.executeCommands(_mappings.getList(), $args);
        }
        
        public function createMapper():CommandMapper
		{
			return new CommandMapper(_mappings);
		}
        
        /* INTERFACE com.zhang.extensions.commandCenter.api.ICommandTrigger */
        
        public function activate():void {
            
            if (!_injector.hasMapRule(_signalClass))
                _injector.mapClass(_signalClass);
            _dispatcher = _injector.getInstance(_signalClass) as ILayaEvent;
            _dispatcher.on(getClassName(_signalClass), this, toCommands);
        }
        
        public function deactivate():void {
            
            if (_dispatcher)
                _dispatcher.off(getClassName(_signalClass), this, toCommands);
        }
        
        private function getClassName(tar:Object):String {
            
			if (tar is Function) return tar.name;
			return tar["constructor"].name;
		}
        
    }

}
