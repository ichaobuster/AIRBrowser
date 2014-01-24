package com.ichaobuster.browser.util
{
	import flash.net.SharedObject;

	public class SharedObjectUtils
	{
		public static const soName:String = "browser_so";
		
		/**
		 * 存储FlexSO
		 * */
		public static function saveShareObject(key:String,value:Object):void{
			var so:SharedObject=SharedObject.getLocal(soName);
			so.data[key] = value;
			so.flush();
		}
		/**
		 * 读取FlexSO
		 * */
		public static function getShareObject(key:String):Object{
			var so:SharedObject=SharedObject.getLocal(soName);
			return so.data[key];
		}
		
	}
}