package com.ichaobuster.browser.event
{
	import flash.events.Event;
	import flash.utils.ByteArray;
	
	public class FileDownloadEvent extends Event
	{
		public static const FILE_DOWNLOAD_EVENT:String = "fileDownloadEvent";
		
		public var fileName:String = "";
		
		public var fileData:ByteArray;
		
		public function FileDownloadEvent(type:String, fileData:ByteArray, fileName:String, bubbles:Boolean=true, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			this.fileData = fileData;
			this.fileName = fileName;
		}
	}
}