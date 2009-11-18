package com.exist.ems.control
{
	import com.adobe.cairngorm.control.FrontController;
	import com.exist.ems.control.commands.employee.SaveEmployeeCommand;
	import com.exist.ems.control.commands.login.LoginCommand;
	import com.exist.ems.control.commands.timecard.ListCurrentLogCommand;
	import com.exist.ems.control.commands.timecard.ListPreviousLogCommand;
	import com.exist.ems.control.commands.timecard.TimeInCommand;
	import com.exist.ems.control.commands.timecard.TimeOutCommand;
	import com.exist.ems.control.events.employee.SaveEmployeeEvent;
	import com.exist.ems.control.events.login.LoginEvent;
	import com.exist.ems.control.events.timecard.ListCurrentLogEvents;
	import com.exist.ems.control.events.timecard.ListPreviousLogEvents;
	import com.exist.ems.control.events.timecard.TimeInEvents;
	import com.exist.ems.control.events.timecard.TimeOutEvents;

	public class EmsFrontController extends FrontController
	{
		public function EmsFrontController()
		{
			initialize();
		}
		
		private function initialize():void
		{
			addCommand(LoginEvent.LOGIN,LoginCommand);
			addCommand(ListCurrentLogEvents.LISTOFLOGS,ListCurrentLogCommand);
			addCommand(ListPreviousLogEvents.LISTOFLOGS, ListPreviousLogCommand);
			addCommand(TimeInEvents.TIME_IN,TimeInCommand);
			addCommand(TimeOutEvents.TIME_OUT,TimeOutCommand);
			addCommand(SaveEmployeeEvent.SAVE_EMPLOYEE,SaveEmployeeCommand);
			
		}
	}
}