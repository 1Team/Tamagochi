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
			
<<<<<<< HEAD
			var choixIncrease:Number = Math.round((Math.random())*6 + 1);
=======
			GetTamagochi().DecreaseFeeling(Tamagochi.FEELING_BORING);
			
			var choixIncrease:Number = Math.round((Math.random())*5 + 1);
>>>>>>> 7a7b81eeb9c759b093432dbf277b2c68b70ef0f9
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
<<<<<<< HEAD
				case 4 :
					GetTamagochi().IncreaseFeeling(Tamagochi.FEELING_BORING);
					break;
				case 5:
=======
				case 4:
>>>>>>> 7a7b81eeb9c759b093432dbf277b2c68b70ef0f9
					GetTamagochi().IncreaseFeeling(Tamagochi.FEELING_HUNGER);
					break;
			}
		}
		
	}

}