package com.exist.ems.control.commands
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.exist.ems.control.events.BaseEvents;
	import com.exist.ems.view.service.BaseService;
	
	import mx.rpc.IResponder;

	public class BaseEmsCommand implements ICommand, IResponder
	{
		protected var baseService:BaseService;
		
		public function BaseEmsCommand()
		{
		}
		
		protected function callDelegate():void
		{
			throw new Error("Override: abstract method");
		}
		
		public function execute(event:CairngormEvent):void
		{
			this.baseService = BaseEvents(event).service;
			callDelegate();
		}
		
		public function result(data:Object):void
		{
			throw new Error("abstract class method");
		}
		
		public function fault(info:Object):void
		{
			throw new Error("abstract class method");
		}
		
	}
}