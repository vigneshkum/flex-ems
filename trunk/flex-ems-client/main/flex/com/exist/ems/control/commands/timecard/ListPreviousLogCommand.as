package com.exist.ems.control.commands.timecard
{
	import com.exist.ems.business.delegates.TimeCardDelegate;
	import com.exist.ems.control.commands.BaseEmsCommand;
	import com.exist.ems.view.service.timecard.TimeCardService;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;

	public class ListPreviousLogCommand extends BaseEmsCommand
	{
		private var timeCardService:TimeCardService;
		
		public function ListPreviousLogCommand()
		{
			
		}
		
		override protected function callDelegate():void
		{
			this.timeCardService = this.baseService as TimeCardService;
			var timeCardDelegate:TimeCardDelegate = new TimeCardDelegate(this);
			timeCardDelegate.getPreviousWeekLog(timeCardService.empCode);
		}
		
		override public function result(data:Object):void
		{
			this.timeCardService.listOfPreviousLog = data.result as ArrayCollection;
		}
		
		override public function fault(info:Object):void
		{
			Alert.show("Error Occurred","Error");
		}
	}
}