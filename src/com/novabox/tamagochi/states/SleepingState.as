package com.novabox.tamagochi.states 
{
	import com.novabox.tamagochi.Tamagochi;
	import com.novabox.tamagochi.TamagochiState;
	
	public class Sleeping extends TamagochiState
	{
		
		public function SleepingState(_tomagochi:Tamagochi) 
		{
			super(_tamagochi, "Sleeping");
		}
		
		override public function UpdateFeelings() :void{
			GetTamagochi().DecreaseFeeling(Tamagochi.FEELING_TIREDNESS);
		}
		
	}

}