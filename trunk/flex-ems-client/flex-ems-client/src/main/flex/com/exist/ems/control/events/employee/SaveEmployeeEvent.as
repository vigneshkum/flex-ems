package com.exist.ems.control.events.employee
{
	import com.exist.ems.control.events.BaseEvents;
	import com.exist.ems.view.service.user.UserService;
	
	import flash.events.Event;

	public class SaveEmployeeEvent extends BaseEvents
	{
		public static const SAVE_EMPLOYEE:String = "saveEmployee";
		private var userService:UserService;
		
		public function SaveEmployeeEvent(service:UserService)
		{
			super(SAVE_EMPLOYEE, service);
			this.userService = service;
		}
		
		override public function clone():Event
		{
			return new SaveEmployeeEvent(this.userService);
		}
	}
}