package com.novabox.tamagochi.states 
{
	import com.novabox.tamagochi.Tamagochi;
	import com.novabox.tamagochi.TamagochiState;
	/**
	 * ...
	 * @author Ikram
	 */
	public class HungryState extends TamagochiState
	{
		
		public function HungryState(_tamagochi:Tamagochi ) 
		{
			super(_tamagochi, "Hungry");
		}
		
		override public function UpdateFeelings() : void
		{
			GetTamagochi().DecreaseFeeling(Tamagochi.FEELING_HUNGER);
			GetTamagochi().DecreaseFeeling(Tamagochi.FEELING_ILLNESS);
		}
		
	}

}