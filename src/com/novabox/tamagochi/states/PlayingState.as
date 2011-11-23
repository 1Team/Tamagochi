package com.novabox.tamagochi.states 
{
	import com.novabox.tamagochi.Tamagochi;
	import com.novabox.tamagochi.TamagochiState;
	import com.novabox.tamagochi.game.ShiFuMiGame;
	/**
	 * ...
	 * @author alex
	 */
	public class PlayingState extends TamagochiState
	{
		protected var isPlaying:Boolean;
		
		public function PlayingState(_tamagochi:Tamagochi) 
		{
			super(_tamagochi, "Playing");
			isPlaying = false;
			
		}
		
		override public function UpdateFeelings() :void {
			if (!isPlaying)
			{
				var game:ShiFuMiGame = new ShiFuMiGame(GetTamagochi());
				isPlaying = true;
			}
			//GetTamagochi().DecreaseFeeling(Tamagochi.FEELING_BORING);
			if (GetTamagochi().IsBoringOK())
				isPlaying = false;
			
			var choixIncrease:Number = Math.round((Math.random())*4 + 1);
			switch (choixIncrease) {
				case 1:
					GetTamagochi().IncreaseFeeling(Tamagochi.FEELING_THIRST);
					break;
				case 2:
					GetTamagochi().IncreaseFeeling(Tamagochi.FEELING_TIREDNESS);
					break;
				case 3:
					GetTamagochi().IncreaseFeeling(Tamagochi.FEELING_ILLNESS);
					break;
			}
		}
		
	}

}