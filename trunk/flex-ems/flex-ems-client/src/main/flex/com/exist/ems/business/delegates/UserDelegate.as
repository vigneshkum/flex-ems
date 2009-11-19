package com.exist.ems.business.delegates
{
	import com.exist.ems.model.employee.Employee;
	
	import flash.events.EventDispatcher;
	
	import mx.rpc.IResponder;
	import mx.rpc.remoting.RemoteObject;
	
	public class UserDelegate extends EventDispatcher
	{
		private var service:RemoteObject;
		private var responder:IResponder;
		
		public function UserDelegate(responder:IResponder)
		{
			service = new RemoteObject("userService");
			service.showBusyCursor = true;
			this.responder = responder;
		}

		public function login(username:String, password:String):void
		{
			var call:Object = service.login(username,password);
			call.addResponder(responder);
		}
		
		public function save(emp:Employee):void
		{
			var call:Object = service.save(emp);
			call.addResponder(responder);
		}
	}
}