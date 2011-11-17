package com.novabox.tamagochi.states 
{
	import com.novabox.tamagochi.Tamagochi;
	import com.novabox.tamagochi.TamagochiState;
	
	public class SleepingState extends TamagochiState
	{
		
		public function SleepingState(_tamagochi:Tamagochi) 
		{
			super(_tamagochi, "Sleeping");
		}
		
		override public function UpdateFeelings() :void{
			GetTamagochi().DecreaseFeeling(Tamagochi.FEELING_TIREDNESS);
		}
		
	}

}