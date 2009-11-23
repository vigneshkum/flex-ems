package com.exist.ems.control.commands.timecard
{
	import com.exist.ems.business.delegates.TimeCardDelegate;
	import com.exist.ems.control.commands.BaseEmsCommand;
	import com.exist.ems.view.service.timecard.TimeCardService;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	
	public class ReportLogCommand extends BaseEmsCommand
	{
		private var timeCardService:TimeCardService;
		
		public function ReportLogCommand()
		{
			
		}
		
		override protected function callDelegate() : void
		{
			timeCardService = this.baseService as TimeCardService;
			var timeCardDelegate:TimeCardDelegate = new TimeCardDelegate(this);
			timeCardDelegate.listReportsLog(timeCardService.rptVO);
		}
		
		override public function result(data:Object) : void
		{
			timeCardService.listOfReportsLog = data.result as ArrayCollection;
		}
		
		override public function fault(info:Object) : void
		{
			Alert.show("Error occured","Error");
		}
	}
}