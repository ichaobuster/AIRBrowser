package com.ichaobuster.browser.component
{
	
	import com.ichaobuster.browser.skin.BrowserTabBarSkin;
	
	import spark.components.TabBar;
	
	public class BrowserTabBar extends TabBar
	{
		public function BrowserTabBar()
		{
			super();
			this.setStyle("skinClass", BrowserTabBarSkin);
		}
	}
}