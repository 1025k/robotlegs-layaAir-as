package org.mvc.framework.api {
    
    /**
     * ...
     * @author hoywe
     */
    public interface IInjector {
        
        function mapClass(type:Class, name:String = ''):void;
        function mapToValue(type:Object, useValue:Object, name:String = ''):*;
        function mapValue(instance:Object, name:String = ''):*;
        function unmap(type:Class, name:String = ''):void;
        function hasMapRule(type:Object, name:String = ''):Boolean;
        function getInstance(type:Object, name:String = ''):*;
    }
    
}
