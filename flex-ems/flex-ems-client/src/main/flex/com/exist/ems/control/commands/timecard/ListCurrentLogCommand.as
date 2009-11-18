package com.exist.ems.control.commands.timecard
{
	import com.exist.ems.business.delegates.TimeCardDelegate;
	import com.exist.ems.control.commands.BaseEmsCommand;
	import com.exist.ems.view.service.timecard.TimeCardService;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;

	public class ListCurrentLogCommand extends BaseEmsCommand
	{
		private var timeCardService:TimeCardService;
		
		public function ListCurrentLogCommand()
		{
			
		}
		
		override protected function callDelegate():void
		{
			this.timeCardService = this.baseService as TimeCardService;
			var timeCardDelegate:TimeCardDelegate = new TimeCardDelegate(this);
			timeCardDelegate.getCurrentWeekLog(timeCardService.empCode);
		}
		
		override public function result(data:Object):void
		{
			//this.timeCardService.listOfCurrentLog = data.result as ArrayCollection;
			timeCardService.setCurrentWeeLog(data);
		}
		
		override public function fault(info:Object):void
		{
			Alert.show("Error occured","Error");
		}
	}
}