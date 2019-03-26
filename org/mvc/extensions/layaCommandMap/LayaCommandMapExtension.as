package org.mvc.extensions.layaCommandMap
{
    import org.mvc.extensions.layaCommandMap.api.ILayaCommandMap;
    import org.mvc.extensions.layaCommandMap.impl.LayaCommandMap;
    import org.mvc.framework.api.IContext;
    import org.mvc.framework.api.IExtension;
    import org.mvc.framework.impl.UID;

    public class LayaCommandMapExtension implements IExtension
    {
        private const _uid:String = UID.create(LayaCommandMapExtension);

        public function extend(context:IContext):void {
            context.injector.mapValue(new LayaCommandMap());
        }

        public function toString():String {
            return _uid;
        }
    }
}
