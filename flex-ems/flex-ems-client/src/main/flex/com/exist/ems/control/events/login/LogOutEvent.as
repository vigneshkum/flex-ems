package com.exist.ems.control.events.login
{
	import com.exist.ems.utils.ConstantEvents;
	
	import flash.events.Event;

	public class LogOutEvent extends Event
	{
		public var logout:int;
		
		public function LogOutEvent()
		{
			super(ConstantEvents.LOGOUT, true, cancelable);
			this.logout = 0;
		}
		
		override public function clone():Event
		{
			return new LogOutEvent();
		}
		
	}
}