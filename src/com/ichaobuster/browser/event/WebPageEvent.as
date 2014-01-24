package com.ichaobuster.browser.event
{
	import flash.events.Event;
	
	public class WebPageEvent extends Event
	{
		public static const CREATE_NEW_TAB_WITH_URL:String = "createNewTabWithUrl";
		public static const CLOSE_THIS_TAB:String = "closeThisTab";
		
		public var location:String = "";
		
		public function WebPageEvent(type:String, location:String="", bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			this.location = location;
		}
	}
}