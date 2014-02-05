package classes.UIComponents 
{
	import classes.UIComponents.MiniMap.MiniMap;
	import classes.UIComponents.SideBarComponents.LocationHeader;
	import fl.transitions.Tween;
	import flash.display.Sprite;
	import flash.events.Event;
	import fl.transitions.easing.Regular;
	import flash.text.TextField;
	import classes.UIComponents.SideBarComponents.EnemyEncounterBlock;
	import classes.UIComponents.SideBarComponents.MiniMapBlock;
	import classes.UIComponents.SideBarComponents.GeneralInfoBlock;
	import classes.UIComponents.SideBarComponents.SideBarButtonBlock;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class LeftSideBar extends Sprite
	{
		private var _doTween:Boolean;
		
		private var _locationHeader:LocationHeader;
		private var _enemyEncounterBlock:EnemyEncounterBlock;
		private var _miniMapBlock:MiniMapBlock;
		private var _genInfoBlock:GeneralInfoBlock;
		private var _menuButtonBlock:SideBarButtonBlock;
		
		public function get roomText():TextField { return _locationHeader.roomText; }
		public function get planetText():TextField { return _locationHeader.planetText; }
		public function get systemText():TextField { return _locationHeader.systemText; }
		
		public function get miniMap():MiniMap { return _miniMapBlock.miniMap; }
		
		public function LeftSideBar(doTween:Boolean = false) 
		{
			_doTween = doTween;
			
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			if (_doTween) this.addEventListener(Event.FRAME_CONSTRUCTED, tween);
			
			this.BuildBackground();
			
			// The location/bust block
			_locationHeader = new LocationHeader();
			this.addChild(_locationHeader);
			_locationHeader.x = 0;
			_locationHeader.y = 0;
			
			// The enemy encounter stats block
			_enemyEncounterBlock = new EnemyEncounterBlock();
			this.addChild(_enemyEncounterBlock);
			_enemyEncounterBlock.y = _locationHeader.y + _locationHeader.height + 8;
			
			// Minimap container block
			_miniMapBlock = new MiniMapBlock();
			this.addChild(_miniMapBlock);
			_miniMapBlock.y = _locationHeader.y + _locationHeader.height + 8;
			this.ShowMiniMap();
			
			// Time/day display shit
			_genInfoBlock = new GeneralInfoBlock();
			this.addChild(_genInfoBlock);
			_genInfoBlock.y = _miniMapBlock.y + _miniMapBlock.height - 4;
			
			// Menu button block
			_menuButtonBlock = new SideBarButtonBlock();
			this.addChild(_menuButtonBlock);
			_menuButtonBlock.y = _genInfoBlock.y + _genInfoBlock.height - 13;
			_menuButtonBlock.x = 10;
			
		}
		
		private function tween(e:Event):void
		{
			this.removeEventListener(Event.FRAME_CONSTRUCTED, tween);
			var tw:Tween = new Tween(this, "x", Regular.easeOut, this.x, this.x + this.width, 25, false); // Might have to fudge this to get the appearance to look round, ie construct off stage.
		}
		
		private function BuildBackground():void
		{
			this.graphics.beginFill(UIStyleSettings.gForegroundColour, 1);
			this.graphics.drawRect(0, 0, 200, 740);
			this.graphics.endFill();
			
			this.name = "";
			this.x = 0;
			this.y = 0;
		}
		
		public function ShowStats():void
		{
			_miniMapBlock.visible = false;
			_enemyEncounterBlock.visible = true;
		}
		
		public function ShowMiniMap():void
		{
			_miniMapBlock.visible = true;
			_enemyEncounterBlock.visible = false;
		}
	}
}