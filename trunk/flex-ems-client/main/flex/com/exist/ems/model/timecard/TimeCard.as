package com.exist.ems.model.timecard
{
	[RemoteClass(alias="com.exist.ems.model.TimeCard")]
	[Bindable]
	public class TimeCard
	{
		public var id:String;
		public var empCode:String;
		public var timesheetDate:Date;
		public var timeIn:Date;
		public var timeOut:Date;
		public var remarks:String;
			
		public function TimeCard()
		{
			
		}

	}
}