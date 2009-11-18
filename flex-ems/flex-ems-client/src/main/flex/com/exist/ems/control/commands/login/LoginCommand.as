package com.exist.ems.control.commands.login
{
	import com.exist.ems.business.delegates.UserDelegate;
	import com.exist.ems.control.commands.BaseEmsCommand;
	import com.exist.ems.model.UserModelLocator;
	import com.exist.ems.view.service.user.UserService;
	
	import flash.events.Event;
	
	import mx.controls.Alert;
	import mx.core.Application;

	public class LoginCommand extends BaseEmsCommand
	{
		public var userService:UserService;
		public var modelLocator:UserModelLocator = UserModelLocator.getInstance();
		
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
				Application.application.dispatchEvent(new Event("loginMainEvent",true,false));
			}
			else
			{
				Alert.show("Username or Password is not valid","Invalid Credentials");
			}
		}
		
		override public function fault( event : Object ) : void
		{
			Alert.show("Error occured","Error");
		}
	}
}