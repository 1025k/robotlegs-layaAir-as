package org.mvc.extensions.layaCommandMap.api {
    
    import laya.events.EventDispatcher;
    
    /**
     * ...
     * @author hoywe
     */
    public interface ICommandEvent {
        
        function add(listener:Function, args:Array = null):EventDispatcher;
        function addOnce(listener:Function, args:Array = null):EventDispatcher;
        function remove(listener:Function):EventDispatcher;
        function dispatch(type:String, data:* = null):Boolean;
        function exec():Boolean;
    }
    
}
