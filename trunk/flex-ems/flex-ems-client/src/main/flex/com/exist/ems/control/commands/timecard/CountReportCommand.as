package com.exist.ems.control.commands.timecard
{
	import com.exist.ems.business.delegates.TimeCardDelegate;
	import com.exist.ems.control.commands.BaseEmsCommand;
	import com.exist.ems.utils.ConstantEvents;
	import com.exist.ems.view.service.timecard.TimeCardService;
	
	import flash.events.Event;
	
	import mx.controls.Alert;
	import mx.core.Application;
	
	public class CountReportCommand extends BaseEmsCommand
	{
		private var timeCardService:TimeCardService;
		
		public function CountReportCommand()
		{
			
		}
		
		override protected function callDelegate() : void
		{
			timeCardService = this.baseService as TimeCardService;
			var timeCardDelegate:TimeCardDelegate = new TimeCardDelegate(this);
			timeCardDelegate.countReportsLog(timeCardService.rptVO);
		}
		
		override public function result(data:Object) : void
		{
			timeCardService.totalReport = data.result;
			Application.application.dispatchEvent(new Event(ConstantEvents.LOADED_REPORT));
		}
		
		override public function fault(info:Object) : void
		{
			Alert.show("Error occured","Error");
		}
	}
}