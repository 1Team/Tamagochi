package com.novabox.tamagochi.states 
{
	import com.novabox.tamagochi.Tamagochi;
	import com.novabox.tamagochi.TamagochiState;
	/**
	 * ...
	 * @author Maxime
	 */
	public class ThirstyState extends TamagochiState
	{
		
		public function ThirstyState(_tamagochi:Tamagochi) 
		{
			super(_tamagochi, "Thirsty");
		}
		
		override public function UpdateFeelings() :void {
			GetTamagochi().DecreaseFeeling(Tamagochi.FEELING_ILLNESS);
		}
	}

}