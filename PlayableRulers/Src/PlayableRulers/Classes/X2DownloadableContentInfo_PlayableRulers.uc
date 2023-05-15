// ===============================================================================================================
//	X2DownloadableContentInfo_PlayableRulers BY TRNEEDANAME AND RUSTYDIOS
//
//	CREATED ON 09/08/22	21:00	LAST UPDATED 27/10/2022
//
//	DLC2INFO FOR PLAYABLE RULERS WORKSHOP VERSION
//
// ===============================================================================================================

class X2DownloadableContentInfo_PlayableRulers extends X2DownloadableContentInfo config(Game);

var config array<name> AllowedCharacters, IncludedAlienClasses, IncludedAlienTemplates;
var localized string	SecondWaveDescription;
var localized string	SecondWaveTooltip;

var config int			StartingViperKingNum;
var config int			StartingArchonKingNum;
var config int			StartingBerserkerQueenNum;
var config(GameData) bool	StartVKRuler, VKRulerInGatecrasherSquad;
var config(GameData) bool	StartAKRuler, AKRulerInGatecrasherSquad;
var config(GameData) bool	StartBQRuler, BQRulerInGatecrasherSquad;
var config(GameData) int	VKGatecrasherSlot;
var config(GameData) int	AKGatecrasherSlot;
var config(GameData) int	BQGatecrasherSlot;


// ===============================================================================================================
//	THINGS TO DO ON NEW GAME
// ===============================================================================================================

//static event InstallNewCampaign(XComGameState StartState)
//{   
//	if (default.StartVKRuler)
//	{
//		AddViperKingRecruit(StartState);
//	}
//	else if (default.StartAKRuler)
//	{
//		AddArchonKingRecruit(StartGame);
//	}
//	else if (default.StartBQRuler)
//	{
//		AddArchonKingRecruit(StartGame);
//	}
//}

// ===============================================================================================================
//	THINGS TO DO ON LOAD OF A GAMESAVE
// ===============================================================================================================

static event OnLoadedSavedGame()
{
    AddTechGameStates();
}

static event OnLoadedSavedGameToStrategy()
{
    AddTechGameStates();
}

// ===============================================================================================================
//	OPTC CODE -- USED HERE TO SWAP SOME IMAGES FROM DEFAULT
// ===============================================================================================================

static event OnPostTemplatesCreated()
{
  local X2AbilityTemplateManager AllAbilities;

	AllAbilities = class'X2AbilityTemplateManager'.static.GetAbilityTemplateManager();

	PatchImages_Ability(AllAbilities.FindAbilityTemplate('AlienRulerCallForEscape'), "UILibrary_PerKKKKIcons.UIPerk_psi_rift");
	PatchImages_Ability(AllAbilities.FindAbilityTemplate('PA_Faithbreaker'), "UILibrary_DLC2Images.PerkIcons.UIPerk_beserker_faithbreaker");
	PatchImages_Ability(AllAbilities.FindAbilityTemplate('PA_Quake'), "UILibrary_DLC2Images.PerkIcons.UIPerk_beserker_quake");
}

static function PatchImages_Ability(X2AbilityTemplate Template, string ImagePath)
{
	//if the template perk exists, set it's icon to the image path
	if (Template != none)
	{
		Template.IconImage = "img:///" $ImagePath;
	}
}

// ===============================================================================================================
//	FUNCTION TO ADD TECHS TO AN ONGOING/MID-CAMPAIGN SAVE
// ===============================================================================================================

