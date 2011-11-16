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
		
		public function EatingState(_tamagoshi:Tamagochi) 
		{
			super(_tamagochi, "Eating");
		}
		
		override public function UpdateFeeling() :void{
			GetTamagochi().IncreaseFeeling(Tamagochi.FEELING_HUNGER);
		}
	}

}