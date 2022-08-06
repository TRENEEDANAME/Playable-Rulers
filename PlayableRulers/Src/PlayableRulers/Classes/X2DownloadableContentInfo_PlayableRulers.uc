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

static function bool CanAddItemToInventory_CH_Improved(
    out int bCanAddItem,                   // out value for XComGameState_Unit
    const EInventorySlot Slot,             // Inventory Slot you're trying to equip the Item into
    const X2ItemTemplate ItemTemplate,     // Item Template of the Item you're trying to equip
    int Quantity, 
    XComGameState_Unit UnitState,          // Unit State of the Unit you're trying to equip the Item on
    optional XComGameState CheckGameState, 
    optional out string DisabledReason,    // out value for the UIArmory_Loadout
    optional XComGameState_Item ItemState) // Item State of the Item we're trying to equip
{
    local X2ArmorTemplate               ArmorTemplate;
    local XGParamTag                    LocTag;
    local name                          ClassName;
    local X2SoldierClassTemplateManager          Manager;
 
    local bool OverrideNormalBehavior;
    local bool DoNotOverrideNormalBehavior;
 
    // Prepare return values to make it easier for us to read the code.
    OverrideNormalBehavior = CheckGameState != none;
    DoNotOverrideNormalBehavior = CheckGameState == none;
 
    // If there already is a Disabled Reason, it means another mod has already disallowed equipping this item.
    // In this case, we do not interfere with that mod's functions for better compatibility.
    if(DisabledReason != "")
        return DoNotOverrideNormalBehavior; 
 
    // Try to cast the Item Template to Armor Template. This will let us check whether the player is trying to equip armor or something else.
    ArmorTemplate = X2ArmorTemplate(ItemTemplate);
 
    //  The function will proceed past this point only if the player is trying to equip armor.
    if(ArmorTemplate != none)
    {
        //  Grab the soldier class template manager. We will use it later.
        Manager = class'X2SoldierClassTemplateManager'.static.GetSoldierClassTemplateManager();
 
        //  Check if this soldier's class is allowed to equip this armor.
        //  If this soldier class cannot equip this armor anyway (like Spark Armor), then we do not interfere with the game.
        if (!Manager.FindSoldierClassTemplate(UnitState.GetSoldierClassTemplateName()).IsArmorAllowedByClass(ArmorTemplate))
            return DoNotOverrideNormalBehavior;     
 
        //  If we got this far, it means the player is trying to equip armor on a soldier, and that soldier's class is normally allowed to equip it.
        //  Let's take a look at the armor's category.
        switch (ArmorTemplate.ArmorCat)
        {
            //  If this is Spartan Mjolnir armor
            case 'MJOLNIR':
                //  And the soldier has the required perk to unlock this armor (Spartan Training Program), then we simply don't interfere with the game.
                //  remember, this armor is already allowed for this soldier class, so we don't need to do anything else.
                if (UnitState.HasSoldierAbility('SpartanIIProgram')) return DoNotOverrideNormalBehavior;
                else ClassName = 'SPARTAN-II_SS'; // if the soldier is normally allowed to use this armor, but doesn't have the necessary perk
                //  then we write down the name of the Super Soldier class that SHOULD be able to equip this armor
                //  this is basically the best way we can communicate to the player that their soldier is missing the required abiltiy - Spartan Training.
                break;
            case 'NANOSUIT':    //  go through the same logic for other Super Soldier armor classes.
                if (UnitState.HasSoldierAbility('NanosuitRaptorTraining')) return DoNotOverrideNormalBehavior;
                else ClassName = 'Nanosuit_SS';
                break;
            case 'GHOSTSUIT':
                if (UnitState.HasSoldierAbility('GhostProgram')) return DoNotOverrideNormalBehavior;
                else ClassName = 'Ghost_SS';
                break;
            case 'NINJASUIT':
                if (UnitState.HasSoldierAbility('NinjaTheWayOfTheNinja')) return DoNotOverrideNormalBehavior;
                else ClassName = 'Ninja_SS';
                break; 
            case 'CYBORG':
                if (UnitState.HasSoldierAbility('CyborgCyberneticConversion')) return DoNotOverrideNormalBehavior;
                else ClassName = 'Cyborg_SS';
                break;
            default:
                // if we got this far, it means the soldier is trying to equip an armor that doesn't belong to one of the Super Soldier classes, 
                // so we don't need to do anything.
                return DoNotOverrideNormalBehavior;
                break;
        }
 
        //  if we got this far, it means the soldier is trying to equip one of the Super Soldier armors, 
        //  but the soldier doesn't have the required ability.
        //  so we build a message that will be shown in the Armory UI. This message will be displayed in big red letters, 
        //  letting the player know that this armor is available
        //  only to a particular super soldier class.
 
        LocTag = XGParamTag(`XEXPANDCONTEXT.FindTag("XGParam"));
 
        //  use the Soldier Class Template Manager to find the Template for this soldier's class, and get its localized name (e.g. "Ninja")
        LocTag.StrValue0 = Manager.FindSoldierClassTemplate(ClassName).DisplayName;
 
        //  build the message letting the player know only that Super Soldier class is able to equip this armor (e.g. "NINJA ONLY")
        //  set that message to the out value for UI Armory
        DisabledReason = class'UIUtilities_Text'.static.CapsCheckForGermanScharfesS(`XEXPAND.ExpandString(class'UIArmory_Loadout'.default.m_strNeedsSoldierClass));
 
        //  set the out value for XComGameState_Unit, letting the game know that this armor CANNOT be equipped on this soldier
        bCanAddItem = 0;
 
        //  return the override value. This will force the game to actually use our out values we have just set.
        return OverrideNormalBehavior;
 
    }
 
    return DoNotOverrideNormalBehavior; //the item is not Armor, so we don't interfere with the game.
}

