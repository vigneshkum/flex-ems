package com.exist.ems.control.commands.login
{
	import com.exist.ems.business.delegates.UserDelegate;
	import com.exist.ems.control.commands.BaseEmsCommand;
	import com.exist.ems.control.events.login.LoginEvent;
	import com.exist.ems.view.service.user.UserService;
	
	import flash.events.Event;
	
	import mx.controls.Alert;
	import mx.core.Application;

	public class LoginCommand extends BaseEmsCommand
	{
		private var userService:UserService;
		
		public function LoginCommand()
		{
			
		}
		
		override protected function callDelegate():void
		{
			this.userService = this.baseService as UserService;
			var logDelegate:UserDelegate = new UserDelegate(this);
			logDelegate.login(userService.username,userService.password);
			//if(userService.username == "eman" && userService.password == "password") {
			//	modelLocator.modelWorkflowState = UserModelLocator.WELCOME_SCREEN;
			//	trace("ang state ay:"+modelLocator.modelWorkflowState);
			//}
		}
		
		override public function result(data:Object):void
		{
			if(data.result != null)
			{
				this.userService.addUserData(data.result);
				Application.application.dispatchEvent(new Event(LoginEvent.MAIN_LOGIN,true,false));
			}
			else
			{
				//Alert.show("Username or Password is not valid","Invalid Credentials");
				Application.application.dispatchEvent(new Event(LoginEvent.FAILED_LOGIN,true,false));
			}
		}
		
		override public function fault( event : Object ) : void
		{
			Alert.show("Error occured","Error");
		}
	}
}