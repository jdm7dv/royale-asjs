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
package org.apache.royale.jewel.itemRenderers
{
	COMPILE::JS
    {
	import org.apache.royale.core.WrappedHTMLElement;
	import org.apache.royale.html.util.addElementToWrapper;
    }
    import org.apache.royale.core.IRuntimeSelectableItemRenderer;
    import org.apache.royale.jewel.beads.controls.TextAlign;
    import org.apache.royale.jewel.beads.itemRenderers.ClassSelectorListRuntimeSelectableItemRendererBead;

	/**
	 *  The TableItemRenderer class displays data in string form using the data's toString()
	 *  function.
	 *
	 *  @langversion 3.0
	 *  @playerversion Flash 10.2
	 *  @playerversion AIR 2.6
	 *  @productversion Royale 0.9.4
	 */
	public class TableItemRenderer extends ListItemRenderer
	{
		/**
		 *  constructor.
		 *
		 *  @langversion 3.0
		 *  @playerversion Flash 10.2
		 *  @playerversion AIR 2.6
		 *  @productversion Royale 0.9.4
		 */
		public function TableItemRenderer()
		{
			super();

			typeNames = "jewel tableitem";
			
			if(MXMLDescriptor != null)
			{
            	typeNames += " with-childs";
			}

			textAlign = new TextAlign();
			addBead(textAlign);
            
            // a more PAYG implementation might be to have a base class or interface for
            // TableItemRenderer so that TableCellCloseIconItemRenderer doesn't load
            // a selection bead at all and doesn't need hoverable or selectable APIs
            // to disable default functionality.
            selectionBead = new ClassSelectorListRuntimeSelectableItemRendererBead(classSelectorList);
            addBead(selectionBead);
		}
		
        private var selectionBead:IRuntimeSelectableItemRenderer;
        
        public function get hoverable():Boolean
        {
            return selectionBead.hoverable;
        }
        public function set hoverable(value:Boolean):void
        {
            selectionBead.hoverable = value;
        }
        
        public function get selectable():Boolean
        {
            return selectionBead.selectable;
        }
        public function set selectable(value:Boolean):void
        {
            selectionBead.selectable = value;
        }
        
        /**
         * @royaleignorecoercion org.apache.royale.core.WrappedHTMLElement
         */
        COMPILE::JS
        override protected function createElement():WrappedHTMLElement
        {
			addElementToWrapper(this, 'div');
            return element;
        }
	}
}
