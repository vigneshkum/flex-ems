package com.exist.ems.control.commands.employee
{
	import com.exist.ems.business.delegates.UserDelegate;
	import com.exist.ems.control.commands.BaseEmsCommand;
	import com.exist.ems.view.service.user.UserService;
	
	import flash.events.Event;
	
	import mx.controls.Alert;
	import mx.core.Application;

	public class SaveEmployeeCommand extends BaseEmsCommand
	{
		private var userService:UserService;
		
		public function SaveEmployeeCommand()
		{
			
		}
		
		override protected function callDelegate():void
		{
			this.userService = this.baseService as UserService;
			var userDeleagate:UserDelegate = new UserDelegate(this);
			userDeleagate.save(userService.employee);
		}
		
		override public function result(data:Object):void
		{
			Application.application.dispatchEvent(new Event("verified", true,false));
			Alert.show("Employee credentials successfully save.","Success");
		}
		
		override public function fault(info:Object):void
		{
			Alert.show("Error occured","Error");
		}
	}
}