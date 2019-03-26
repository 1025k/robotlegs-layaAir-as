//------------------------------------------------------------------------------
//  Copyright (c) 2009-2013 the original author or authors. All Rights Reserved. 
// 
//  NOTICE: You are permitted to use, modify, and distribute this file 
//  in accordance with the terms of the license agreement accompanying it. 
//------------------------------------------------------------------------------

package org.mvc.extensions.commandCenter.dsl
{

	/**
	 * @private
	 */
	public interface ICommandMapper
	{
		function toCommand(commandClass:Class):ICommandConfigurator;
	}
}
