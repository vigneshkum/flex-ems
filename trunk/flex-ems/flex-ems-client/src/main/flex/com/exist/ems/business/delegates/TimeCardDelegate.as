package com.exist.ems.business.delegates
{
	import com.exist.ems.model.ReportVO;
	
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
			this.service.showBusyCursor = true;
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
		
		public function listReportsLog(vo:ReportVO):void
		{
			var call:Object = service.listReportsLog(vo);
			call.addResponder(responder);
		}
		
		public function countReportsLog(vo:ReportVO):void
		{
			var call:Object = service.countReportsLog(vo);
			call.addResponder(responder);
		}
	}
}