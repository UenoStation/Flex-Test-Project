package com.flexTest.model {

	/**
	* @author Alex
	*/
	public class ModelSingleton 
	{

		private static var _instance:ModelSingleton;
		private static var _allowInstantiation:Boolean;
		
		private var __data : XMLList; 

		public static function getInstance():ModelSingleton 
		{
			if (_instance == null) 
			{
				_allowInstantiation = true;
				_instance = new ModelSingleton();
				_allowInstantiation = false;
				
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


	} // end class

} // end package
