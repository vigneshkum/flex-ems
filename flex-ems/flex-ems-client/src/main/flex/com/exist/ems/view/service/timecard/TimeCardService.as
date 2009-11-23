package com.exist.ems.view.service.timecard
{
	import com.exist.ems.control.events.BaseEvents;
	import com.exist.ems.model.ReportVO;
	import com.exist.ems.utils.ConstantEvents;
	import com.exist.ems.view.service.BaseService;
	
	import mx.collections.ArrayCollection;
	
	public class TimeCardService extends BaseService
	{
		[Bindable]
		public var listOfCurrentLog:ArrayCollection;
		[Bindable]
		public var listOfPreviousLog:ArrayCollection;
		[Bindable]
		public var listOfReportsLog:ArrayCollection;
		[Bindable]
		public var empCode:String;
		[Bindable]
		public var rptVO:ReportVO;
		[Bindable] 
		public var totalReport:int;
		
		public function TimeCardService()
		{
		}

		public function getListOfCurrentLog(empcode:String):void
		{
			this.empCode = empcode;
			new BaseEvents(ConstantEvents.CURRENT_WEEK_LOG, this).dispatch();
		}
		
		public function getListOfPreviousLog(empcode:String):void
		{
			this.empCode = empcode;
			new BaseEvents(ConstantEvents.LAST_WEEK_LOG, this).dispatch();
		}
		
		public function setCurrentWeeLog(data:Object):void
		{
			this.listOfCurrentLog = data.result as ArrayCollection;
		}
		
		public function listLogReport(_rptVO:ReportVO):void
		{
			this.rptVO = _rptVO;
			new BaseEvents(ConstantEvents.LIST_REPORT_LOG, this).dispatch();
		}
		
		public function countLogReport(_rptVO:ReportVO):void
		{
			this.rptVO = _rptVO;
			new BaseEvents(ConstantEvents.COUNT_REPORT_LOG, this).dispatch();
		}
		
	}
}