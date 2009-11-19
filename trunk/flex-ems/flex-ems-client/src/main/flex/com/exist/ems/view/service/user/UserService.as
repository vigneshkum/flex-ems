package com.exist.ems.view.service.user
{
	import com.exist.ems.control.events.employee.SaveEmployeeEvent;
	import com.exist.ems.control.events.login.LoginEvent;
	import com.exist.ems.model.UserData;
	import com.exist.ems.model.employee.Employee;
	import com.exist.ems.view.service.BaseService;

	public class UserService extends BaseService
	{
		[Bindable]
		public var _verified:Boolean;
		[Bindable]
		public var username:String;
		[Bindable]
		public var password:String;
		[Bindable]
		public var employee:Employee;
		
		
		public function UserService()
		{
		}
		
		public function login(user:String, pass:String):void
		{
			
			this.username = user;
			this.password = pass;
			new LoginEvent(this).dispatch();
		}
		
		public function addUserData(data:Object):void
		{
			var userdata:UserData = UserData.getInstance();
			userdata.empCode = data.empCode;
			userdata.firstName = data.firstName;
			userdata.lastName = data.lastName; 
		}
		
		public function addEmployee(emp:Employee):void
		{
			this.employee = emp;
			new SaveEmployeeEvent(this).dispatch();
		}
		
		public function setVerified(success:Boolean):void
		{
			this._verified = success;
		}
		
		
	}
}