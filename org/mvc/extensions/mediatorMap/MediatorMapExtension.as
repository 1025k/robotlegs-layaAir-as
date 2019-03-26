package org.mvc.extensions.mediatorMap {
    import org.mvc.extensions.mediatorMap.impl.MediatorMap;
    import org.mvc.framework.api.IContext;
	import org.mvc.framework.api.IExtension;
    import org.mvc.framework.impl.UID;
	
	/**
     * ...
     * @author hoywe
     */
    public class MediatorMapExtension implements IExtension {
        
        private const _uid:String = UID.create(MediatorMapExtension);
        
        
        /* INTERFACE com.zhang.framework.api.IExtension */
        
        public function extend(context:IContext):void {
            
            context.injector.mapValue(new MediatorMap());
        }
        
        public function toString():String {
            return _uid;
        }
        
    }

}
