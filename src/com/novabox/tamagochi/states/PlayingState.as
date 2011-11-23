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
		
		protected var game:ShiFuMiGame;
		
		public function PlayingState(_tamagochi:Tamagochi) 
		{
			super(_tamagochi, "Playing");
			game = new ShiFuMiGame(GetTamagochi());
			
		}
		
		override public function UpdateFeelings() :void {
			if (!game.IsPlaying())
			{
				trace("in");
				game.launch();
			}
			//GetTamagochi().DecreaseFeeling(Tamagochi.FEELING_BORING);
			
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