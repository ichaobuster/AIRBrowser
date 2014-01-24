package com.ichaobuster.browser.util
{
	import flash.net.URLRequestHeader;
	import flash.utils.ByteArray;
	
	import mx.utils.Base64Decoder;
	import mx.utils.StringUtil;

	public class HttpResponseUtils
	{
		
		/**response header中检出filename的正则式*/
		private static var regRspHead:RegExp = /filename="?([^"]*)"?/;
		/** 检出BASE64编码后的UTF8字符 */
		private static var regB64:RegExp = /\s*=\?UTF8\?B\?([^"]*)\?=\s*/;
		
		private static var _instance:HttpResponseUtils;
		
		public static function getInstance():HttpResponseUtils
		{
			if(_instance == null){
				_instance=new HttpResponseUtils();
			}
			return _instance;
		}
		
		/** 报文头中获取并解码文件名 */
		public function getFileNameFromResponseHeader(responseHeaders:Array, location:String):String
		{
			var filename:String = "";
			for each(var rspHeader:URLRequestHeader in responseHeaders){
				if (rspHeader.name.toLowerCase() == "content-disposition")
				{
					filename = decodeURI(rspHeader.value.match(regRspHead)[1]);
					if (filename.indexOf("=?UTF8?B?")>-1)
						filename = decodeBase64Utf8Code(filename);
					return filename;
				}
			}
			filename = location.substring(location.lastIndexOf("/")+1);
			return filename;
		}
		
		/** 解码UTF-8+BASE64编码 */
		public function decodeBase64Utf8Code(source:String):String
		{
			// 如果是UTF8+BASE64编码的
			if (source.indexOf("=?UTF8?B?")>-1)
			{
				var codeArray:Array = source.split(" ");
				source = "";
				var decoder:Base64Decoder = new Base64Decoder();
				for each(var code:String in codeArray)
				{
					code = StringUtil.trim(code);
					if (code=="")
					{
						continue;
					}
					code = code.match(regB64)[1];
					decoder.decode(code);
					source = source + decoder.toByteArray().toString();
				}
			}
			return source;
		}
		
		/** 将二进制数据转为String */
		public function convertByteArrayToString(bytes:ByteArray):String
		{
			var str:String;
			if (bytes) {
				bytes.position = 0;
				str = bytes.readUTFBytes(bytes.length);
			}
			return str;
		}
	}
}