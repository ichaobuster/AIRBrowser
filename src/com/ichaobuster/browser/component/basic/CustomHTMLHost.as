package com.ichaobuster.browser.component.basic
{
	import flash.html.HTMLHost;
	import flash.html.HTMLLoader;
	import flash.html.HTMLWindowCreateOptions;
	import mx.events.DynamicEvent;
	
	import com.ichaobuster.browser.util.HttpResponseUtils
	
	public class CustomHTMLHost extends HTMLHost
	{
		
		public var filename:String = "";
		public var newLocation:String = "";
		
		private var httpResponseUtils:HttpResponseUtils = HttpResponseUtils.getInstance();
		
		public function CustomHTMLHost(defaultBehaviors:Boolean=true)
		{
			super(defaultBehaviors);
		}
		
		override public function createWindow(windowCreateOptions:HTMLWindowCreateOptions):HTMLLoader
		{
			var loader:HTMLLoader = new HTMLLoader();
			
			var newTabEvent:DynamicEvent = new DynamicEvent("createNewTabEvent",true);
			newTabEvent["htmlLoader"] = loader;
			htmlLoader.dispatchEvent(newTabEvent);
			return loader;
		}
		
		override public function updateTitle(title:String):void
		{
			
		}
		
	}
}