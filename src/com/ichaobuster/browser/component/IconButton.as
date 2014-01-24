package com.ichaobuster.browser.component
{
	
	import com.ichaobuster.browser.skin.IconButtonSkin;
	
	import spark.components.Button;
	
	public class IconButton extends Button
	{
		public function IconButton()
		{
			super();
			this.setStyle("skinClass", IconButtonSkin);
		}
	}
}