package com.exist.ems.control.events.login
{
	import flash.events.Event;

	public class LogOutEvent extends Event
	{
		public var logout:int;
		
		public function LogOutEvent(type:String, logout:int)
		{
			super(type, bubbles, cancelable);
			this.logout = logout;
		}
		
		override public function clone():Event
		{
			return new LogOutEvent(type,logout);
		}
		
	}
}