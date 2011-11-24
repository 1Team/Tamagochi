package com.novabox.tamagochi.states 
{
	import com.novabox.tamagochi.Tamagochi;
	import com.novabox.tamagochi.TamagochiState;
	/**
	 * ...
	 * @author Maxime
	 */
	public class DeadState extends TamagochiState
	{
		
		public function DeadState(_tamagochi:Tamagochi) 
		{
			super(_tamagochi, "Dead");
		}
		
		override public function UpdateFeelings() :void {
			
		}
		
	}

}