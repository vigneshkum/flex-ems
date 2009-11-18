package com.exist.ems.model
{
	import com.adobe.cairngorm.model.IModelLocator;
	
	[Bindable]
	public class UserData implements IModelLocator
	{
		private static var instance:UserData;
		
		public var firstName:String;
		public var lastName:String;
		public var empCode:String;
		 
		public function UserData(single:SingletonEnforcer)
		{
			if(null == single)
			{
				throw new Error("This a singleton class");
			}
		}

		public static function getInstance():UserData
		{
			if(instance == null)
			{
				instance = new UserData(new SingletonEnforcer());
			}
			return instance;
		}
	}
}

// Utility Class to Deny Access to Constructor
class SingletonEnforcer {}