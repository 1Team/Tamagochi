package com.novabox.tamagochi.states 
{
	import com.novabox.tamagochi.Tamagochi;
	import com.novabox.tamagochi.TamagochiState;
	/**
	 * ...
	 * @author Brian Teyssier
	 */
	public class BoringState extends TamagochiState
	{
		
		public function BoringState(_tamagochi:Tamagochi) 
		{
			super(_tamagochi, "Boring");
		}
		
		override public function UpdateFeelings() :void {
			
		var choixIncrease:Number = Math.round((Math.random())*5 + 1);
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
			case 4:
				GetTamagochi().IncreaseFeeling(Tamagochi.FEELING_ILLNESS);
				break;
			}
		}
		
	}

}