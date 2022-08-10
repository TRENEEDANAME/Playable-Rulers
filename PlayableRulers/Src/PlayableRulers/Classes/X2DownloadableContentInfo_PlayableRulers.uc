// ===============================================================================================================
//	X2DownloadableContentInfo_PlayableRulers BY TRNEEDANAME AND RUSTYDIOS
//
//	CREATED ON 09/08/22	21:00	LAST UPDATED 09/08/22	21:45
//
//	DLC2INFO FOR PLAYABLE RULERS WORKSHOP VERSION
//
// ===============================================================================================================

class X2DownloadableContentInfo_PlayableRulers extends X2DownloadableContentInfo config(Game);

var config array<name> AllowedCharacters, IncludedAlienClasses, IncludedAlienTemplates;

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

	PatchImages_Ability(AllAbilities.FindAbilityTemplate('AlienRulerCallForEscape'), "UILibrary_PerkIcons.UIPerk_psi_rift");
	PatchImages_Ability(AllAbilities.FindAbilityTemplate('Faithbreaker'), "UILibrary_DLC2Images.PerkIcons.UIPerk_beserker_faithbreaker");
	PatchImages_Ability(AllAbilities.FindAbilityTemplate('Quake'), "UILibrary_DLC2Images.PerkIcons.UIPerk_beserker_quake");
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
    return false;
}

// ===============================================================================================================
//	TAG HANDLER TO EXPAND LOCALISATION WITH CONFIG VALUES
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

   		default: return false;
    }  
}

// ===============================================================================================================
//	INVENTORY HOOKING CODE TO ALLOW ONLY THE LISTED UNIT (ALIEN RULER) TO USE FROST SPIT/GLOB
// ===============================================================================================================

