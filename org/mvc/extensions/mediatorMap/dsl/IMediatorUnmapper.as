package org.mvc.extensions.mediatorMap.dsl
{

	public interface IMediatorUnmapper
	{
		function fromMediator(mediatorClass:Class):void;
		function fromAll():void;
	}
}
