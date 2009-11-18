package com.exist.ems.control.events.timecard
{
	import com.exist.ems.control.events.BaseEvents;
	import com.exist.ems.view.service.timecard.TimeCardService;
	
	import flash.events.Event;

	public class TimeInEvents extends BaseEvents
	{
		public static const TIME_IN:String = "timeIn";
		
		private var timeCardService:TimeCardService;
		
		public function TimeInEvents(service:TimeCardService)
		{
			super(TIME_IN, service);
			this.timeCardService = service;
		}
		
		override public function clone():Event
		{
			return new TimeInEvents(this.timeCardService);
		}
	}
}