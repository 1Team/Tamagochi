package com.novabox.tamagochi.states 
{
	import com.novabox.tamagochi.TamagochiState;
	/**
	 * ...
	 * @author Maxime
	 */
	public class TiredState extends TamagochiState
	{
		
		public function TiredState(_tamagochi:Tamagochi) 
		{
			super(_tamagochi, "Tired");
		}
		
		override public function UpdateFeelings() :void{
			GetTamagochi().IncreaseFeeling(Tamagochi.FEELING_ILLNESS);
		}
		
	}

}