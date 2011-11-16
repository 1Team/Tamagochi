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
			super(_tamagoshi, "Eating");
		}
		
		override public function UpdateFeelings() :void{
<<<<<<< HEAD
			GetTamagochi().DecreaseFeeling(Tamagochi.FEELING_HUNGER);
			GetTamagochi().IncreaseFeeling(Tamagochi.FEELING_THIRST);
=======
			GetTamagochi().IncreaseFeeling(Tamagochi.FEELING_HUNGER);
>>>>>>> eeed49552180f83e1321ab9aba106911c761d999
		}
	}

}