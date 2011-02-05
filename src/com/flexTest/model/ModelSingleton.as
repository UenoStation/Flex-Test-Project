package com.flexTest.model {
	import flashx.textLayout.debug.Debugging;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import mx.rpc.http.HTTPService;

	/**
	* @author Alex
	*/
	public class ModelSingleton 
	{
		import nl.demonsters.debugger.MonsterDebugger;

		[Bindable]
		public var __qObj : Object;
		
		private static var _instance:ModelSingleton;
		private static var _allowInstantiation:Boolean;
		
		private var _xString : String = 'xml/dataControls.xml';
		private var ldr : URLLoader;
		private var __data : XMLList;
		private var debugger : MonsterDebugger; 

		public static function getInstance():ModelSingleton 
		{
			if (_instance == null) 
			{
				_allowInstantiation = true;
				_instance = new ModelSingleton();
				_allowInstantiation = false;
				
				_instance.loadData();
			}
			return _instance;
		}

		public function ModelSingleton():void 
		{
			if (!_allowInstantiation) 
			{
				throw new Error("Error: Instantiation failed: Use ModelSingleton.getInstance() instead of new.");
			}
		}
		
		private function loadData() : void
		{
			debugger = new MonsterDebugger(this);
			ldr = new URLLoader();
			configureListeners();
			
			try
			{
				ldr.load(new URLRequest(_xString));	
			}
			catch(error:Error)
			{
				MonsterDebugger.trace(this, error.message);	
			}
		}
		
		private function configureListeners() : void
		{
			ldr.addEventListener(Event.COMPLETE, onXMLLoaded);
		}
		
		private function onXMLLoaded( evt : Event ) : void
		{
			MonsterDebugger.trace(this, "onXMLLoaded was hit f00!");
			MonsterDebugger.trace(this, URLLoader(evt.target).data);
		}
		
		public function getQuestion() : void
		{
			
//			__qObj
		}


	} // end class

} // end package
