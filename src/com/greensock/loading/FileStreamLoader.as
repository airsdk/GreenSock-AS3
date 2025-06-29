/**
 * @author Michael Archbold (https://github.com/marchbold)
 * @created 25/6/2025
 */
package com.greensock.loading
{
	import com.greensock.events.LoaderEvent;

	import flash.events.ErrorEvent;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.utils.ByteArray;

	public class FileStreamLoader extends DataStreamLoader
	{
		private static var _classActivated:Boolean = _activateClass( "FileStreamLoader", FileStreamLoader, "txt,js" );

		private var _destination:File;

		public function FileStreamLoader( urlOrRequest:*, destination:File, vars:Object = null )
		{
			super( urlOrRequest, vars );
			_type = "FileStreamLoader";

			if (destination.exists)
			{
				throw new Error( "Destination file already exists: " + _destination.nativePath );
			}

			_destination = destination;
			this.addEventListener( "data", _dataHandler );
		}


		protected function _dataHandler( event:LoaderEvent ):void
		{
			try
			{
				// Save the data to the destination file
				var fileStream:FileStream = new FileStream();
				fileStream.open( _destination, FileMode.APPEND );
				fileStream.writeBytes( event.data as ByteArray );
				fileStream.close();
			}
			catch (e:Error)
			{
				_errorHandler( new ErrorEvent( ErrorEvent.ERROR, false, false, e.message, e.errorID ) );
			}
		}

	}
}
