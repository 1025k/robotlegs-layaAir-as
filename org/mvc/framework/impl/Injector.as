package org.mvc.framework.impl {
    
    import org.mvc.framework.api.IInjector;
	/**
     * ...
     * 单例注入类
     * @author hoywe
     */
    public class Injector implements IInjector {
        
        /**
         * class map
         */
        private var _classDic:Object = { };
        /**
         * instance map
         */
        private var _instanceDic:Object = {};
        
        private static var _instance:IInjector;
        static public function get instance():IInjector {
            return _instance ||= new Injector();
        }
        
        public function mapClass(type:Class, name:String = ''):void {
            
            var mappingId:String = getKey(type) + "#" + name;
            _classDic[mappingId] = type;
        }
        
        public function mapToValue(type:Object, instance:Object, name:String = ''):* {
            
            var mappingId:String = getKey(type) + "#" + name;
            if (hasMapRule(instance)) {
                return getInstance(instance);
            }
            _instanceDic[mappingId] = instance;
            return instance;
        }
        
        public function mapValue(instance:Object, name:String = ""):* {
            
            var mappingId:String = getKey(instance) + "#" + name;
            if (hasMapRule(instance)) {
                return getInstance(instance);
            }
            _instanceDic[mappingId] = instance;
            return instance;
        }
        
        public function hasMapRule(type:Object, name:String = ""):Boolean {
            
			var mappingId:String = getKey(type) + "#" + name;
            return _classDic[mappingId] || _instanceDic[mappingId];
		}
        
        public function unmap(type:Class, name:String = ''):void {
            
            var mappingId:String = getKey(type) + "#" + name;
            var instance:* = _instanceDic[mappingId];
            if (instance) {
                //instance.destroy ();
                instance = null;
                delete _instanceDic[mappingId];
                delete _classDic[mappingId];
            }
        }
        
        public function getInstance(type:Object, name:String = ''):* {
            
            var mappingId:String = getKey(type) + "#" + name;
            var instance:*;
            instance = _instanceDic[mappingId];
			if (instance) return instance;
			var ReturnClass:Class = _classDic[mappingId] as Class;
			if (ReturnClass) {
				instance = new ReturnClass();
				_instanceDic[mappingId] = instance;
                delete _classDic[mappingId];
				return instance;
			}
            trace("Not found ClassMapping! Class#named:" + mappingId + ". please on init mapping the class and recall the instance.");
            return null;
        }
        
        private function getKey(hostComponentKey:Object):String {
            
			if (hostComponentKey is String) return hostComponentKey as String;
            //trace("注入的类名称：" + getClassName(hostComponentKey));
            if (getClassName(hostComponentKey) == 'Object') {
                throw new Error("not a object type......");
            }
			return getClassName(hostComponentKey);
		}
        
        private function getClassName(tar:Object):String {
			if (tar is Function) return tar.name;
			return tar["constructor"].name;
		}
    }

}
