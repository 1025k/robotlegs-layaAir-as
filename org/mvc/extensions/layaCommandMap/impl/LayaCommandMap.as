package org.mvc.extensions.layaCommandMap.impl {
    import org.mvc.extensions.commandCenter.api.ICommandTrigger;
    import org.mvc.extensions.commandCenter.dsl.ICommandUnmapper;
    import org.mvc.extensions.commandCenter.dsl.ICommandMapper;
    import org.mvc.extensions.commandCenter.impl.CommandTriggerMap;
	import org.mvc.extensions.layaCommandMap.api.ILayaCommandMap;
    import org.mvc.framework.api.IContext;
    import org.mvc.framework.api.IInjector;
    import org.mvc.framework.impl.Injector;
	
	/**
     * ...
     * @author hoywe
     */
    public class LayaCommandMap implements ILayaCommandMap {
        
        private var _injector:IInjector = Injector.instance;
        
		private var _triggerMap:CommandTriggerMap;
        
        public function LayaCommandMap() {
            
			_triggerMap = new CommandTriggerMap(this, getKey, createTrigger);
        }
        
        
        /* INTERFACE com.zhang.extensions.layaCommandMap.api.ILayaCommandMap */
        
        public function map(signalClass:Class):ICommandMapper {
            
            return getTrigger(signalClass).createMapper();
        }
        
        public function unmap(signalClass:Class):ICommandUnmapper {
            
            return getTrigger(signalClass).createMapper();
        }
        
        private function createTrigger(signalClass:Class):ICommandTrigger
		{
			return new LayaCommandTrigger(_injector, signalClass);
		}

		private function getTrigger(signalClass:Class):LayaCommandTrigger
		{
			return _triggerMap.getTrigger(signalClass) as LayaCommandTrigger;
		}

		private function getKey(signalClass:Class):Object
		{
			return signalClass;
		}
        
    }

}