static function AddTechGameStates()
{
    local XComGameState NewGameState;
    local X2StrategyElementTemplateManager StratMgr;

    //This adds the techs to games that installed the mod in the middle of a campaign.
    StratMgr = class'X2StrategyElementTemplateManager'.static.GetStrategyElementTemplateManager();

    //Create a pending game state change
    NewGameState = class'XComGameStateContext_ChangeContainer'.static.CreateChangeState("Adding Playable Aliens Techs");

    //Find tech templates
    CheckForTech(StratMgr, NewGameState, 'PA_ViperKing_Tech');
    CheckForTech(StratMgr, NewGameState, 'PA_BerserkerQueen_Tech');
    CheckForTech(StratMgr, NewGameState, 'PA_ArchonKing_Tech');

	CheckForTech(StratMgr, NewGameState, 'ViperKingReanimationResearch');
	CheckForTech(StratMgr, NewGameState, 'BerserkerQueenReanimationResearch');
	CheckForTech(StratMgr, NewGameState, 'ArchonKingReanimationResearch');
    
    if( NewGameState.GetNumGameStateObjects() > 0 )
    {
        //Commit the state change into the history.
        `XCOMHISTORY.AddGameStateToHistory(NewGameState);
    }
    else
    {
        `XCOMHISTORY.CleanupPendingGameState(NewGameState);
    }
}

static function CheckForTech(X2StrategyElementTemplateManager StratMgr, XComGameState NewGameState, name ResearchName)
{
    local X2TechTemplate TechTemplate;

	//if it's not in history, add it now
    if ( !IsResearchInHistory(ResearchName) )
    {
        TechTemplate = X2TechTemplate(StratMgr.FindStrategyElementTemplate(ResearchName));
        if(TechTemplate != none)
        {
            NewGameState.CreateNewStateObject(class'XComGameState_Tech', TechTemplate);
        }
    }
}

