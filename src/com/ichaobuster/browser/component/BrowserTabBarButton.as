package com.ichaobuster.browser.component
{
	import com.ichaobuster.browser.skin.BrowserTabBarButtonSkin;
	import com.ichaobuster.browser.container.HTMLPageContainer;
	import com.ichaobuster.browser.event.WebPageEvent;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import mx.containers.ViewStack;
	
	import spark.components.ButtonBarButton;
	import spark.components.Image;
	
	public class BrowserTabBarButton extends ButtonBarButton
	{
		public function BrowserTabBarButton()
		{
			super();
			this.setStyle("skinClass", BrowserTabBarButtonSkin);
			this.addEventListener("closeTab", closeHandler);
			doubleClickEnabled = true;
			this.addEventListener(MouseEvent.DOUBLE_CLICK, tabDoubleClickHandler);
		}
		
		public var fixedTab:Boolean = false;
		
		[SkinPart]
		public var closeButton:Image;
		
		private function closeButtonClickHandler(evt:MouseEvent):void
		{
			this.dispatchEvent(new Event('closeTab'));
		}
		
		override public function set data(value:Object):void{
			super.data = value;
			if (value && value.hasOwnProperty("fixed")){
				fixedTab = value.fixed;
			}
		}
		
		protected function tabDoubleClickHandler(event:MouseEvent):void{
			if (!fixedTab){
				closeHandler();
			}
		}
		
		protected function closeHandler(event:Event = null):void {
			var viewStack:ViewStack = ViewStack((owner as BrowserTabBar).dataProvider);
			var currentPage:HTMLPageContainer = viewStack.getItemAt(itemIndex) as HTMLPageContainer;
			if (currentPage) {
				viewStack.removeElementAt(itemIndex);
			}
			if (viewStack.length == 0){
				owner.dispatchEvent(new WebPageEvent(WebPageEvent.CREATE_NEW_TAB_WITH_URL, null, true));
			}
		}
		
		override protected function partAdded(partName:String, instance:Object):void
		{
			super.partAdded(partName, instance);
			if (instance == closeButton)
			{
				closeButton.addEventListener(MouseEvent.CLICK, closeButtonClickHandler);
				this.addEventListener(MouseEvent.ROLL_OVER, function():void
				{
					if (enabled && !fixedTab)
					{
						closeButton.visible = true;
					}else
					{
						closeButton.visible = false;
					}
				});
				this.addEventListener(MouseEvent.ROLL_OUT, function():void
				{
					closeButton.visible=false;
				});
			}
		}
	}
}