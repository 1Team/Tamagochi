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
			if ( GetTamagochi().IsHungerMax() )
			{
				GetTamagochi().IncreaseFeeling(Tamagochi.FEELING_ILLNESS);
			}
			
			var choixIncrease:Number = Math.round((Math.random())*7 + 1);
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
				case 5:
					GetTamagochi().IncreaseFeeling(Tamagochi.FEELING_BORING);
					break;
				default:
					GetTamagochi().IncreaseFeeling(Tamagochi.FEELING_HUNGER);
					break;
			}
		}
		
	}

}