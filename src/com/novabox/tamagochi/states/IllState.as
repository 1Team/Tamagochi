package com.novabox.tamagochi.states 
{
	import com.novabox.tamagochi.Tamagochi;
	import com.novabox.tamagochi.TamagochiState;
	/**
	 * ...
	 * @author Maxime
	 */
	public class IllState extends TamagochiState
	{
		
		public function IllState(_tamagochi:Tamagochi) 
		{
			super(_tamagochi, "Ill");
		}
		
		override public function UpdateFeelings() :void {
			GetTamagochi().IncreaseFeeling(Tamagochi.FEELING_ILLNESS);
		}
	}

}