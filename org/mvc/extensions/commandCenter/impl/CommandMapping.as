package org.mvc.extensions.commandCenter.impl {
	import org.mvc.extensions.commandCenter.api.ICommandMapping;
	
	/**
     * ...
     * @author hoywe
     */
    public class CommandMapping implements ICommandMapping {
        
        private var _commandClass:Class;
        
        public function CommandMapping(commandClass:Class) {
            _commandClass = commandClass;
        }
        
        public function toString():String {
            
			return 'Command ' + _commandClass;
		}
        
        /* INTERFACE com.zhang.extensions.command.api.ICommandMapping */
        
        public function get commandClass():Class {
            return _commandClass;
        }
        
        private var _executeMethod:String = "execute";
        public function get executeMethod():String {
            return _executeMethod;
        }
        
        public function setExecuteMethod(name:String):ICommandMapping {
            _executeMethod = name;
            return this;
        }
        
        private var _fireOnce:Boolean;
        public function setFireOnce(value:Boolean):ICommandMapping {
            _fireOnce = value;
			return this;
        }
        
        public function get fireOnce():Boolean {
            return _fireOnce;
        }
        
    }

}
