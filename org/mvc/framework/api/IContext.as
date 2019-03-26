package org.mvc.framework.api {
    
    /**
     * ...
     * @author hoywe
     */
    public interface IContext extends IContextEvent {
        
        function get injector():IInjector;
        function install(... extensions):IContext;
        function configure(... configs):IContext;
        function init():void;
    }
    
}
