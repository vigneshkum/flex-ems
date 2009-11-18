package com.exist.ems.business.delegates
{
	import flash.events.EventDispatcher;
	
	import mx.rpc.IResponder;
	import mx.rpc.remoting.RemoteObject;
	
	public class TimeCardDelegate extends EventDispatcher
	{
		private var service:RemoteObject
		private var responder:IResponder;
		
		public function TimeCardDelegate(responder:IResponder)
		{
			this.service = new RemoteObject("timecardService");
			this.responder = responder;
		}

		public function getCurrentWeekLog(empCode:String):void
		{
			var call:Object = service.listCurrentWeekLog(empCode);
			call.addResponder(responder);
		}
		
		public function getPreviousWeekLog(empCode:String):void
		{
			var call:Object = service.listPreviousWeekLog(empCode);
			call.addResponder(responder);
		}
		
		public function timeCardIN(empCode:String):void
		{
			var call:Object = service.saveTimeIn(empCode);
			call.addResponder(responder);
		}
		
		public function timeCardOUT(empCode:String):void
		{
			var call:Object = service.saveTimeOut(empCode);
			call.addResponder(responder);
		}
	}
}