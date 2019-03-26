//------------------------------------------------------------------------------
//  Copyright (c) 2012 the original author or authors. All Rights Reserved.
//
//  NOTICE: You are permitted to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//------------------------------------------------------------------------------

package org.mvc.extensions.layaCommandMap.api
{
    import org.mvc.extensions.commandCenter.dsl.ICommandMapper;
    import org.mvc.extensions.commandCenter.dsl.ICommandUnmapper;



	/**
	 * The Signal Command Map allows you to bind Signals to Commands
	 */
	public interface ILayaCommandMap
	{

		function map( signalClass:Class ):ICommandMapper;
		function unmap( signalClass:Class ):ICommandUnmapper;
	}
}
