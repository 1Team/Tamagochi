package com.novabox.tamagochi.states 
{
	import com.novabox.tamagochi.Tamagochi;
	import com.novabox.tamagochi.TamagochiState;
	
	public class RecoveringState extends TamagochiState
	{
		
		public function RecoveringState(_tomagochi:Tamagochi) 
		{
			super(_tomagochi, "Recovering");
		}
		
		override public function UpdateFeelings() :void{
			GetTamagochi().DecreaseFeeling(Tamagochi.FEELING_ILLNESS);
			GetTamagochi().IncreaseFeeling(Tamagochi.FEELING_TIREDNESS);
			
			var choixIncrease:Number = Math.round((Math.random())*4 + 1);
			switch (choixIncrease) {
				case 1: 
					GetTamagochi().IncreaseFeeling(Tamagochi.FEELING_HUNGER);
					break;
				case 2:
					GetTamagochi().IncreaseFeeling(Tamagochi.FEELING_THIRST);
					break;
				case 3:
					GetTamagochi().IncreaseFeeling(Tamagochi.FEELING_TIREDNESS);
					break;
			}
		}
	}

}