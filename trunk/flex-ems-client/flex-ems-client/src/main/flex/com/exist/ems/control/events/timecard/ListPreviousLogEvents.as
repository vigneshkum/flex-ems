package com.exist.ems.control.events.timecard
{
	import com.exist.ems.control.events.BaseEvents;
	import com.exist.ems.view.service.timecard.TimeCardService;
	
	import flash.events.Event;

	public class ListPreviousLogEvents extends BaseEvents
	{
		public static const LISTOFLOGS:String = "listOfPreviousLogs";
		
		private var timeCardService:TimeCardService;
		
		public function ListPreviousLogEvents(service:TimeCardService)
		{
			super(LISTOFLOGS, service);
			this.timeCardService = service;
		}
		
		override public function clone():Event
		{
			return new ListPreviousLogEvents(this.timeCardService);
		}
		
	}
}