static function bool AbilityTagExpandHandler(string InString, out string OutString)
{
    local name TagText;

    TagText = name(InString);

    switch (TagText)
    {
    case 'PARulers_BC_MG_ClipSize_Tag':
        OutString = string(class'X2Item_AlienBossesWeapons'.default.PARulers_BC_MG_ClipSize);
        return true;

    case 'PARulers_BC_BM_ClipSize_Tag':
        OutString = string(class'X2Item_AlienBossesWeapons'.default.PARulers_BC_BM_ClipSize);
        return true;

    default:
            return false;
    }  
}

static function bool CanAddItemToInventory_CH(out int bCanAddItem, const EInventorySlot Slot, const X2ItemTemplate ItemTemplate, int Quantity, XComGameState_Unit UnitState, optional XComGameState CheckGameState, optional out string DisabledReason)
{
	local name CurrentClass;
	local bool IsRightClass;
	local XGParamTag LocTag;
	local X2PairedWeaponTemplate WeaponTemplate;
	local int i;
	local XComGameState_Item kItem;
	local X2ItemTemplate UniqueItemTemplate;

	WeaponTemplate = X2PairedWeaponTemplate(ItemTemplate);
	AlreadyHasLauncher = false;
	IsRightClass = false;

	if(CheckGameState != none)
		return CanAddItemToInventory(bCanAddItem, Slot, ItemTemplate, Quantity, UnitState, CheckGameState);


	if(CheckGameState == none && WeaponTemplate != none && WeaponTemplate.WeaponCat == 'shoulder_launcher') //only do this check for our shoulder launchers
	{
		if(DisabledReason != "") //if this is already set, assume we shouldn't be changing this.
			return true;

		foreach default.AllowedCharacters(CurrentClass)
		{
			if(UnitState.GetMyTemplateName() == CurrentClass)
			{
				IsRightClass = true;
				break;
			}
		}

		if(IsRightClass)
		{
			for (i = 0; i < UnitState.InventoryItems.Length; ++i)
			{
				kItem = UnitState.GetItemGameState(UnitState.InventoryItems[i], CheckGameState);
				if (kItem != none)
				{
					UniqueItemTemplate = kItem.GetMyTemplate();

					if(UniqueItemTemplate.ItemCat == 'shoulder_launcher')
					{
						AlreadyHasLauncher = true;
						break;
					}
				}
			}
			if(!AlreadyHasLauncher)
			{
				return true;
			}
		}
		else if (!IsRightClass)//invalid class, so give Unavailable to Class reason
		{
			LocTag = XGParamTag(`XEXPANDCONTEXT.FindTag("XGParam"));
			LocTag.StrValue0 = class'X2SoldierClassTemplateManager'.static.GetSoldierClassTemplateManager().FindSoldierClassTemplate('Spark').DisplayName;
			DisabledReason = class'UIUtilities_Text'.static.CapsCheckForGermanScharfesS(`XEXPAND.ExpandString(class'UIArmory_Loadout'.default.m_strNeedsSoldierClass));

			return false; //if we get this far, we gave a disabled reason for being an invalid class.
		}
		else if(AlreadyHasLauncher) // no duplicates
		{
			LocTag = XGParamTag(`XEXPANDCONTEXT.FindTag("XGParam"));
			LocTag.StrValue0 = "SHOULDER LAUNCHER";
			DisabledReason = class'UIUtilities_Text'.static.CapsCheckForGermanScharfesS(`XEXPAND.ExpandString(class'UIArmory_Loadout'.default.m_strCategoryRestricted));

			return false; //if we get this far, we gave a disabled reason for being an invalid class.
		}
	}

	return true; ///was not a spark launcher or otherwise we had no reason to change it

}