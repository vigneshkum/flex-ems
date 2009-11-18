package com.exist.ems.control.events
{
	import flash.events.Event;

	public class SelectTabEvent extends Event
	{
		public var selectedTab:int;
		
		public function SelectTabEvent(selectedTab:int, type:String)
		{
			super(type, bubbles, cancelable);
			this.selectedTab = selectedTab;
		}
		
		override public function clone():Event{
			return new SelectTabEvent(selectedTab, type);
		}
	}
}