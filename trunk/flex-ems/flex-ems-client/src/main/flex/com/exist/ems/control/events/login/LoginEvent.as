package com.exist.ems.control.events.login
{
	import com.exist.ems.control.events.BaseEvents;
	import com.exist.ems.view.service.user.UserService;
	
	import flash.events.Event;
	
	public class LoginEvent extends BaseEvents
	{
		public static const LOGIN:String = "Login";
		public static const MAIN_LOGIN:String = "loginMainEvent";
		public static const FAILED_LOGIN:String = "failedLogEvent";
		
		private var userService:UserService;
		
		public function LoginEvent(service:UserService)
		{
			super(LOGIN, service);
			this.userService = service;
		}
		
		override public function clone():Event
		{
			return new LoginEvent(this.userService);
		}
	}
}