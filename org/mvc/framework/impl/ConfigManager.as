//------------------------------------------------------------------------------
//  Copyright (c) 2009-2013 the original author or authors. All Rights Reserved.
//
//  NOTICE: You are permitted to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//------------------------------------------------------------------------------

package org.mvc.framework.impl
{
    import org.mvc.framework.api.IConfig;
    import org.mvc.framework.api.IContext;
    import org.mvc.framework.api.IInjector;

	/**
	 * The config manager handles configuration files and
	 * allows the installation of custom configuration handlers.
	 *
	 * <p>It is pre-configured to handle plain objects and classes</p>
	 *
	 * @private
	 */
	public class ConfigManager
	{

		/*============================================================================*/
		/* Private Properties                                                         */
		/*============================================================================*/

		private var _configs:Object = new Object();
		private var _queue:Array = [];
		private var _initialized:Boolean = false;
		private var _injector:IInjector;
		private var _context:IContext;

		/*============================================================================*/
		/* 构造函数                                                                    */
		/*============================================================================*/

		/**
		 * @private
		 */
		public function ConfigManager(context:IContext)
		{
			_context = context;
			_injector = context.injector;
            context.once('init', this, initialize);
		}

		public function addConfig(config:Object):void
		{
			if (!_configs[config])
			{
				_configs[config] = true;
                config is Class ? handleClass(config as Class) : handleObject(config);
			}
		}
        
		public function destroy():void
		{
			for (var configClass:Object in _configs)
			{
				delete _configs[configClass];
			}
		}

		private function initialize():void {
            
			if (!_initialized) {
                
				_initialized = true;
				processQueue();
			}
		}

		private function handleClass(type:Class):void {
            
			if (_initialized) {
                processClass(type);
            }
				
			else {
                _queue.push(type);
            }
				
		}

		private function handleObject(object:Object):void {
            
			if (_initialized) {
                processObject(object);
            }
				
			else {
                _queue.push(object);
            }
		}
        
		private function processQueue():void {
            
			for each (var config:Object in _queue) {
				if (config is Class) {
                    processClass(config as Class);
                }
				else {
					processObject(config);
                }
			}
			_queue.length = 0;
		}

		private function processClass(type:Class):void {
            
            if (!_injector.hasMapRule(type)) {
                _injector.mapClass(type);
            }
            var config:IConfig = _injector.getInstance(type) as IConfig;
			config && config.configure();
		}

		private function processObject(object:Object):void {
            
            _injector.mapValue(object);
            if (object is IConfig) {
                var config:IConfig = object as IConfig;
                config && config.configure();
            }
		}
	}
}
