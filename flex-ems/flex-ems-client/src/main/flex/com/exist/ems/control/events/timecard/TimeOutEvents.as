package com.exist.ems.control.events.timecard
{
	import com.exist.ems.control.events.BaseEvents;
	import com.exist.ems.view.service.timecard.TimeCardService;
	
	import flash.events.Event;

	public class TimeOutEvents extends BaseEvents
	{
		public static const TIME_OUT:String = "timeOut";
		
		private var timeCardService:TimeCardService;
		
		public function TimeOutEvents(service:TimeCardService)
		{
			super(TIME_OUT, service);
			this.timeCardService = service;
		}
		
		override public function clone():Event
		{
			return new TimeOutEvents(this.timeCardService);
		}
	}
}