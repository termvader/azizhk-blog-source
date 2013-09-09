---
date: 2013-09-09 23:00:00
layout: post
slug: Flash-WebP
title: Flash + WebP 
description: Leverage Google's WebP, An image format for the Web to speed up the loading time of your Flash Projects.
category: Adobe Flash
tags: 
- Flash
- WebP
---

> WebP is a new image format that provides lossless and lossy compression for images on the web. WebP lossless images are 26% smaller in size compared to PNGs. WebP lossy images are 25-34% smaller in size compared to JPEG images at equivalent SSIM index. WebP supports lossless transparency (also known as alpha channel) with just 22% additional bytes. Transparency is also supported with lossy compression and typically provides 3x smaller file sizes compared to PNG when lossy compression is acceptable for the red/green/blue color channels.
>
> <cite>[Google Developers](https://developers.google.com/speed/webp/)</cite>

WebP is supported by a variety of tools. In addition, it is now natively supported in Google Chrome, the Google Chrome Frame plug-in for Internet Explorer, Opera 11.10 and Android Ice Cream Sandwich. But it still is not supported by Firefox, Internet Explorer and many others. So Web Developers still have to provide fallbacks for this format. Either they have to use [LibWebPJS](http://libwebpjs.hohenlimburg.org/) or serve both web-p and jpg/png.

Luckily for Flash developers, who always have had no problems worrying about working across various platforms as that work is done by the Flash Player itself. There are multiple libraries which we can use.

<ul>
	<li><a href="http://unitzeroone.com/blog/2011/11/20/webp-decoder-for-flash/" target="_blank">Webplib.swc by UnitZeroOne</a></li>
	<li><a href="http://www.etherdream.com/webp/" target="_blank">zjcqoo's Implementation</a></li>
	<li><a href="http://www.sineysoft.com/post/114" target="_blank">Sineysoft's Implementation</a></li>
</ul>
 
Somehow UnitZeroOne's and zjcqoo's implementation gave me some problems. Probably I was using the latest version of the convertor and they were not. Also Sineysoft's version supported transparency, did not try that with the others. So I used Sineysoft's. Unfortunately his swc is very bulky, roughly 300 KB. So it would be of use if the difference between your jpg images and webp images is less than 300 KB.

You can see my work [here](http://www.bits-oasis.org/2011/webp/). Its an old, unused site for our college's cultural festival which I had built. The base site was ~4 MB while now its 2.1 MB. I have ported the panorama in the background only, nothing else.

##Code

Download webpswc.swc from [here](https://github.com/termvader/WebPDemo/blob/master/lib/webpswc.swc?raw=true).

Get the FlashDevelop Project from <a href="https://github.com/termvader/WebPDemo" target="_blank">here</a>.

Or Just the code.

<div class="highlight">
<pre><code>package 
{
    import sineysoft.WebpSwc;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.utils.ByteArray;
	
	public class Main extends Sprite 
	{
		[Embed(source = "WebPImage.webp", mimeType = "application/octet-stream")]
		private const WebPImageClass:Class;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			
			var bitmapData:BitmapData = WebpSwc.decode(new WebPImageClass() as ByteArray);
			var bitmap:Bitmap = new Bitmap(bitmapData);
			bitmap.scaleX = 0.5;
			bitmap.scaleY = 0.5;
			addChild(bitmap);
			// entry point
		}	
	}	
}</code></pre>
</div>

You can also load the image at runtime, not having to embed it in the swf itself. I'll add code for that also, soon.
