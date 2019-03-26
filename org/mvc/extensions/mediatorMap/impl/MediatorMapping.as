package org.mvc.extensions.mediatorMap.impl {
	import org.mvc.extensions.mediatorMap.api.IMediatorMapping;
	import org.mvc.extensions.mediatorMap.dsl.IMediatorConfigurator;
	
	/**
     * ...
     * @author hoywe
     */
    public class MediatorMapping implements IMediatorMapping, IMediatorConfigurator {
        
        
        public function MediatorMapping(typeClass:Class, mediatorClass:Class) {
            
            _typeClass = typeClass;
            _mediatorClass = mediatorClass;
        }
        
        
        /* INTERFACE com.zhang.extensions.mediatorMap.dsl.IMediatorConfigurator */
        
        public function autoRemove(value:Boolean = false):IMediatorConfigurator {
            _autoRemoveEnabled = value;
			return this;
        }
        
        
        /* INTERFACE com.zhang.extensions.mediatorMap.api.IMediatorMapping */
        private var _typeClass:Class;
        public function get typeClass():Class {
            return _typeClass;
        }
        
        
        /* INTERFACE com.zhang.extensions.mediatorMap.api.IMediatorMapping 720.1280.320*/
        private var _mediatorClass:Class;
        public function get mediatorClass():Class {
            return _mediatorClass;
        }
        private var _autoRemoveEnabled:Boolean = true;
        public function get autoRemoveEnabled():Boolean {
            return _autoRemoveEnabled;
        }
        
    }

}
