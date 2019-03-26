package org.mvc.framework.api {
    import laya.events.EventDispatcher;
    
    /**
     * ...
     * @author hoywe
     */
    public interface IContextEvent {
        
        function on(type:String, caller:*, listener:Function, args:Array = null):EventDispatcher;
        function once(type:String, caller:*, listener:Function, args:Array = null):EventDispatcher;
        function off(type:String, caller:*, listener:Function, onceOnly:Boolean = false):EventDispatcher;
        function offAll(type:String = null):EventDispatcher;
        function event(type:String, data:* = null):Boolean;
    }
    
}
