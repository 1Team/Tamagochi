package com.novabox.tamagochi.states 
{
	import com.novabox.tamagochi.Tamagochi;
	import com.novabox.tamagochi.TamagochiState;
	/**
	 * ...
	 * @author Ophir
	 */
	public class WaitingState extends TamagochiState
	{
		
		public function WaitingState(_tamagochi:Tamagochi ) 
		{
			super(_tamagochi, "Waiting");
		}
		
		override public function UpdateFeelings() : void
		{
			GetTamagochi().IncreaseFeeling(Tamagochi.FEELING_HUNGER);
		}
	}

}