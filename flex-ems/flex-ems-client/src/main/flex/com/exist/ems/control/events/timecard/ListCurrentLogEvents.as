package com.exist.ems.control.events.timecard
{
	import com.exist.ems.control.events.BaseEvents;
	import com.exist.ems.view.service.timecard.TimeCardService;
	
	import flash.events.Event;

	public class ListCurrentLogEvents extends BaseEvents
	{
		public static const LISTOFLOGS:String = "listOfCurrentLogs";
		
		private var timeService:TimeCardService;
		
		public function ListCurrentLogEvents(service:TimeCardService)
		{
			super(LISTOFLOGS, service);
			this.timeService = service;
		}
		
		override public function clone():Event
		{
			return new ListCurrentLogEvents(this.timeService);
		}
		
	}
}