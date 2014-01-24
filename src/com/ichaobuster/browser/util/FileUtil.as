package com.ichaobuster.browser.util
{
	public class FileUtil
	{
		/**
		 * 允许直接打开的文件后缀
		 */
		public static const fileSuffixArray:Array = [
			"doc","xls","txt","pdf","ppt","rtf","zip","rar","7z","tiff","jpg",
			"jpeg","docx","pptx","xlsx","gd","png","bmp"
		];
		
		/**
		 * 判断文件名后缀是否符合即时打开的标准
		 * */
		public static function validateFileNameSuffix(fileName:String):Boolean{
			if(fileName){
				var dotIndex:int = fileName.lastIndexOf(".");
				if(dotIndex>-1){
					var suffix:String = fileName.substr(dotIndex+1).toLowerCase();
					if(fileSuffixArray.indexOf(suffix)>-1){
						return true;
					}
				}
			}
			return false;
		}
	}
}