static function bool IsResearchInHistory(name ResearchName)
{
    // Check if we've already injected the tech templates
    local XComGameState_Tech    TechState;
    
    foreach `XCOMHISTORY.IterateByClassType(class'XComGameState_Tech', TechState)
    {
        if ( TechState.GetMyTemplateName() == ResearchName )
        {
            return true;
        }
    }
    
}

// ===============================================================================================================
//	TAG HANDLER TO EXPAND LOCALISATION WITH CONFIG VALUES (modified by Iridar. Thanks for the help)
// ===============================================================================================================

static function bool AbilityTagExpandHandler(string InString, out string OutString)
{
    local name TagText;

    TagText = name(InString);

    switch (TagText)
    {
		//		TAG NAME IN LOCALISATION					STRING		FROM THIS CLASS				CONFIG		VALUE					FOUND STRING
    	case 'PARulers_BC_MG_ClipSize_Tag':		OutString = string(class'X2Item_AlienBossesWeapons'.default.PARulers_BC_MG_ClipSize);	return true;
    	case 'PARulers_BC_BM_ClipSize_Tag':		OutString = string(class'X2Item_AlienBossesWeapons'.default.PARulers_BC_BM_ClipSize);	return true;

   		default: 
    }  
}

// ===============================================================================================================
//	INVENTORY HOOKING CODE TO ALLOW ONLY THE LISTED UNIT (ALIEN RULER) TO USE FROST SPIT/GLOB (thanks to RustyDios)
// ===============================================================================================================

static function bool CanAddItemToInventory_CH_Improved(out int bCanAddItem, const EInventorySlot Slot, const X2ItemTemplate ItemTemplate, int Quantity, XComGameState_Unit UnitState,optional XComGameState CheckGameState, optional out string DisabledReason, optional XComGameState_Item ItemState)
{
    local XGParamTag LocTag;
    local bool OverrideNormalBehavior;
    local bool DoNotOverrideNormalBehavior;

       // Prepare return values to make it easier for us to read the code.
    OverrideNormalBehavior = CheckGameState != none;
    DoNotOverrideNormalBehavior = CheckGameState == none;   

    if(ItemTemplate.DataName == 'PARulers_FrostbiteGlob')
    {
        // for every character template on our list in the config and THIS unit, matches our config entry
        if (default.AllowedCharacters.Find(UnitState.GetMyTemplateName()) != INDEX_NONE)
        {
            return DoNotOverrideNormalBehavior;
        }
        else
        {
            //set up localisation to take a unique value
            LocTag = XGParamTag(`XEXPANDCONTEXT.FindTag("XGParam"));
            LocTag.StrValue0 = class'X2SoldierClassTemplateManager'.static.GetSoldierClassTemplateManager().FindSoldierClassTemplate('ViperKingClass').DisplayName;
            DisabledReason = class'UIUtilities_Text'.static.CapsCheckForGermanScharfesS(`XEXPAND.ExpandString(class'UIArmory_Loadout'.default.m_strNeedsSoldierClass));
            bCanAddItem = 0;
            return OverrideNormalBehavior; // if we get this far, we give a disabled reason for being an invalid class.
        }
    }

    return DoNotOverrideNormalBehavior; // was not our grenade or otherwise we had no reason to change it
}

// ===============================================================================================================
//	Second Wave Options
// ===============================================================================================================

static function CreateSecondWaveOption()
{
	local SecondWaveOption	SecondWave;
	local UIShellDifficulty	ShellDifficulty;
	local Object			ArrayObject;
	local array<Object>		UIShells;

	SecondWave.ID = 'PlayableRulers';
	SecondWave.DifficultyValue = 0;

	UIShells = class'XComEngine'.static.GetClassDefaultObjects(class'UIShellDifficulty');
	foreach UIShells(ArrayObject)
	{
		ShellDifficulty = UIShellDifficulty(ArrayObject);
		if(ShellDifficulty != none)
		{
			ShellDifficulty.SecondWaveOptions.AddItem(SecondWave);
			ShellDifficulty.SecondWaveDescriptions.AddItem(default.SecondWaveDescription);
			ShellDifficulty.SecondWaveTooltips.AddItem(default.SecondWaveTooltip);
		}
	}
}

// ===============================================================================================================
//	NEW CONSOLE COMMAND TO FORCE ADD A PLAYABLE ALIEN/RULER TO XCOM BARRACKS
//	PA_ViperKing	PA_BerserkerQueen	PA_ArchonKing
// ===============================================================================================================


//* This function doesn't seems to work

// exec function AddPlayableRuler(name TemplateName)
// {
// 	local XComGameState NewGameState;
// 	local XComGameState_HeadquartersXCom XComHQ;
// 	local XComGameState_Unit NewSoldierState;

// 	local X2CharacterTemplateManager	CharTemplateMgr;
// 	local X2CharacterTemplate 			CharTemplate;

// 	local XComOnlineProfileSettings 	ProfileSettings;

// 	//Create a new gamestate
// 	NewGameState = class'XComGameStateContext_ChangeContainer'.static.CreateChangeState("Adding Playable Alien Recruit");

// 	//get current HQ
// 	XComHQ = XComGameState_HeadquartersXCom(class'XComGameStateHistory'.static.GetGameStateHistory().GetSingleGameStateObjectForClass(class'XComGameState_HeadquartersXCom'));

// 	//find character from input template
// 	ProfileSettings = `XPROFILESETTINGS;
// 	CharTemplateMgr = class'X2CharacterTemplateManager'.static.GetCharacterTemplateManager();
// 	CharTemplate = CharTemplateMgr.FindCharacterTemplate(TemplateName);
// 	if(CharTemplate == none)
// 	{
// 		class'Helpers'.static.OutputMsg("UNKNOWN TEMPLATE NAME[" @TemplateName @"]");
// 		 //if we don't get any valid templates, that means the user has entered the wrong name
// 	}

// 	//create new character from input template
// 	NewSoldierState = `CHARACTERPOOLMGR.CreateCharacter(NewGameState, ProfileSettings.Data.m_eCharPoolUsage, CharTemplate.DataName);
	
// 	if(!NewSoldierState.HasBackground())
// 	{
// 		NewSoldierState.GenerateBackground();
// 	}

// 	NewSoldierState.GiveRandomPersonality();
// 	NewSoldierState.ApplyInventoryLoadout(NewGameState);
// 	NewSoldierState.SetHQLocation(eSoldierLoc_Barracks);
	
// 	//add new character to xcom hq
// 	XComHQ = XComGameState_HeadquartersXCom(NewGameState.ModifyStateObject(class'XComGameState_HeadquartersXCom', XComHQ.ObjectID));
// 	XComHQ.AddToCrew(NewGameState, NewSoldierState);

// 	class'Helpers'.static.OutputMsg("TEMPLATE NAME[" @TemplateName @"] ADDED TO CREW");

// 	//save new gamestate and new hq
// 	if(NewGameState.GetNumGameStateObjects() > 0)
// 	{
// 		`XCOMGAME.GameRuleset.SubmitGameState(NewGameState);
// 	}
// 	else
// 	{
// 		`XCOMHISTORY.CleanupPendingGameState(NewGameState);
// 	}
// }


exec function AddViperKingRecruit()
{
	local XComGameState_Unit NewSoldierState;
	local XComOnlineProfileSettings ProfileSettings;
	local X2CharacterTemplate CharTemplate;
	local X2CharacterTemplateManager    CharTemplateMgr;
	local XComGameState NewGameState;
	local XComGameState_HeadquartersXCom XComHQ;
	NewGameState = class'XComGameStateContext_ChangeContainer'.static.CreateChangeState("Adding Allies Unknown State Objects");

	XComHQ = XComGameState_HeadquartersXCom(class'XComGameStateHistory'.static.GetGameStateHistory().GetSingleGameStateObjectForClass(class'XComGameState_HeadquartersXCom'));


		//assert(NewGameState != none);
		ProfileSettings = `XPROFILESETTINGS;

		CharTemplateMgr = class'X2CharacterTemplateManager'.static.GetCharacterTemplateManager();
		//Tuple = TupleMgr.GetRandomTuple();

		CharTemplate = CharTemplateMgr.FindCharacterTemplate('PA_ViperKing');
		if(CharTemplate == none)
		{
			 //if we don't get any valid templates, that means the user has yet to install any species mods
		}
			
		NewSoldierState = `CHARACTERPOOLMGR.CreateCharacter(NewGameState, ProfileSettings.Data.m_eCharPoolUsage, CharTemplate.DataName);
		if(!NewSoldierState.HasBackground())
			NewSoldierState.GenerateBackground();
		NewSoldierState.GiveRandomPersonality();
		NewSoldierState.RankUpSoldier(NewGameState, 'ViperKingClass');
		NewSoldierState.ApplyInventoryLoadout(NewGameState);
		NewSoldierState.SetHQLocation(eSoldierLoc_Barracks);
		XComHQ = XComGameState_HeadquartersXCom(NewGameState.ModifyStateObject(class'XComGameState_HeadquartersXCom', XComHQ.ObjectID));
		XComHQ.AddToCrew(NewGameState, NewSoldierState);

	if(NewGameState.GetNumGameStateObjects() > 0)
	{
		`XCOMGAME.GameRuleset.SubmitGameState(NewGameState);
	}
	else
	{
		`XCOMHistory.CleanupPendingGameState(NewGameState);
	}

		if (default.VKRulerInGatecrasherSquad)
	{
		XComHQ.Squad.RemoveItem(XComHQ.Squad[default.VKGatecrasherSlot]); // 3 is faction soldier in non legendary playthrough
		XComHQ.Squad.AddItem(NewSoldierState.GetReference());
	}
}

exec function AddBerserkerQueenRecruit()
{
	local XComGameState_Unit NewSoldierState;
	local XComOnlineProfileSettings ProfileSettings;
	local X2CharacterTemplate CharTemplate;
	local X2CharacterTemplateManager    CharTemplateMgr;
	local XComGameState NewGameState;
	local XComGameState_HeadquartersXCom XComHQ;
	NewGameState = class'XComGameStateContext_ChangeContainer'.static.CreateChangeState("Adding Allies Unknown State Objects");

	XComHQ = XComGameState_HeadquartersXCom(class'XComGameStateHistory'.static.GetGameStateHistory().GetSingleGameStateObjectForClass(class'XComGameState_HeadquartersXCom'));


		//assert(NewGameState != none);
		ProfileSettings = `XPROFILESETTINGS;

		CharTemplateMgr = class'X2CharacterTemplateManager'.static.GetCharacterTemplateManager();
		//Tuple = TupleMgr.GetRandomTuple();

		CharTemplate = CharTemplateMgr.FindCharacterTemplate('PA_BerserkerQueen');
		if(CharTemplate == none)
		{
			 //if we don't get any valid templates, that means the user has yet to install any species mods
		}

		NewSoldierState = `CHARACTERPOOLMGR.CreateCharacter(NewGameState, ProfileSettings.Data.m_eCharPoolUsage, CharTemplate.DataName);
		if(!NewSoldierState.HasBackground())
			NewSoldierState.GenerateBackground();
		NewSoldierState.GiveRandomPersonality();
		NewSoldierState.ApplyInventoryLoadout(NewGameState);
		NewSoldierState.SetHQLocation(eSoldierLoc_Barracks);
		NewSoldierState.RankUpSoldier(NewGameState, 'BerserkerQueenClass');
		XComHQ = XComGameState_HeadquartersXCom(NewGameState.ModifyStateObject(class'XComGameState_HeadquartersXCom', XComHQ.ObjectID));
		XComHQ.AddToCrew(NewGameState, NewSoldierState);

	if(NewGameState.GetNumGameStateObjects() > 0)
	{
		`XCOMGAME.GameRuleset.SubmitGameState(NewGameState);
	}
	else
	{
		`XCOMHistory.CleanupPendingGameState(NewGameState);
	}
		if (default.BQRulerInGatecrasherSquad)
	{
		XComHQ.Squad.RemoveItem(XComHQ.Squad[default.BQGatecrasherSlot]); // 3 is faction soldier in non legendary playthrough
		XComHQ.Squad.AddItem(NewSoldierState.GetReference());
	}
}

exec function AddArchonKingRecruit()
{
	local XComGameState_Unit NewSoldierState;
	local XComOnlineProfileSettings ProfileSettings;
	local X2CharacterTemplate CharTemplate;
	local X2CharacterTemplateManager    CharTemplateMgr;
	local XComGameState NewGameState;
	local XComGameState_HeadquartersXCom XComHQ;
	NewGameState = class'XComGameStateContext_ChangeContainer'.static.CreateChangeState("Adding Allies Unknown State Objects");

	XComHQ = XComGameState_HeadquartersXCom(class'XComGameStateHistory'.static.GetGameStateHistory().GetSingleGameStateObjectForClass(class'XComGameState_HeadquartersXCom'));


		//assert(NewGameState != none);
		ProfileSettings = `XPROFILESETTINGS;

		CharTemplateMgr = class'X2CharacterTemplateManager'.static.GetCharacterTemplateManager();
		//Tuple = TupleMgr.GetRandomTuple();

		CharTemplate = CharTemplateMgr.FindCharacterTemplate('PA_ArchonKing');
		if(CharTemplate == none)
		{
			 //if we don't get any valid templates, that means the user has yet to install any species mods
		}

		NewSoldierState = `CHARACTERPOOLMGR.CreateCharacter(NewGameState, ProfileSettings.Data.m_eCharPoolUsage, CharTemplate.DataName);
		if(!NewSoldierState.HasBackground())
			NewSoldierState.GenerateBackground();
		NewSoldierState.GiveRandomPersonality();
		NewSoldierState.RankUpSoldier(NewGameState, 'ArchonKingClass');
		NewSoldierState.ApplyInventoryLoadout(NewGameState);
		NewSoldierState.SetHQLocation(eSoldierLoc_Barracks);
		XComHQ = XComGameState_HeadquartersXCom(NewGameState.ModifyStateObject(class'XComGameState_HeadquartersXCom', XComHQ.ObjectID));
		XComHQ.AddToCrew(NewGameState, NewSoldierState);

	if(NewGameState.GetNumGameStateObjects() > 0)
	{
		`XCOMGAME.GameRuleset.SubmitGameState(NewGameState);
	}
	else
	{
		`XCOMHistory.CleanupPendingGameState(NewGameState);
	}
		if (default.AKRulerInGatecrasherSquad)
	{
		XComHQ.Squad.RemoveItem(XComHQ.Squad[default.AKGatecrasherSlot]); // 3 is faction soldier in non legendary playthrough
		XComHQ.Squad.AddItem(NewSoldierState.GetReference());
	}
}