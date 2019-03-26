package org.mvc.extensions.mediatorMap.dsl
{

	public interface IMediatorMapper
	{
		function toMediator(mediatorClass:Class):IMediatorConfigurator;
	}
}
