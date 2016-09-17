﻿package classes
{

	import classes.GameData.Perks;
	import classes.TiTS_Settings;
	import classes.UIComponents.MainButton;
	import fl.transitions.Tween;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.utils.describeType;

	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.filters.GlowFilter;
	import flash.geom.ColorTransform;
	import flash.geom.Rectangle;
	import flash.net.FileReference;
	import flash.net.SharedObject;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.text.Font;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	import flash.display.MovieClip;
	import flash.text.Font;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	import flash.text.AntiAliasType;
	import flash.text.TextFormat;
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	import flash.display.StageQuality;
	import classes.RoomClass;
	
	// Game content managers
	import classes.GameData.TooltipManager;
	import classes.GameData.CodexManager;
	import classes.GameData.GameOptions;
	import classes.GameData.Pregnancy.Handlers.*;
	
	import fl.transitions.easing.None;

	import classes.InputManager;
	import classes.Characters.*;

	// Items
	import classes.Items.Armor.*;
	import classes.Items.Protection.*
	import classes.Items.Guns.*
	import classes.Items.Melee.*
	import classes.Items.Apparel.*
	import classes.Items.Miscellaneous.*
	import classes.Items.Accessories.*
	import classes.Items.Transformatives.*;

	import classes.Parser.ParseEngine;

	import classes.DataManager.DataManager;
	import classes.GameData.StatTracking;
	import classes.GUI;
	import classes.Mapper;
	import classes.StringUtil;
	import classes.Engine.Map.InPublicSpace;
	
	import classes.Engine.checkDate;
	import classes.Engine.showImage;
	import classes.Engine.Utility.*;
	import classes.Util.IsOneOf;
	import classes.Engine.Combat.*;
	import classes.Engine.Interfaces.*;
	import classes.Engine.Map.*;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	import classes.UIComponents.ContentModuleComponents.RGMK;
	import classes.UIComponents.ContentModules.RotateMinigameModule;
	
	import flash.events.UncaughtErrorEvent;
	import flash.events.UncaughtErrorEvents;
	import flash.display.LoaderInfo;
	import flash.system.Security;

	//Build the bottom drawer
	public class TiTS extends MovieClip
	{
		// Smoosh all the included stuff into the TiTS class
		// this is a HORRIBLE way of architecting the system, but it's better then not
		// using classes at all
		
		//Core Game Stuff
		include "../includes/appearance.as";
		include "../includes/BackerCredits.as";
		include "../includes/ControlBindings.as";
		include "../includes/CodexEntries.as";
		include "../includes/CodexFiction.as";
		include "../includes/creation.as";
		include "../includes/creation_custom_PCs.as";
		include "../includes/debug.as";
		include "../includes/dreams.as";
		include "../includes/dynamicGrowth.as";
		include "../includes/engine.as";
		include "../includes/game.as";
		include "../includes/gameStats.as";
		include "../includes/gooExtras.as";
		include "../includes/lightsOut.as";
		include "../includes/items.as";
		include "../includes/items.tooltips.as";
		include "../includes/MailEntries.as";
		include "../includes/masturbation.as";
		include "../includes/masturbation.eggTrainer.as";
		include "../includes/masturbation.magicMilker.as";
		include "../includes/NPCTemplates.as";
		include "../includes/rooms.as";
		include "../includes/roomFunctions.as";
		include "../includes/StubbedFunctions.as";

		//Holiday shit
		include "../includes/holidayEvents/halloweenCostumes.as";
		include "../includes/holidayEvents/freedomBeef.as";
		include "../includes/event.puppyslutmas.as";

		//Followers
		include "../includes/follower.anno.as";
		include "../includes/follower.celise.as";
		include "../includes/follower.celiseGiga.as";
		include "../includes/follower.siegwulfe.as";
		include "../includes/follower.yammi.as";
		
		//Sidequest shit
		include "../includes/events/seraSexParty.as";

		//Misc content
		include "../includes/masturbation/bubbleBuddy.as";
		include "../includes/masturbation/sukMastr.as";
		include "../includes/rivalEncounters.as";
		include "../includes/saendra.as";
		include "../includes/travelEvents.as";
		include "../includes/travelEvents.fallOfThePhoenix.as";
		include "../includes/travelEvents.kiroRescue.as";
		include "../includes/travelEvents.kiro.as";
		
		// Misc Events
		include "../includes/events/atha_lets_fapper.as";
		include "../includes/events/steph_on_demand.as";
		include "../includes/events/bimboPennyAndBadgerQuest/badgerGifts.as";
		include "../includes/events/tentacle_psychic_hatchling.as";
		include "../includes/events/kiroCrewQuest/buttslutinator.as";
		include "../includes/events/kiroCrewQuest/omnisuitExtras.as";
		include "../includes/events/kiroCrewQuest/orgasmender.as";

		//Tavros Station
		include "../includes/tavros/aina.as";
		include "../includes/tavros/aliss.as";
		include "../includes/tavros/alex.as";
		include "../includes/tavros/beths.as";
		include "../includes/tavros/fyn.as";
		include "../includes/tavros/ilaria.as";
		include "../includes/tavros/inessa.as";
		include "../includes/tavros/jade.as";
		include "../includes/tavros/oviliumBonus.as";
		include "../includes/tavros/ramis.as";
		include "../includes/tavros/reaha.as";
		include "../includes/tavros/reaha.expansion.as";
		include "../includes/tavros/rooms.as";
		include "../includes/tavros/roomFunctions.as";
		include "../includes/tavros/saendraXPack1.as";
		include "../includes/tavros/sellesy.as";
		include "../includes/tavros/semith.as";
		include "../includes/tavros/sera.as";
		include "../includes/tavros/seraXPack1.as";
		include "../includes/tavros/shearBeauty.as";
		include "../includes/tavros/shelly.as";
		include "../includes/tavros/tamaniCorpShop.as";
		include "../includes/tavros/terensha.as";
		include "../includes/tavros/vahn.as";
		
		//First planet
		include "../includes/mhenga/burt.as";
		include "../includes/mhenga/crazyCarl.as";
		include "../includes/mhenga/cuntSnakes.as";
		include "../includes/mhenga/dryad.as";
		include "../includes/mhenga/flahne.as";
		include "../includes/mhenga/frogGirls.as";
		include "../includes/mhenga/julianSHaswell.as";
		include "../includes/mhenga/kelly.as";
		include "../includes/mhenga/mimbranes.as";
		include "../includes/mhenga/naleen.as";
		include "../includes/mhenga/naleenMale.as";
		include "../includes/mhenga/penny.as";
		include "../includes/mhenga/penny_bimbo.as";
		include "../includes/mhenga/rooms.as";
		include "../includes/mhenga/roomFunctions.as";
		include "../includes/mhenga/scrapyard.as";
		include "../includes/mhenga/syri.as";
		include "../includes/mhenga/tanis.as";
		include "../includes/mhenga/tharePlantation.as";
		include "../includes/mhenga/vanae.as";
		include "../includes/mhenga/venusPitchers.as";
		include "../includes/mhenga/vko.as";
		include "../includes/mhenga/zilMale.as";
		include "../includes/mhenga/zilFemale.as";
		
		//Second planet
		include "../includes/tarkus/anno.as";
		include "../includes/tarkus/aurora.as";
		include "../includes/tarkus/bess.as";
		include "../includes/tarkus/cockBox.as";
		include "../includes/tarkus/colenso.as";
		include "../includes/tarkus/drBadger.as";
		include "../includes/tarkus/drLash.as";
		include "../includes/tarkus/dumbfuckBonus.as";
		include "../includes/tarkus/edan.as";
		include "../includes/tarkus/goblinPool.as";
		include "../includes/tarkus/grayGoo.as";
		include "../includes/tarkus/grayGooArmor.as";
		include "../includes/tarkus/lane.as";
		include "../includes/tarkus/lapinara.as";
		include "../includes/tarkus/raskvelFemaleFight.as";
		include "../includes/tarkus/raskvelMaleFight.as";
		include "../includes/tarkus/rooms.as";
		include "../includes/tarkus/roomFunctions.as";
		include "../includes/tarkus/sexbots.as";
		include "../includes/tarkus/shekka.as";
		include "../includes/tarkus/stellarTether.as";
		include "../includes/tarkus/sydianMale.as";
		include "../includes/tarkus/taxi.as";
		include "../includes/tarkus/theMess.as";
		include "../includes/tarkus/sydianFemale.as";

		//Third planet
		include "../includes/newTexas/newTexas.as";
		include "../includes/newTexas/bigT.as";
		include "../includes/newTexas/brynn.as";
		include "../includes/newTexas/ellie.as";
		include "../includes/newTexas/haley.as";
		include "../includes/newTexas/gianna.as";
		include "../includes/newTexas/gobbles.as";
		include "../includes/newTexas/millie.as";
		include "../includes/newTexas/rooms.as";
		include "../includes/newTexas/roomFunctions.as";
		include "../includes/newTexas/stocks.as";
		include "../includes/newTexas/tenTonGym.as";
		include "../includes/newTexas/treatment.as";
		include "../includes/newTexas/varmint_wrangling.as";
		include "../includes/newTexas/yammi.as";
		include "../includes/newTexas/yancy.as";
		include "../includes/newTexas/zephyr.as";
		
		//Fourth planet
		include "../includes/myrellion/anzhelaRedMyrMedic.as";
		include "../includes/myrellion/asennia.as";
		include "../includes/myrellion/bathHouse.as";
		include "../includes/myrellion/cockvines.as";
		include "../includes/myrellion/cockvineseedling.as";
		include "../includes/myrellion/crystalGoo.as";
		include "../includes/myrellion/CrystalGooVersionToo.as"
		include "../includes/myrellion/dally.as";
		include "../includes/myrellion/embassy.as";
		include "../includes/myrellion/embry.as";
		include "../includes/myrellion/emmy.as";
		include "../includes/myrellion/fazian.as";
		include "../includes/myrellion/fungus.as";
		include "../includes/myrellion/genesmods.as";
		include "../includes/myrellion/irellia.as";
		include "../includes/myrellion/irelliaQuest.as";
		include "../includes/myrellion/kaede.as";
		include "../includes/myrellion/karaAndShade.as";
		include "../includes/myrellion/kressiaSurvivalShop.as";
		include "../includes/myrellion/landmines.as";
		include "../includes/myrellion/lieve.as";
		include "../includes/myrellion/liliana.as";
		include "../includes/myrellion/littleGreenMan.as";
		include "../includes/myrellion/lyralla.as";
		include "../includes/myrellion/manor.as";
		include "../includes/myrellion/merchantQueen.as";
		include "../includes/myrellion/myrDeserterIndividuals.as";
		include "../includes/myrellion/nehzara.as";
		include "../includes/myrellion/nyrea.as";
		include "../includes/myrellion/orryx.as";
		include "../includes/myrellion/queenofthedeep.as";
		include "../includes/myrellion/renvra.as";
		include "../includes/myrellion/rooms.as";
		include "../includes/myrellion/roomFunctions.as";
		include "../includes/myrellion/steph.as";
		include "../includes/myrellion/tavern.as";
		include "../includes/myrellion/taivrasPalace.as";
		include "../includes/myrellion/thollum.as";
		include "../includes/myrellion/tradingPost.as";
		include "../includes/myrellion/venomAddiction.as";
		include "../includes/myrellion/vi.as";
		include "../includes/myrellion/wetraxxel.as";
		include "../includes/myrellion/xanthe.as";
		include "../includes/myrellion/xenogenbiotech.as";
		
		// Karaquest 2- Karaharder.
		include "../includes/events/karaquest2/content.as";
		include "../includes/events/karaquest2/rooms.as";
		include "../includes/events/karaquest2/roomFunctions.as";
		
		// Kashima
		include "../includes/events/kashimaIncident/kashimaIncident.as";
		include "../includes/events/kashimaIncident/rooms.as";
		include "../includes/events/kashimaIncident/roomfunctions.as";
		
		// Uveto
		include "../includes/uveto/freezer.as";
		include "../includes/uveto/jerome.as";
		include "../includes/uveto/kaede.as";
		include "../includes/uveto/kirila.as";
		include "../includes/uveto/korgonneFemaleHostile.as";
		include "../includes/uveto/natalie.as";
		include "../includes/uveto/nayna.as";
		include "../includes/uveto/nerrasa.as";
		include "../includes/uveto/rhenworld.as";
		include "../includes/uveto/rooms.as";
		include "../includes/uveto/roomFunctions.as";
		include "../includes/uveto/shade.as";
		include "../includes/uveto/tlako_and_xotchi.as";
		include "../includes/events/icequeen/icequeen.as"; // Alt. path to unlocking uveto
		
		include "../includes/chargendata.as";
		
		public var chars:Object;

		// This needs to ideally be moved somewhere else, I'm just stopping the GUI code from being used to store game-data models
		public var days:int;
		public var hours:int;
		public var minutes:int;
		
		// Get a 'packed' version of the current in-game time. Useful for date/time passage comparisons stored in flags.
		public function GetGameTimestamp():uint
		{
			var value:uint = 0;
			value += minutes;
			value += hours * 60;
			value += days * (24 * 60);
			return value;
		}

		// Queued event system
		public var eventBuffer:String;
		public var eventQueue:Array;

		// Version string/value
		public var version:String;

		// Room data
		public var rooms:Object;

		public var temp:int;
		public var items:Object;
		
		//Toggles
		public var gameOptions:GameOptions;
		
		public function get silly():Boolean { return gameOptions.sillyMode; }
		public function get easy():Boolean { return gameOptions.easyMode; }
		public function get debug():Boolean { return gameOptions.debugMode; }
		
		public function set silly(v:Boolean):void { gameOptions.sillyMode = v; }
		public function set easy(v:Boolean):void { gameOptions.easyMode = v; }
		public function set debug(v:Boolean):void { gameOptions.debugMode = v; }
		
		public var inputManager:InputManager;

		//Lazy man state checking
		public var currentLocation:String;
		public var shipLocation:String;
		public var inSceneBlockSaving:Boolean;
		public var gameOverEvent:Boolean;

		public var parser:ParseEngine;

		public var dataManager:DataManager;
		public var userInterface:GUI;

		public var shopkeep:Creature;
		public var itemScreen:*;
		public var lootScreen:*;
		
		public var useItemFunction:Function;
		public var itemUser:Creature;
		public var itemTarget:Creature;

		public var flags:Dictionary;

		// LE MAP
		public var mapper:Mapper;

		// Hacky fix for some UI updating problems under Chrome
		public var whatTheFuck:Sprite;
		public var whatTheFuckToggleState:Boolean;
		
		// Game data
		private var _perkDB:Perks;
		public function get perkDB():Perks { return _perkDB; }

		public function TiTS()
		{
			CONFIG::FLASH
			{
				Security.allowDomain("*");
				Security.allowInsecureDomain("*");
			}
			
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void
		{	
			loaderInfo.uncaughtErrorEvents.addEventListener(UncaughtErrorEvent.UNCAUGHT_ERROR, uncaughtErrorHandler);
			
			stage.quality = StageQuality.BEST;
			
			kGAMECLASS = this;
			dataManager = new DataManager();
			gameOptions = new GameOptions();
			
			hours = 0;
			minutes = 0;
			days = 0;

			trace("TiTS Constructor")

			version = "0.6.81";

			//temporary nonsense variables.
			temp = 0;

			import classes.Creature;
			import classes.ItemSlotClass;
			import classes.ShipClass;

			chars = new Object();
			
			//What inventory screen is up?
			shopkeep = undefined;
			itemScreen = undefined;
			lootScreen = undefined;
			
			// lootList = new Array();
			useItemFunction = undefined;
			itemUser = undefined;
			itemTarget = undefined;

			this.inSceneBlockSaving = false;
			gameOverEvent = false;
			
			eventQueue = new Array();
			eventBuffer = "";
			
			//Toggles
			silly = false;
			easy = false;
			debug = false;

			//Lazy man state checking
			currentLocation = "SHIP HANGAR";
			shipLocation = "SHIP HANGAR";

			parser = new ParseEngine(this, TiTS_Settings);

			flags = new Dictionary();

			initializeRooms();
			initTavrosRooms();
			initMhengaRooms();
			initTarkusRooms();
			initNewTexasRooms();
			initializeMyrellionRooms();
			kquest2InitRooms();
			initUvetoRooms();
			kiInitRooms();
			
			mapper = new Mapper(this.rooms)

			this.chars["PC"] = new PlayerCharacter();
			_perkDB = new Perks();
			
			inputManager = new InputManager(stage, false);
			setupInputControls();
			
			initStephEps();
			
			// set up the user interface: ------------------------------------------------------------
			userInterface = new GUI(this, stage);
			clearMenu();

			addEventListener(Event.FRAME_CONSTRUCTED, finishInit);
		}
		
		private function uncaughtErrorHandler(e:UncaughtErrorEvent):void
		{
			if (e.error is Error)
			{
				var ee:Error = e.error as Error;
				
				output("\n\n<b>Something bad happened!</b>\n\n<b>Please report this message, and include any prior scene text or a description of what you did before seeing this message:</b>\n\n");
				output("Version: " + version + "\n\n");
				output(ee.getStackTrace(), false, false);
				clearMenu();
				addButton(14, "Next", mainGameMenu);
			}
		}
		
		private function finishInit(e:Event):void
		{
			this.removeEventListener(Event.FRAME_CONSTRUCTED, finishInit);
			this.configureCodex();
			this.configureMails();
			this.userInterface.showMainMenu();
			buildWTF();
			
			//addGhostButton(0, "HAHAHA", YouThinkThisIsAGame, undefined, "HAHA!", "DO YOU THINK THIS IS A GAME???");
		}
		
		private function buildWTF():void
		{
			whatTheFuck = new Sprite();
			whatTheFuck.name = "wtf";
			whatTheFuck.graphics.beginFill(0x333E52, 1);
			whatTheFuck.graphics.drawRect(0, 0, 2, 2);
			whatTheFuck.graphics.endFill();
			
			stage.addChild(whatTheFuck);
			whatTheFuck.x = 1199;
			whatTheFuck.y = 799;
		}
		
		public function toggleWTF():void
		{
			whatTheFuckToggleState != whatTheFuckToggleState;
			
			var start:int;
			var end:int;
			
			if (whatTheFuckToggleState == false)
			{
				start = 1199;
				end = 0;
			}
			else
			{
				start = 0;
				end = 1199;
			}
			
			var tw:Tween = new Tween(whatTheFuck, "x", None.easeNone, start, end, 12, false); 
		}
		
		// Proxy clearMenu calls so we can hook them for controlling save-enabled state
		// Or alternatively, shim this shit so we don't have to differentiate between
		// TiTs engine calls and UI calls. This shit is getting ridiculous.		
		public function clearMenu(saveDisable:Boolean = true):void 
		{
			this.inSceneBlockSaving = saveDisable;
			this.userInterface.clearMenu();
		}
		
		public function clearGhostMenu():void
		{
			this.userInterface.clearGhostMenu();
		}
		
		public function buttonClick(evt:MouseEvent):void 
		{
			var btnName:String = (evt.currentTarget as MainButton).buttonName;
			var tFunc:Function = (evt.currentTarget as MainButton).func;
			var tArg:* = (evt.currentTarget as MainButton).arg;
			
			toggleWTF();
			
			if (evt.currentTarget is MainButton)
			{
				trace("Button " + (evt.currentTarget as MainButton).buttonName + " clicked");
				
				var btn:MainButton = evt.currentTarget as MainButton;
				if (btn.func == null) return;
			}
			else
			{
				trace("Button " + evt.currentTarget.caption.text + " clicked.");
			}
			
			if (evt.currentTarget.arg == undefined)
			{
				if (evt.currentTarget.func != null) evt.currentTarget.func();
			}
			else
			{
				if (evt.currentTarget.func != null) evt.currentTarget.func(evt.currentTarget.arg);
				else kGAMECLASS.clearBust();
			}
			
			if (!inCombat()) 
			{
				if (pc != null && pc.short != "Uncreated" && pc.short != "uncreated" && pc.short != "")
				{
					updatePCStats();
					updateDisplays();
				}
			}
			
			userInterface.updateTooltip((evt.currentTarget as DisplayObject));
			userInterface.updateRoomTextVisibilityControl();
			
			jackJillDetector(btnName, tFunc, tArg);
		}
		
		public function showBust(... args):void
		{
			userInterface.showBust.apply(null, args);
		}
		
		public function showName(name:String):void
		{
			userInterface.showName(name);
		}
		
		public function addNextButton(func:Function):void
		{
			clearMenu();
			addButton(0, "Next", func);
		}
		
		public function addButton(slot:int, cap:String = "", func:Function = undefined, arg:* = undefined, ttHeader:String = null, ttBody:String = null):void
		{
			userInterface.addButton(slot, cap, func, arg, ttHeader, ttBody);
		}
		
		public function addGhostButton(slot:int, cap:String = "", func:Function = undefined, arg:* = undefined, ttHeader:String = null, ttBody:String = null):void
		{
			userInterface.addGhostButton(slot, cap, func, arg, ttHeader, ttBody);
		}
		
		public function addDisabledButton(slot:int, cap:String = "", ttHeader:String = null, ttBody:String = null):void
		{
			userInterface.addDisabledButton(slot, cap, ttHeader, ttBody);
		}
		
		public function addDisabledGhostButton(slot:int, cap:String = "", ttHeader:String = null, ttBody:String = null):void
		{
			userInterface.addDisabledGhostButton(slot, cap, ttHeader, ttBody);
		}
		
		public function addItemButton(slot:int, item:ItemSlotClass, func:Function = undefined, arg:* = undefined, ttHeader:String = null, ttBody:String = null, seller:Creature = null, buyer:Creature = null):void
		{
			var comparisonString:String = null;
			var compareItem:ItemSlotClass = null;
			
			if (item.type == GLOBAL.RANGED_WEAPON)
			{
				compareItem = (chars["PC"] as Creature).rangedWeapon;
			}
			else if (item.type == GLOBAL.MELEE_WEAPON)
			{
				compareItem = (chars["PC"] as Creature).meleeWeapon;
			}
			else if (item.type == GLOBAL.ARMOR || item.type == GLOBAL.CLOTHING)
			{
				compareItem = (chars["PC"] as Creature).armor;
			}
			else if (item.type == GLOBAL.SHIELD)
			{
				compareItem = (chars["PC"] as Creature).shield;
			}
			else if (item.type == GLOBAL.LOWER_UNDERGARMENT)
			{
				compareItem = (chars["PC"] as Creature).lowerUndergarment;
			}
			else if (item.type == GLOBAL.UPPER_UNDERGARMENT)
			{
				compareItem = (chars["PC"] as Creature).upperUndergarment;
			}
			else if (item.type == GLOBAL.ACCESSORY)
			{
				compareItem = (chars["PC"] as Creature).accessory;
			}
			
			if (compareItem == null)
			{
				compareItem = new NoItem();
			}
			
			comparisonString = item.compareTo(compareItem, seller, buyer);
			
			// Do GUI stuff with the compareItem string -- can probably mangle a call together a call to addButton() to do the needful
			// if we have any null arguments at this point rather than throwing an error and shit.
			userInterface.addItemButton(slot, item.shortName, item.quantity, func, arg, ttHeader, ttBody, comparisonString);
		}
		
		public function addOverrideItemButton(slot:int, item:ItemSlotClass, buttonName:String, func:Function = undefined, arg:* = undefined, ttHeader:String = null, ttBody:String = null):void
		{
			var comparisonString:String = null;
			var compareItem:ItemSlotClass = null;
			
			if (item.type == GLOBAL.RANGED_WEAPON)
			{
				compareItem = (chars["PC"] as Creature).rangedWeapon;
			}
			else if (item.type == GLOBAL.MELEE_WEAPON)
			{
				compareItem = (chars["PC"] as Creature).meleeWeapon;
			}
			else if (item.type == GLOBAL.ARMOR || item.type == GLOBAL.CLOTHING)
			{
				compareItem = (chars["PC"] as Creature).armor;
			}
			else if (item.type == GLOBAL.SHIELD)
			{
				compareItem = (chars["PC"] as Creature).shield;
			}
			else if (item.type == GLOBAL.LOWER_UNDERGARMENT)
			{
				compareItem = (chars["PC"] as Creature).lowerUndergarment;
			}
			else if (item.type == GLOBAL.UPPER_UNDERGARMENT)
			{
				compareItem = (chars["PC"] as Creature).upperUndergarment;
			}
			else if (item.type == GLOBAL.ACCESSORY)
			{
				compareItem = (chars["PC"] as Creature).accessory;
			}
			
			if (compareItem == null)
			{
				compareItem = new NoItem();
			}
			
			comparisonString = item.compareTo(compareItem);
			
			var itemHeader:String = null;
			var itemBody:String = null;
			
			if (ttHeader != null && ttHeader.length > 0) itemHeader = ttHeader;
			if (ttBody != null && ttBody.length > 0) itemBody = ttBody;
			
			if (itemHeader == null || itemHeader.length == 0) itemHeader = TooltipManager.getFullName(item.shortName);
			if (itemBody == null || itemBody.length == 0) itemBody = TooltipManager.getTooltip(item.shortName);
			
			// Do GUI stuff with the compareItem string -- can probably mangle a call together a call to addButton() to do the needful
			// if we have any null arguments at this point rather than throwing an error and shit.
			userInterface.addItemButton(slot, buttonName, 1, func, arg, itemHeader, itemBody, comparisonString);
		}
		
		public function removeButton(slot:int):void
		{
			userInterface.addDisabledButton(slot);
		}
		
		public function refreshFontSize():void
		{
			userInterface.refreshFontSize(gameOptions.fontSize);
		}
		
		public function levelUpHandler(e:Event = null):void
		{
			if ((pc as PlayerCharacter).short.length == 0) return;
			
			if (!this.userInterface.levelUpButton.isActive) return;
			
			if (!this.userInterface.levelUpButton.isHighlighted)
			{
				// Select the correct entry point for the level up system
				if ((pc as PlayerCharacter).unspentStatPoints > 0)
				{
					this.userInterface.showLevelUpStats(pc);
				}
				else if ((pc as PlayerCharacter).unclaimedClassPerks > 0)
				{
					this.userInterface.showLevelUpPerks(pc);
				}
				// else if ((pc as PlayerCharacter).unclaimedGenericPerks > 0)
				//{
				//		this.userInterface.showLevelUpGenericPerks(pc);
				//}
				userInterface.DeGlowButtons();
				this.userInterface.levelUpButton.Glow();
			}
			else
			{
				this.userInterface.showPrimaryOutput();
				userInterface.DeGlowButtons();
			}
		}
		
		public function spacebarKeyEvt():void
		{
			this.userInterface.SpacebarEvent();
		}

		// Proxy through and tweak the input manager along the way
		public function displayInput():void
		{
			this.inputManager.ignoreInputKeys(true);
			this.userInterface.displayInput();
		}
		
		public function removeInput():void
		{
			this.inputManager.ignoreInputKeys(false);
			this.userInterface.removeInput();
		}
		
		public function pressButton(arg:int = 0):void 
		{
			// Basically, store shit now before we execute a scene function using PressButton(), and hence, clear the button data...
			var btnName:String = this.userInterface.buttonTray.getButtonNameForIndex(arg);
			var tFunc:Function = this.userInterface.buttonTray.getFunctionReferenceForIndex(arg);
			var tArg:* = this.userInterface.buttonTray.getArgForIndex(arg);
			
			if (userInterface.PressButton(arg, inCombat()))
			{
				updateDisplays();
				updatePCStats();
			}
			
			userInterface.updateRoomTextVisibilityControl();
			// Then pass it into some code that will detect the failure state. If the state is triggered, use the args to figure out WHERE it happened.
			jackJillDetector(btnName, tFunc, tArg);
		}
		
		public function updateDisplays():void
		{
			if (pc.hasStatusEffect("In Creation"))
			{
				userInterface.time = "--:--";
				userInterface.days = "-----";
			}
			else
			{
				userInterface.time = timeAsText(hours, minutes);
				userInterface.days = String(days);
			}
			userInterface.showSceneTag();
		}

		// New passthroughs to GUI to handle scroll event controls
		public function upScrollText():void
		{
			this.userInterface.upScrollText();
		}
		
		public function downScrollText():void
		{
			this.userInterface.downScrollText();
		}
		
		public function pageUpScrollText():void
		{
			this.userInterface.pageUpScrollText();
		}
		
		public function pageDownScrollText():void
		{
			this.userInterface.pageDownScrollText();
		}
		
		public function homeScrollText():void
		{
			this.userInterface.homeScrollText();
		}
		
		public function endScrollText():void
		{
			this.userInterface.endScrollText();
		}
		
		public function nextOutputPage():void
		{
			this.userInterface.BufferPageNextHandler();
		}
		
		public function prevOutputPage():void
		{
			this.userInterface.BufferPagePrevHandler();
		}
		
		// Cheaty hooks for stuff
		public function IsFunction(name:String):Boolean
		{
			if (this[name] != undefined) return true;
			return false;
		}
		
		public function ExecuteFunction(name:String):void
		{
			this[name]();
		}
		
		// This is hacky as fuck, but it's the ONLY way I can think of pinning down exactly where this issue happens
		public function jackJillDetector(btnName:String, tFunc:Function, tArg:*):void
		{
			if (flags["RIVALCONFIGURED"] == 1)
			{
				if (chars["RIVAL"] && chars["RIVAL"].short == "Jack/Jill")
				{
					var dData:String = "(ButtonName:" + btnName + ") ";
					dData += "(Func: ";
					
					// This will PROBABLY BE SLOW AS MOTHERFUCK
					var methods:XMLList = describeType(this)..method.@name;
					
					for each (var m:String in methods)
					{
						if (this.hasOwnProperty(m) && this[m] != null && this[m] === tFunc)
						{
							dData += m;
							break;
						}
					}
					
					dData += ") ";
					if (tArg != undefined) dData += "(Arg: " + tArg + ")";
					
					//output("\n\n<b>ERROR: Rival creature has been previously configured, but has reverted to defaults. Debug data:" + dData + "</b>");
					
					throw new Error("ERROR: Rival creature has been previously configured, but has reverted to defaults. Debug data:" + dData); // Hope like fuck this isn't attached to a "Next" button
				}
			}
			// Noticed issue on an incoming save, offer to fix.
			else if (flags["RIVALCONFIGURED"] == 2)
			{
				flags["RIVALCONFIGURED"] = 3;
				eventQueue.push(jackJillIssueSceneEvent);
			}
			
			// Co-opting this for Lane
			if (flags["MET_LANE"] != undefined && chars["LANE"].eyeColor != "dark blue")
			{
				if (flags["LANE_BROKEN_INCOMINGSAVE"] == undefined)
				{
					dData = "(ButtonName:" + btnName + ") ";
					dData += "(Func: ";
					
					// This will PROBABLY BE SLOW AS MOTHERFUCK
					methods = describeType(this)..method.@name;
					
					for each (m in methods)
					{
						if (this.hasOwnProperty(m) && this[m] != null && this[m] === tFunc)
						{
							dData += m;
							break;
						}
					}
					
					dData += ") ";
					if (tArg != undefined) dData += "(Arg: " + tArg + ")";
					
					output("\n\n<b>ERROR: Lane has been previously configured, but has reverted to defaults. Debug data:" + dData + "</b>");
					
					throw new Error("ERROR: Lane creature has been previously configured, but has reverted to defaults. Debug data:" + dData); // Hope like fuck this isn't attached to a "Next" button
				}
				else if (flags["LANE_BROKEN_INCOMINGSAVE"] == 1)
				{
					flags["LANE_BROKEN_INCOMINGSAVE"] = 2;
					eventQueue.push(laneIssueSceneEvent);
				}
			}
		}
		
		public function jackJillIssueSceneEvent():void
		{
			clearOutput();
			output("Ooops!");
			output("\n\nWe've noticed a problem with your savegame; unfortunately, a long standing bug that we've yet to properly track down has been encountered at some point in the past, and the creature data for your Rival has been reset to defaults.");
			output("\n\nWe've put some more code in place to help finally track down the root cause of the issue, so we're itching to finally track it down before too long. In the mean-time, whenever this issue is detected, we'll offer to let you fix the problem.");
			output("\n\nPlease re-select the gender that you intended for your Rival.");
			clearMenu();
			
			flags["RIVALCONFIGURED"] = 3;
			
			addButton(0, "Male", fixRival, 1);
			addButton(1, "Female", fixRival, 0);
		}
		
		public function fixRival(arg:int):void
		{
			clearOutput();
			output("Your Rival should now be fixed!");
			
			setRivalGender(arg);
			
			clearMenu();
			addButton(0, "Next", mainGameMenu);
		}
		
		public function laneIssueSceneEvent():void
		{
			clearOutput();
			output("Ooops!");
			output("\n\nWe've noticed a problem with your savegame; unfortunately, a long standing bug that we've yet to properly track down has been encountered at some point in the past, and the creature data for Lane has been reset to defaults.");
			output("\n\nWe've put some more code in place to help finally track down the root cause of the issue, so we're itching to finally track it down before too long. In the mean-time, whenever this issue is detected, we'll offer to let you fix the problem.");
			output("\n\nPlease re-select the gender that you intended for Lane.");
			clearMenu();
			
			addButton(0, "Male", fixLane, lane.configMale);
			addButton(1, "Female", fixLane, lane.configFemale);
		}
		
		public function fixLane(arg:Function):void
		{
			clearOutput();
			output("Lane should now be fixed!");
			
			arg();
			flags["LANE_BROKEN_INCOMINGSAVE"] = undefined;
			
			clearMenu();
			addButton(0, "Next", mainGameMenu);
		}
		
		public function get pc():PlayerCharacter
		{
			return chars["PC"];
		}
		public function get baby():PlayerOffspring
		{
			return chars["PC_BABY"];
		}

		/* The following three accessors provide indirection during certain scenes, allowing generic, semantically-distict access to different characters.
		 * 
		 * target always refers to the current target of any attack. This could be the player, or an NPC in the players group- it is not restricted to player-attack targets.
		 * 
		 * attacker is similar to target, but refers to the current attacker. It operates under the same assumptions. Note that these will always refer to the "user" of an ability (attacker) and the "focus" of that ability (target) _if a target is required_
		 * 
		 * enemy always refers to the creature deemed to be in opposition to the player. In instances on enemy-on-enemy ability usage (say, for a heal), then this will be the user of the ability itself. This is also used at the end of combat as a replacement to enemy in that it is means by which the victory or loss scenes can refer to a specific character that was involved in combat.
		 * 
		 * Combined, these three aren't really required for the attack function implementations to work- the attacker and the target are always passed in as arguments. However, this is how the parser can access these characters, allowing parser tags to be used in a generic manner inside attack functions and such. SingleCombatAttacks will configure this during execution, but for "custom" NPC attacks, you'll have to set these... if you don't use the baseline selectTarget() function that the CombatAI functions use to randomly select a target. Another function exists to do this quickly; notifyTargetSelection().
		 */
		private var _target:Creature = null;
		public function get target():Creature { return _target; }
		public function setTarget(v:Creature):void { _target = v; } // This is intentionally not a setter function to highlight incorrect usage.
		
		private var _attacker:Creature = null;
		public function get attacker():Creature { return _attacker; }
		public function setAttacker(v:Creature):void { _attacker = v; }
		
		private var _enemy:Creature = null;
		public function get enemy():Creature { return _enemy; }
		public function setEnemy(v:Creature):void { _enemy = v; }
		
		public function get celise():Celise
		{
			return chars["CELISE"];
		}
		public function get rival():Rival
		{
			return chars["RIVAL"];
		}
		public function get geoff():Geoff
		{
			return chars["GEOFF"];
		}
		public function get flahne():Flahne
		{
			return chars["FLAHNE"];
		}
		public function get zilpack():ZilPack
		{
			return chars["ZILPACK"];
		}
		public function get zil():ZilMale
		{
			return chars["ZIL"];
		}
		public function get penny():Penny
		{
			return chars["PENNY"];
		}
		public function get renvra():Renvra
		{
			return chars["RENVRA"];
		}
		public function get embry():Embry
		{
			return chars["EMBRY"];
		}
		public function get shekka():Shekka
		{
			return chars["SHEKKA"];
		}
		public function get burt():Burt
		{
			return chars["BURT"];
		}
		public function get zilFemale():ZilFemale
		{
			return chars["ZILFEMALE"];
		}
		public function get cuntsnake():CuntSnake
		{
			return chars["CUNTSNAKE"];
		}
		public function get reaha():Reaha
		{
			return chars["REAHA"];
		}
		public function get dane():Dane
		{
			return chars["DANE"];
		}
		public function get mimbrane():Mimbrane
		{
			return chars["MIMBRANE"];
		}
		public function get anno():Anno
		{
			return chars["ANNO"];
		}
		public function get kiro():Kiro
		{
			return chars["KIRO"];
		}
		public function get saendra():Saendra
		{
			return chars["SAENDRA"];
		}
		public function get sera():Sera
		{
			return chars["SERA"];
		}
		public function get syri():Syri
		{
			return chars["SYRI"];
		}
		public function get vanae():Creature
		{
			return this.enemy;
		}
		public function get vanaeMaiden():MaidenVanae
		{
			return chars["MAIDEN_VANAE"];
		}
		public function get vanaeHuntress():HuntressVanae
		{
			return chars["HUNTRESS_VANAE"];
		}
		public function get gianna():Gianna
		{
			return chars["GIANNA"];
		}
		public function get brynn():Brynn
		{
			return chars["BRYNN"];
		}
		public function get lane():Lane
		{
			return chars["LANE"];
		}
		public function get anarrie():Anarrie
		{
			return chars["ANARRIE"];
		}
		public function get goo():gooArmor
		{
			return chars["GOO"];
		}
		public function get nevrie():Nevrie
		{
			return chars["NEVRIE"];
		}
		public function get queenOfTheDeep():QueenOfTheDeep
		{
			return chars["QUEENOFTHEDEEP"];
		}
		public function get shade():Shade
		{
			return chars["SHADE"];
		}
		public function get bess():Bess
		{
			return chars["BESS"];
		}
		public function get ben():Bess
		{
			return chars["BESS"];
		}
		public function get taivra():Taivra
		{
			return chars["TAIVRA"];
		}
		public function get gene():Gene
		{
			return chars["GENE"];
		}
		public function get petr():Petr
		{
			return chars["PETR"];
		}
		public function get docLash():DoctorLash
		{
			return chars["DRLASH"];
		}
		public function get goocubator():Goocubator
		{
			return chars["GOOCUBATOR"];
		}
		public function get kara():Kara
		{
			return chars["KARA"];
		}
		public function get fyn():Fyn
		{
			return chars["FYN"];
		}
		public function get semith():Semith
		{
			return chars["SEMITH"];
		}
		public function get emmy():Emmy
		{
			return chars["EMMY"];
		}
		public function get liriel():Liriel
		{
			return chars["LIRIEL"];
		}
		public function get lerris():Lerris
		{
			return chars["LERRIS"];
		}
		public function get nerrasa():Nerrasa
		{
			return chars["NERRASA"];
		}
		public function get jerome():Jerome
		{
			return chars["JEROME"];
		}
		public function get inessa():Inessa
		{
			return chars["INESSA"];
		}
		public function get edan():Edan
		{
			return chars["EDAN"];
		}
		public function get ilaria():Ilaria
		{
			return chars["ILARIA"];
		}
		public function get wulfe():Siegwulfe
		{
			return chars["WULFE"];
		}
		
		private var _dbgtestvar:int = 0;
		public function dbgshieldparsertag():String
		{
			_dbgtestvar++;
			return "This tag has been parsed " + _dbgtestvar + " time" + (_dbgtestvar == 1 ? "" : "s") +".";
		}
		
		/*
		// Embed(source = "../Silence.swf")
		public var Silence:Class;
		
		public function YouThinkThisIsAGame():void
		{
			var s = new this.Silence();
			s.addEventListener(Event.COMPLETE, GameGo);
		}
		
		public function GameGo(e:Event):void
		{
			trace("loaded");
			var b:Sprite = new Sprite();
			b.graphics.beginFill(0x636363);
			b.graphics.drawRect(0, 0, 1200, 800);
			b.graphics.endFill();
			stage.addChild(b);
			stage.addChild(e.target.getChildAt(0).content);
		}
		*/
	}
}
