//------------------------------------------------------------------------------
//  Copyright (c) 2009-2013 the original author or authors. All Rights Reserved. 
// 
//  NOTICE: You are permitted to use, modify, and distribute this file 
//  in accordance with the terms of the license agreement accompanying it. 
//------------------------------------------------------------------------------

package org.mvc.framework.impl
{

	public class UID
	{

		/*============================================================================*/
		/* Private Static Properties                                                  */
		/*============================================================================*/

		private static var _i:uint;

		/*============================================================================*/
		/* Public Static Functions                                                    */
		/*============================================================================*/

		/**
		 * Generates a UID for a given source object or class
		 * @param source The source object or class
		 * @return Generated UID
		 */
		public static function create(source:* = null):String
		{
			if (source is Class)
				source = getClassName(source);
			return (source ? source + '-' : '')
				+ (_i++).toString(16)
				+ '-'
				+ (Math.random() * 255).toString(16);
		}
        
        private static function getClassName(tar:Object):String {
            
			if (tar is Function) return tar.name;
			return tar["constructor"].name;
		}
	}
}
