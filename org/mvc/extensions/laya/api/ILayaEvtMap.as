package org.mvc.extensions.laya.api {
    
    
    /**
     * ...
     * @author hoywe
     */
    public interface ILayaEvtMap {
        
        function mapListener(dispatcher:*, type:String, caller:*, listener:Function, args:Array = null):void;
        function mapMEvt(type:String, caller:*, listener:Function, args:Array = null):void;
        function mapSignal(dispatcher:*, caller:*, listener:Function, args:Array = null):void;
		function unmapListener(type:String, listener:Function):void;
		function unmapListeners():void;
    }
    
}
