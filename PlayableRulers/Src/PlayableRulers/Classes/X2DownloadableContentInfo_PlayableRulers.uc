class X2DownloadableContentInfo_PlayableRulers extends X2DownloadableContentInfo config(Game);

var config array<name> IncludedAlienClasses;
var config array<name> IncludedAlienTemplates;
var config int NumberOfAlienUtilitySlots;
//var config name DominationAbility;

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
			return; //if we don't get any valid templates, that means the user has yet to install any species mods
		}

		NewSoldierState = `CHARACTERPOOLMGR.CreateCharacter(NewGameState, ProfileSettings.Data.m_eCharPoolUsage, CharTemplate.DataName);
		if(!NewSoldierState.HasBackground())
			NewSoldierState.GenerateBackground();
		NewSoldierState.GiveRandomPersonality();
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
			return; //if we don't get any valid templates, that means the user has yet to install any species mods
		}

		NewSoldierState = `CHARACTERPOOLMGR.CreateCharacter(NewGameState, ProfileSettings.Data.m_eCharPoolUsage, CharTemplate.DataName);
		if(!NewSoldierState.HasBackground())
			NewSoldierState.GenerateBackground();
		NewSoldierState.GiveRandomPersonality();
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
			return; //if we don't get any valid templates, that means the user has yet to install any species mods
		}

		NewSoldierState = `CHARACTERPOOLMGR.CreateCharacter(NewGameState, ProfileSettings.Data.m_eCharPoolUsage, CharTemplate.DataName);
		if(!NewSoldierState.HasBackground())
			NewSoldierState.GenerateBackground();
		NewSoldierState.GiveRandomPersonality();
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
}

static event OnPostTemplatesCreated()
{
  local X2AbilityTemplateManager                AllAbilities;        //holder for all abilities

  PatchImages_Ability(AllAbilities.FindAbilityTemplate('AlienRulerCallForEscape'), "UILibrary_PerkIcons.UIPerk_psi_rift");
  PatchImages_Ability(AllAbilities.FindAbilityTemplate('Faithbreaker'), "UILibrary_DLC2Images.PerkIcons.UIPerk_beserker_faithbreaker");
  PatchImages_Ability(AllAbilities.FindAbilityTemplate('Quake'), "UILibrary_DLC2Images.PerkIcons.UIPerk_beserker_quake");
}

static function PatchImages_Ability(X2AbilityTemplate Template, string ImagePath)
{
  if (Template != none)
  {
    Template.IconImage = "img:///" $ImagePath;
  }
}

static event OnLoadedSavedGame()
{
    AddTechGameStates();
}
static event OnLoadedSavedGameToStrategy()
{
    AddTechGameStates();
}

static function AddTechGameStates()
{
    local XComGameStateHistory History;
    local XComGameState NewGameState;
    local X2StrategyElementTemplateManager    StratMgr;

    //This adds the techs to games that installed the mod in the middle of a campaign.
    StratMgr = class'X2StrategyElementTemplateManager'.static.GetStrategyElementTemplateManager();
    History = `XCOMHISTORY;    

    //Create a pending game state change
    NewGameState = class'XComGameStateContext_ChangeContainer'.static.CreateChangeState("Adding New Techs");

    //Find tech templates
    CheckForTech(StratMgr, NewGameState, 'PA_ArchonKing_Tech');
    CheckForTech(StratMgr, NewGameState, 'PA_BerserkerQueen_Tech');
    CheckForTech(StratMgr, NewGameState, 'PA_ViperKing_Tech');
    
    if( NewGameState.GetNumGameStateObjects() > 0 )
    {
        //Commit the state change into the history.
        History.AddGameStateToHistory(NewGameState);
    }
    else
    {
        History.CleanupPendingGameState(NewGameState);
    }
}

static function CheckForTech(X2StrategyElementTemplateManager StratMgr, XComGameState NewGameState, name ResearchName)
{
    local X2TechTemplate TechTemplate;

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
    return false;
}