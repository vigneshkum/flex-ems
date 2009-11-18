package com.exist.ems.model.employee
{
	[RemoteClass(alias="com.exist.ems.model.Employee")]
	[Bindable]
	public class Employee
	{
		public var id:String = null;
		public var empCode:String;
		public var position:String;
		public var jobLevel:String;
		public var firstName:String;
		public var lastName:String;
		public var birthDate:Date;
		public var dateHired:Date;
		public var username:String;
		public var password:String;
		public var email:String;
			
		public function Employee()
		{
			
		}

	}
}