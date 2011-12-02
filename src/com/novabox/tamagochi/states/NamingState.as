package com.novabox.tamagochi.states 
{
	import com.novabox.tamagochi.Tamagochi;
	import com.novabox.tamagochi.TamagochiState;
	
	import flash.display.Sprite; 
    import flash.display.Stage; 
    import flash.text.*; 
    import flash.events.*; 
	
	public class NamingState extends TamagochiState
	{
		private var nouvNom:TextField;
		var sprite:Sprite;
		
		public function NamingState(_tamagochi:Tamagochi) 
		{
			super(_tamagochi, "Naming");
			
			sprite = _tamagochi.GetGameSprite();
			
			nouvNom = new TextField();
			
		}
		
		private function pushEnter(event:KeyboardEvent):void {
			if (event.keyCode == 13){
				GetTamagochi().setNameTamagochi(nouvNom.text);
				close();
			}
		}
		
		public function close() :void
		{
			sprite.removeChild(nouvNom);
		}
		
		override public function UpdateFeelings() :void {
			nouvNom.type = TextFieldType.INPUT;
			nouvNom.border = true;
			nouvNom.x = 120;
			nouvNom.y = 92;
			nouvNom.width = 150;
			nouvNom.height = 20;
			
			sprite.addChild(nouvNom);
			
			nouvNom.addEventListener(KeyboardEvent.KEY_DOWN, pushEnter );
		}
	}

}