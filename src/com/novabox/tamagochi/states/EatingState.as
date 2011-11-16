package com.novabox.tamagochi.states 
{
	import com.novabox.tamagochi.Tamagochi;
	import com.novabox.tamagochi.TamagochiState;
	/**
	 * ...
	 * @author Maxime
	 */
	public class EatingState extends TamagochiState
	{
		
		public function EatingState(_tamagochi:Tamagochi) 
		{
			super(_tamagochi, "Eating");
		}
		
		override public function UpdateFeelings() :void{
			GetTamagochi().DecreaseFeeling(Tamagochi.FEELING_HUNGER);
			GetTamagochi().IncreaseFeeling(Tamagochi.FEELING_THIRST);
		}
	}

}