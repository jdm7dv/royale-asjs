////////////////////////////////////////////////////////////////////////////////
//
//  Licensed to the Apache Software Foundation (ASF) under one or more
//  contributor license agreements.  See the NOTICE file distributed with
//  this work for additional information regarding copyright ownership.
//  The ASF licenses this file to You under the Apache License, Version 2.0
//  (the "License"); you may not use this file except in compliance with
//  the License.  You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//
////////////////////////////////////////////////////////////////////////////////
package org.apache.royale.html.supportClasses
{
	import org.apache.royale.core.IColorModel;
	import org.apache.royale.core.IColorSpectrumModel;
	import org.apache.royale.core.UIBase;
	import org.apache.royale.events.Event;
	import org.apache.royale.events.IEventDispatcher;
	import org.apache.royale.html.HueSelector;
	import org.apache.royale.utils.hsvToHex;
	import org.apache.royale.utils.loadBeadFromValuesManager;

	/**
	 *  The ColorPickerPopUpWithPalette class is used in ColorPicker. It contains a set of controls for picking a color, incluse a color palette.
	 * 
	 *
     *  @toplevel
	 *  @langversion 3.0
	 *  @playerversion Flash 10.2
	 *  @playerversion AIR 2.6
	 *  @productversion Royale 0.9.6
	 */
	public class ColorPickerPopUpWithPalette extends ColorPickerPopUp
	{
		protected var colorPalette:ColorPalette;
		/**
		 *  constructor.
		 *
		 *  @langversion 3.0
		 *  @playerversion Flash 10.2
		 *  @playerversion AIR 2.6
		 *  @productversion Royale 0.9.6
		 */
		public function ColorPickerPopUpWithPalette()
		{
			super();
			colorPalette = new ColorPalette();
			COMPILE::JS 
			{
				colorPalette.element.style.position = "absolute";
			}
			colorPalette.y = colorSpectrum.height + 10;
			colorPalette.x = colorSpectrum.x;
			colorPalette.width =  300;
			addElement(colorPalette);
		}
	}
}
