package com.exist.ems.model
{
	import com.adobe.cairngorm.model.IModelLocator;

	public class UserModelLocator implements IModelLocator
	{
		// Single Instance of Our ModelLocator
		private static var instance:UserModelLocator;
		public function UserModelLocator(enforcer:SingletonEnforcer) {
		if (enforcer == null) {
				throw new Error( "You Can Only Have One UserModelLocator" );
			}
			
		}
		// Returns the Single Instance
		public static function getInstance() : UserModelLocator {
			if (instance == null) {
				instance = new UserModelLocator( new SingletonEnforcer );
			}
			return instance;
		}
		//DEFINE YOUR VARIABLES HERE
		[Bindable]
		public var modelWorkflowState:uint = 0;
		
		public static const LOGIN_SCREEN:uint = 0;
		public static const WELCOME_SCREEN:uint = 1;

	}
}

// Utility Class to Deny Access to Constructor
class SingletonEnforcer {}