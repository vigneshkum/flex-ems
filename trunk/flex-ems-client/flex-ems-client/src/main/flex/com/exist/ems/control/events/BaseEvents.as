package com.exist.ems.control.events
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.exist.ems.view.service.BaseService;
	
	public class BaseEvents extends CairngormEvent
	{
		protected var baseService:BaseService;
		
		public function BaseEvents(eventType:String, service:BaseService)
		{
			super(eventType,true,true);
			this.baseService = service;
		}

		public function get service():BaseService
		{
			return this.baseService;
		} 

	}
}