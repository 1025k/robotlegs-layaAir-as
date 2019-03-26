//------------------------------------------------------------------------------
//  Copyright (c) 2009-2013 the original author or authors. All Rights Reserved. 
// 
//  NOTICE: You are permitted to use, modify, and distribute this file 
//  in accordance with the terms of the license agreement accompanying it. 
//------------------------------------------------------------------------------

package org.mvc.framework.impl
{
    import org.mvc.framework.api.IContext;

	/**
	 * Installs custom extensions into a given context
	 *
	 * @private
	 */
	public class ExtensionInstaller
	{

		/*============================================================================*/
		/* Private Properties                                                         */
		/*============================================================================*/

		private const _classes:Object = new Object();

		private var _context:IContext;

		/*============================================================================*/
		/* Constructor                                                                */
		/*============================================================================*/

		/**
		 * @private
		 */
		public function ExtensionInstaller(context:IContext)
		{
			_context = context;
		}

		/*============================================================================*/
		/* Public Functions                                                           */
		/*============================================================================*/

		/**
		 * Installs the supplied extension
		 * @param extension An object or class implementing IExtension
		 */
		public function install(extension:Object):void
		{
			if (extension is Class)
			{
				_classes[extension] || install(new (extension as Class));
			}
			else
			{
				const extensionClass:Class = extension['constructor'] as Class;
				if (_classes[extensionClass])
					return;
				_classes[extensionClass] = true;
				extension.extend(_context);
			}
		}

		/**
		 * Destroy
		 */
		public function destroy():void
		{
			for (var extensionClass:Object in _classes)
			{
				delete _classes[extensionClass];
			}
		}
	}
}