static function bool CanAddItemToInventory_CH(out int bCanAddItem, const EInventorySlot Slot, const X2ItemTemplate ItemTemplate, int Quantity, XComGameState_Unit UnitState, optional XComGameState CheckGameState, optional out string DisabledReason)
{
	local XGParamTag LocTag;
	local X2GrenadeTemplate WeaponTemplate;
	local X2ItemTemplate UniqueItemTemplate;
	local XComGameState_Item kItem;

	local name CurrentClass;
	local int i;

	//ENSURE INPUT WEAPON IS A GRENADE
	WeaponTemplate = X2GrenadeTemplate(ItemTemplate);

	if (WeaponTemplate == none)
	{
		return true; ///was not a grenade or otherwise we had no reason to change it
	}

	//if this state use basegame function
	if(CheckGameState != none)
	{
		return CanAddItemToInventory(bCanAddItem, Slot, ItemTemplate, Quantity, UnitState, CheckGameState);
	}

	//if not continue with this function ... check weapon category for our grenade
	if(CheckGameState == none && WeaponTemplate != none && WeaponTemplate.WeaponCat == 'PARulers_FrostbiteGlobCat')
	{
		//set up localisation to take a unique value
		LocTag = XGParamTag(`XEXPANDCONTEXT.FindTag("XGParam"));
		
		//for every character template on our list in the config
		foreach default.AllowedCharacters(CurrentClass)
		{
			//if THIS unit, matches our config entry
			if(UnitState.GetMyTemplateName() == CurrentClass)
			{
				//check THIS units equipped items
				for (i = 0; i < UnitState.InventoryItems.Length; ++i)
				{
					kItem = UnitState.GetItemGameState(UnitState.InventoryItems[i], CheckGameState);
					if (kItem != none)
					{
						UniqueItemTemplate = kItem.GetMyTemplate();

						//does it have a grenade?
						if(UniqueItemTemplate.ItemCat == 'grenade')
						{
							LocTag.StrValue0 = WeaponTemplate.GetLocalizedCategory();
							DisabledReason = class'UIUtilities_Text'.static.CapsCheckForGermanScharfesS(`XEXPAND.ExpandString(class'UIArmory_Loadout'.default.m_strCategoryRestricted));
							bCanAddItem = 0;
							return false; // we have another grenade equipped
						}
					}
				}

				//ensure slot is 'empty', thanks again Iridar!
				if (UnitState.GetItemInSlot(Slot, CheckGameState) == none)
				{
					bCanAddItem = 1;
					return true; // right class and no grenades equipped
				}
			}
			else
			{
				LocTag.StrValue0 = class'X2SoldierClassTemplateManager'.static.GetSoldierClassTemplateManager().FindSoldierClassTemplate('ViperKingClass').DisplayName;
				DisabledReason = class'UIUtilities_Text'.static.CapsCheckForGermanScharfesS(`XEXPAND.ExpandString(class'UIArmory_Loadout'.default.m_strNeedsSoldierClass));
				bCanAddItem = 0;
				return false; //if we get this far, we give a disabled reason for being an invalid class.
			}
		}
	}

	return true; ///was not our grenade or otherwise we had no reason to change it
}

static function bool CanAddItemToInventory(out int bCanAddItem, const EInventorySlot Slot, const X2ItemTemplate ItemTemplate, int Quantity, XComGameState_Unit UnitState, XComGameState CheckGameState)
{
	local XComGameState_Item kItem;
	local X2GrenadeTemplate WeaponTemplate;
	local X2ItemTemplate UniqueItemTemplate;
	local name CurrentClass;
	local int i;

	//ENSURE INPUT WEAPON IS A GRENADE
	WeaponTemplate = X2GrenadeTemplate(ItemTemplate);

	if (WeaponTemplate == none)
	{
		return true; ///was not a grenade or otherwise we had no reason to change it
	}

	// ... check weapon category for our grenade
    if(WeaponTemplate != none && WeaponTemplate.WeaponCat == 'PARulers_FrostGlobCat') //only do this check for our grenade
    {
		//for every character template on our list in the config
		foreach default.AllowedCharacters(CurrentClass)
		{
			//check THIS units equipped items
			if(UnitState.GetMyTemplateName() == CurrentClass)
			{
				for (i = 0; i < UnitState.InventoryItems.Length; ++i)
				{
					kItem = UnitState.GetItemGameState(UnitState.InventoryItems[i], CheckGameState);
					if (kItem != none)
					{
						UniqueItemTemplate = kItem.GetMyTemplate();

						//does it have a grenade?
						if(UniqueItemTemplate.ItemCat == 'grenade')
						{
							bCanAddItem = 0;
							return false; // we have another grenade equipped
						}
					}
				}

				//ensure slot is 'empty', thanks again Iridar!
				if (UnitState.GetItemInSlot(Slot, CheckGameState) == none)
				{
					bCanAddItem = 1;
					return true; //we set this to true so we can equip the grenade
				}
			}
			else
			{
				bCanAddItem = 0;
				return false; //if we get this far, we give a disabled reason for being an invalid class.
			}
		}
    }

	bCanAddItem = 0;
    return false; // not our grenade
}

// ===============================================================================================================
//	NEW CONSOLE COMMAND TO FORCE ADD A PLAYABLE ALIEN/RULER TO XCOM BARRACKS
//	PA_ViperKing
//	PA_BerserkerQueen
//	PA_ArchonKing
// ===============================================================================================================

exec function AddPlayableAlien_TRNEED(name TemplateName)
{
	local XComGameState NewGameState;
	local XComGameState_HeadquartersXCom XComHQ;
	local XComGameState_Unit NewSoldierState;

	local X2CharacterTemplateManager	CharTemplateMgr;
	local X2CharacterTemplate 			CharTemplate;

	local XComOnlineProfileSettings 	ProfileSettings;

	//Create a new gamestate
	NewGameState = class'XComGameStateContext_ChangeContainer'.static.CreateChangeState("Adding Playable Alien Recruit");

	//get current HQ
	XComHQ = XComGameState_HeadquartersXCom(class'XComGameStateHistory'.static.GetGameStateHistory().GetSingleGameStateObjectForClass(class'XComGameState_HeadquartersXCom'));

	//find character from input template
	ProfileSettings = `XPROFILESETTINGS;
	CharTemplateMgr = class'X2CharacterTemplateManager'.static.GetCharacterTemplateManager();
	CharTemplate = CharTemplateMgr.FindCharacterTemplate(TemplateName);
	if(CharTemplate == none)
	{
		class'Helpers'.static.OutputMsg("UNKNOWN TEMPLATE NAME[" @TemplateName @"]");
		return; //if we don't get any valid templates, that means the user has entered the wrong name
	}

	//create new character from input template
	NewSoldierState = `CHARACTERPOOLMGR.CreateCharacter(NewGameState, ProfileSettings.Data.m_eCharPoolUsage, CharTemplate.DataName);
	
	if(!NewSoldierState.HasBackground())
	{
		NewSoldierState.GenerateBackground();
	}

	NewSoldierState.GiveRandomPersonality();
	NewSoldierState.ApplyInventoryLoadout(NewGameState);
	NewSoldierState.SetHQLocation(eSoldierLoc_Barracks);
	
	//add new character to xcom hq
	XComHQ = XComGameState_HeadquartersXCom(NewGameState.ModifyStateObject(class'XComGameState_HeadquartersXCom', XComHQ.ObjectID));
	XComHQ.AddToCrew(NewGameState, NewSoldierState);

	class'Helpers'.static.OutputMsg("TEMPLATE NAME[" @TemplateName @"] ADDED TO CREW");

	//save new gamestate and new hq
	if(NewGameState.GetNumGameStateObjects() > 0)
	{
		`XCOMGAME.GameRuleset.SubmitGameState(NewGameState);
	}
	else
	{
		`XCOMHISTORY.CleanupPendingGameState(NewGameState);
	}
}
