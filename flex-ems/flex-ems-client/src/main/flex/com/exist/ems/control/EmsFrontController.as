package com.exist.ems.control
{
	import com.adobe.cairngorm.control.FrontController;
	import com.exist.ems.control.commands.employee.SaveEmployeeCommand;
	import com.exist.ems.control.commands.login.LoginCommand;
	import com.exist.ems.control.commands.timecard.CountReportCommand;
	import com.exist.ems.control.commands.timecard.ListCurrentLogCommand;
	import com.exist.ems.control.commands.timecard.ListPreviousLogCommand;
	import com.exist.ems.control.commands.timecard.ReportLogCommand;
	import com.exist.ems.control.commands.timecard.TimeInCommand;
	import com.exist.ems.control.commands.timecard.TimeOutCommand;
	import com.exist.ems.control.events.employee.SaveEmployeeEvent;
	import com.exist.ems.utils.ConstantEvents; 

	public class EmsFrontController extends FrontController
	{
		public function EmsFrontController()
		{
			initialize();
		}
		
		private function initialize():void
		{
			addCommand(ConstantEvents.LOGIN_MAIN,LoginCommand);
			addCommand(ConstantEvents.CURRENT_WEEK_LOG,ListCurrentLogCommand);
			addCommand(ConstantEvents.LAST_WEEK_LOG, ListPreviousLogCommand);
			addCommand(ConstantEvents.TIME_IN,TimeInCommand);
			addCommand(ConstantEvents.TIME_OUT,TimeOutCommand);
			addCommand(SaveEmployeeEvent.SAVE_EMPLOYEE,SaveEmployeeCommand);
			addCommand(ConstantEvents.LIST_REPORT_LOG, ReportLogCommand);
			addCommand(ConstantEvents.COUNT_REPORT_LOG, CountReportCommand);
		}
	}
}