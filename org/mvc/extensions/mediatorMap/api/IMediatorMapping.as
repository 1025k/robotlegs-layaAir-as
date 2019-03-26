package org.mvc.extensions.mediatorMap.api
{

	public interface IMediatorMapping
	{
		
		function get mediatorClass():Class;
        function get typeClass():Class;
		function get autoRemoveEnabled():Boolean;
	}
}
