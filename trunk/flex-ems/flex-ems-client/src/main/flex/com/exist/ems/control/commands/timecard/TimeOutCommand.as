package com.exist.ems.control.commands.timecard
{
	import com.exist.ems.business.delegates.TimeCardDelegate;
	import com.exist.ems.control.commands.BaseEmsCommand;
	import com.exist.ems.control.events.BaseEvents;
	import com.exist.ems.model.UserData;
	import com.exist.ems.utils.ConstantEvents;
	import com.exist.ems.view.service.timecard.TimeCardService;
	
	import mx.controls.Alert;

	public class TimeOutCommand extends BaseEmsCommand
	{
		private var timeCardService:TimeCardService;
		
		public function TimeOutCommand()
		{
			
		}
		
		override protected function callDelegate():void
		{
			this.timeCardService = this.baseService as TimeCardService;
			var timeCardDelegate:TimeCardDelegate = new TimeCardDelegate(this);
			timeCardDelegate.timeCardOUT(UserData.getInstance().empCode);
		}
		
		override public function result(data:Object):void
		{
			Alert.show("Time Out Successful");
			new BaseEvents(ConstantEvents.CURRENT_WEEK_LOG, timeCardService).dispatch();
		}
		
		override public function fault(info:Object):void
		{
			Alert.show("Error occured","Error");
		}
		
	}
}