package org.mvc.framework.impl {
    
	import org.mvc.framework.api.IContext;
    import org.mvc.framework.api.IInjector;
	import laya.events.EventDispatcher;
	
	/**
     * ...命令总线
     * @author hoywe
     */
    public class Context extends EventDispatcher implements IContext {
        
        private var _injector:IInjector = Injector.instance;
        private var _configManager:ConfigManager;
        private var _uid:String = UID.create(Context);
        private var _extensionInstaller:ExtensionInstaller;
        public function Context() {
            setup();
        }
        
        private function setup():void {
            
            _injector.mapToValue('Context', this);
            _configManager = new ConfigManager(this);
            _extensionInstaller = new ExtensionInstaller(this);
        }
        
		public function init():void {
            
            event('init');
		}
        
        /* INTERFACE com.zhang.framework.api.IContext */
        
        public function get injector():IInjector {
            return _injector;
        }
        
        public function install(...extensions):IContext {
            
            for each (var extension:Object in extensions) {
                _extensionInstaller.install(extension);
            }
				
			return this;
        }
        
        public function configure(...configs):IContext {
            
            for each (var config:Object in configs) {
                _configManager.addConfig(config);
            }
			return this;
        }
        
    }

}


