/**
 * @author Michael Archbold (https://github.com/marchbold)
 * @created 28/5/2025
 */
package com.greensock.loading
{
	import com.greensock.events.LoaderEvent;
	import com.greensock.loading.core.LoaderCore;
	import com.greensock.loading.core.LoaderItem;

	import flash.events.Event;
	import flash.events.HTTPStatusEvent;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.URLStream;
	import flash.utils.ByteArray;

	public class DataStreamLoader extends LoaderItem
	{
		private static var _classActivated:Boolean = _activateClass( "DataStreamLoader", DataStreamLoader, "txt,js" );

		protected var _stream:URLStream;


		public function DataStreamLoader( urlOrRequest:*, vars:Object = null )
		{
			LoaderCore._listenerTypes["onData"] = "data";
			super( urlOrRequest, vars );
			_type = "DataStreamLoader";
			_stream = new URLStream();
			_stream.addEventListener( ProgressEvent.PROGRESS, _progressHandler, false, 0, true );
			_stream.addEventListener( Event.COMPLETE, _receiveDataHandler, false, 0, true );
			_stream.addEventListener( IOErrorEvent.IO_ERROR, _failHandler, false, 0, true );
			_stream.addEventListener( SecurityErrorEvent.SECURITY_ERROR, _failHandler, false, 0, true );
			_stream.addEventListener( HTTPStatusEvent.HTTP_STATUS, _httpStatusHandler, false, 0, true );
			_stream.addEventListener( HTTPStatusEvent.HTTP_RESPONSE_STATUS, _httpStatusHandler, false, 0, true );
		}


		override protected function _load():void
		{
			_prepRequest();
			_stream.load( _request );
		}


		override protected function _dump( scrubLevel:int = 0, newStatus:int = 0, suppressEvents:Boolean = false ):void
		{
			if (_status == LoaderStatus.LOADING)
			{
				try
				{
					_stream.close();
				}
				catch (error:Error)
				{}
			}
			super._dump( scrubLevel, newStatus, suppressEvents );
		}


		override protected function _progressHandler( event:Event ):void
		{
			super._progressHandler( event );

			var chunk:ByteArray = new ByteArray();
			_stream.readBytes( chunk, 0, _stream.bytesAvailable );

			dispatchEvent( new LoaderEvent( "data", this, "", chunk ) );
		}


		protected function _receiveDataHandler( event:Event ):void
		{
			super._completeHandler( event );
		}

	}

}