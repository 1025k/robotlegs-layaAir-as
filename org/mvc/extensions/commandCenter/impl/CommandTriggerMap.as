package org.mvc.extensions.commandCenter.impl {
    import org.mvc.extensions.commandCenter.api.ICommandTrigger;
    import org.mvc.extensions.layaCommandMap.api.ILayaCommandMap;
	/**
     * ...
     * @author hoywe
     */
    public class CommandTriggerMap {
        
        private const _triggers:Object = new Object();
        private var _keyFactory:Function;
		private var _triggerFactory:Function;
        private var _applyTarget:ILayaCommandMap;
        public function CommandTriggerMap(layaCommandmap:ILayaCommandMap, keyFactory:Function, triggerFactory:Function)
		{
            _applyTarget = layaCommandmap;
			_keyFactory = keyFactory;
			_triggerFactory = triggerFactory;
		}
        
        public function getTrigger(... params):ICommandTrigger
		{
			const key:Object = getKey(params);
			return _triggers[key] ||= createTrigger(params);
		}
       
		public function removeTrigger(... params):ICommandTrigger
		{
			return destroyTrigger(getKey(params));
		}
        
        private function getKey(mapperArgs:Array):Object
		{
			return _keyFactory.apply(_applyTarget, mapperArgs);
		}
        
        private function createTrigger(mapperArgs:Array):ICommandTrigger
		{
			return _triggerFactory.apply(_applyTarget, mapperArgs);
		}
        
        private function destroyTrigger(key:Object):ICommandTrigger
		{
			const trigger:ICommandTrigger = _triggers[key];
			if (trigger)
			{
				trigger.deactivate();
				delete _triggers[key];
			}
			return trigger;
		}
    }

}
