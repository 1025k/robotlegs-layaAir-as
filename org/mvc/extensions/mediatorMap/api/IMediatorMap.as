package org.mvc.extensions.mediatorMap.api
{
    import org.mvc.extensions.mediatorMap.dsl.IMediatorMapper;
    import org.mvc.extensions.mediatorMap.dsl.IMediatorUnmapper;
	
	public interface IMediatorMap
	{
		function map(type:Class):IMediatorMapper;
		function unmap(type:Class):IMediatorUnmapper;
        function mediate(item:Object):void;
        function unmediate(item:Object):void;
		function unmediateAll():void;
	}
}
