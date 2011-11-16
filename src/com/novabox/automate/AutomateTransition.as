package com.novabox.automate 
{
	/**
	 * Automate Example
	 * Tamagochi
	 * 
	 * @author Ophir / Nova-box
	 * @version 1.0
	 */
	public class AutomateTransition	
	{
		protected var targetState:AutomateState;
		protected var callBack:Function;
		
		
		public function AutomateTransition(_targetState:AutomateState, _callBack:Function) 
		{
			targetState = _targetState;
			callBack = _callBack;
		}
		
		public function IsValid() : Boolean
		{
			return callBack();
		}
		
		public function GetTargetState() : AutomateState
		{
			return targetState;
		}
	}

}