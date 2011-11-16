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
			GetTamagochi().IncreaseFeeling(Tamagochi.FEELING_ILLNESS);
		}
	}

}