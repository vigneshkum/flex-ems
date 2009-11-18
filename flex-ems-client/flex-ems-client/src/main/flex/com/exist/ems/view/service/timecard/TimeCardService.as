package com.exist.ems.view.service.timecard
{
	import com.exist.ems.control.events.timecard.ListCurrentLogEvents;
	import com.exist.ems.control.events.timecard.ListPreviousLogEvents;
	import com.exist.ems.view.service.BaseService;
	
	import mx.collections.ArrayCollection;
	
	public class TimeCardService extends BaseService
	{
		[Bindable]
		public var listOfCurrentLog:ArrayCollection;
		[Bindable]
		public var listOfPreviousLog:ArrayCollection;
		[Bindable]
		public var empCode:String;
		
		public function TimeCardService()
		{
		}

		public function getListOfCurrentLog(empcode:String):void
		{
			this.empCode = empcode;
			new ListCurrentLogEvents(this).dispatch();
		}
		
		public function getListOfPreviousLog(empcode:String):void
		{
			this.empCode = empcode;
			new ListPreviousLogEvents(this).dispatch();
		}
		
		public function setCurrentWeeLog(data:Object):void
		{
			this.listOfCurrentLog = data.result as ArrayCollection;
		}
		
	}
}