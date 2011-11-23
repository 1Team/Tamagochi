package com.novabox.automate 
{
	/**
	 * Automate Example
	 * Tamagochi
	 * 
	 * @author Ophir / Nova-box
	 * @version 1.0
	 */
	public class Automate
	{	
		protected var currentState:AutomateState;
		
		public function Automate() 
		{
			currentState = null;
		}
				
		public function SetCurrentState(_state:AutomateState) : void
		{
			if (currentState != null)
			{
				currentState.Exit();			
			}
			
			currentState = _state;
			currentState.Enter();
		}
		
		public function GetCurrentState() :AutomateState
		{
			return currentState;
		}
		
		
		public function Update() : void
		{
			if (currentState != null)
			{
				currentState.Update();
				var nextState:AutomateState = currentState.GetNextState();
				if (nextState != null)
				{
					SetCurrentState(nextState);
				}
			}
		}
	}

}