class X2Character_PlayableRulers extends X2Character config(GameData_CharacterStats);

var config bool ALIENS_APPEAR_IN_BASE;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;

	Templates.AddItem(CreateTemplate_ArchonBoss());
	Templates.AddItem(CreateTemplate_BerserkerBoss());
	Templates.AddItem(CreateTemplate_ViperBoss());

	return Templates;
}

static function X2CharacterTemplate CreateTemplate_ViperBoss()
{
	local X2CharacterTemplate CharTemplate;
	local LootReference Loot;

	`CREATE_X2CHARACTER_TEMPLATE(CharTemplate, 'PA_ViperKing');
	CharTemplate.CharacterGroupName = 'ViperKing';
	CharTemplate.DefaultLoadout='ViperBoss_Loadout';
	CharTemplate.BehaviorClass=class'XGAIBehavior';
	CharTemplate.strPawnArchetypes.AddItem("GameUnit_ViperKing.ARC_GameUnit_ViperKing");

	// Timed Loot
	CharTemplate.strMatineePackages.AddItem("CIN_Viper");
	CharTemplate.strMatineePackages.AddItem("CIN_AdventMEC");
	CharTemplate.strTargetingMatineePrefix = "CIN_AdventMEC_FF_StartPos";

	CharTemplate.UnitSize = 1;
	// Traversal Rules
	CharTemplate.bCanUse_eTraversal_Normal = true;
	CharTemplate.bCanUse_eTraversal_ClimbOver = true;
	CharTemplate.bCanUse_eTraversal_ClimbOnto = true;
	CharTemplate.bCanUse_eTraversal_ClimbLadder = true;
	CharTemplate.bCanUse_eTraversal_DropDown = true;
	CharTemplate.bCanUse_eTraversal_Grapple = false;
	CharTemplate.bCanUse_eTraversal_Landing = true;
	CharTemplate.bCanUse_eTraversal_BreakWindow = true;
	CharTemplate.bCanUse_eTraversal_KickDoor = true;
	CharTemplate.bCanUse_eTraversal_JumpUp = false;
	CharTemplate.bCanUse_eTraversal_WallClimb = false;
	CharTemplate.bCanUse_eTraversal_BreakWall = false;
	CharTemplate.bAppearanceDefinesPawn = false;    
	CharTemplate.bCanTakeCover = true;

	CharTemplate.bIsAlien = true;
	CharTemplate.bIsAdvent = false;
	CharTemplate.bIsCivilian = false;
	CharTemplate.bIsPsionic = false;
	CharTemplate.bIsRobotic = false;
	CharTemplate.bIsSoldier = true;

	CharTemplate.bCanBeTerrorist = false;
	CharTemplate.bCanBeCriticallyWounded = false;
	CharTemplate.bIsAfraidOfFire = true;
	CharTemplate.bCanBeCarried = true;	
	CharTemplate.bCanBeRevived = true;
	CharTemplate.bUsePoolSoldiers = true;
	CharTemplate.bStaffingAllowed = true;
	CharTemplate.bAppearInBase = true;
	CharTemplate.bWearArmorInBase = true;
	CharTemplate.bAllowSpawnFromATT = false;
	CharTemplate.bUsesWillSystem = false;
	CharTemplate.bIsTooBigForArmory = true;

	CharTemplate.DefaultSoldierClass = 'ViperKingClass';
	CharTemplate.DefaultLoadout = 'ViperBoss_Loadout';
	CharTemplate.RequiredLoadout = 'ViperBoss_Loadout';

	CharTemplate.Abilities.AddItem('Interact_UseElevator');

	CharTemplate.Abilities.AddItem('Interact_PlantBomb');
	CharTemplate.Abilities.AddItem('Interact_TakeVial');
	CharTemplate.Abilities.AddItem('Interact_StasisTube');
	CharTemplate.Abilities.AddItem('Interact_MarkSupplyCrate');
	CharTemplate.Abilities.AddItem('Interact_ActivateAscensionGate');
	CharTemplate.Abilities.AddItem('Interact_UseElevator');
	CharTemplate.Abilities.AddItem('CarryUnit');
	CharTemplate.Abilities.AddItem('PutDownUnit');
	CharTemplate.Abilities.AddItem('Evac');
	CharTemplate.Abilities.AddItem('PlaceEvacZone');
	CharTemplate.Abilities.AddItem('LiftOffAvenger');
	CharTemplate.Abilities.AddItem('Knockout');
	CharTemplate.Abilities.AddItem('KnockoutSelf');
	CharTemplate.Abilities.AddItem('HunkerDown');
	CharTemplate.Abilities.AddItem('DisableConsumeAllPoints');
	CharTemplate.Abilities.AddItem('Revive');

	CharTemplate.Abilities.AddItem('PA_KingBind');
	CharTemplate.Abilities.AddItem('PA_BindSustained');
	CharTemplate.Abilities.AddItem('PA_EndBind');

	CharTemplate.ImmuneTypes.AddItem('Panicked');
	CharTemplate.ImmuneTypes.AddItem('Berserk');
	CharTemplate.ImmuneTypes.AddItem('Obsessed');
	CharTemplate.ImmuneTypes.AddItem('Shattered');
	CharTemplate.ImmuneTypes.AddItem('Poison');
	CharTemplate.ImmuneTypes.AddItem('Mental');

	CharTemplate.bAllowSpawnFromATT = false;

	CharTemplate.strTargetIconImage = class'UIUtilities_Image'.const.TargetIcon_Alien;

	return CharTemplate;
}


static function X2CharacterTemplate CreateTemplate_ArchonBoss()
{
	local X2CharacterTemplate CharTemplate;
	local LootReference Loot;

	`CREATE_X2CHARACTER_TEMPLATE(CharTemplate, 'PA_ArchonKing');
	CharTemplate.CharacterGroupName = 'ArchonKing';
	CharTemplate.DefaultLoadout='ArchonBoss_Loadout';
	CharTemplate.BehaviorClass=class'XGAIBehavior';
	CharTemplate.strPawnArchetypes.AddItem("GameUnit_ArchonKing.ARC_GameUnit_ArchonKing");
	Loot.ForceLevel=0;
	Loot.LootTableName='ArchonBoss_BaseLoot';
	CharTemplate.Loot.LootReferences.AddItem(Loot);

	// Timed Loot
	CharTemplate.strMatineePackages.AddItem("CIN_Archon");
	CharTemplate.strMatineePackages.AddItem("CIN_AdventMEC");
	CharTemplate.strTargetingMatineePrefix = "CIN_AdventMEC_FF_StartPos";

	CharTemplate.UnitSize = 1;
	// Traversal Rules
	CharTemplate.bCanUse_eTraversal_Normal = true;
	CharTemplate.bCanUse_eTraversal_ClimbOver = false;
	CharTemplate.bCanUse_eTraversal_ClimbOnto = false;
	CharTemplate.bCanUse_eTraversal_ClimbLadder = false;
	CharTemplate.bCanUse_eTraversal_DropDown = false;
	CharTemplate.bCanUse_eTraversal_Grapple = false;
	CharTemplate.bCanUse_eTraversal_Landing = true;
	CharTemplate.bCanUse_eTraversal_BreakWindow = true;
	CharTemplate.bCanUse_eTraversal_KickDoor = true;
	CharTemplate.bCanUse_eTraversal_JumpUp = false;
	CharTemplate.bCanUse_eTraversal_WallClimb = false;
	CharTemplate.bCanUse_eTraversal_BreakWall = false;
	CharTemplate.bCanUse_eTraversal_Launch = true;
	CharTemplate.bCanUse_eTraversal_Flying = true;
	CharTemplate.bCanUse_eTraversal_Land = true;
	CharTemplate.bAppearanceDefinesPawn = false;    
	CharTemplate.bCanTakeCover = false;

	CharTemplate.bIsAlien = true;
	CharTemplate.bIsAdvent = false;
	CharTemplate.bIsCivilian = false;
	CharTemplate.bIsPsionic = false;
	CharTemplate.bIsRobotic = false;
	CharTemplate.bIsSoldier = true;

	CharTemplate.bAllowSpawnFromATT = false;

	CharTemplate.bCanBeTerrorist = false;
	CharTemplate.bCanBeCriticallyWounded = false;
	CharTemplate.bIsAfraidOfFire = true;
	CharTemplate.bCanBeCarried = true;	
	CharTemplate.bCanBeRevived = true;
	CharTemplate.bUsePoolSoldiers = true;
	CharTemplate.bStaffingAllowed = true;
	CharTemplate.bAppearInBase = true;
	CharTemplate.bWearArmorInBase = true;
	CharTemplate.bAllowSpawnFromATT = false;
	CharTemplate.bUsesWillSystem = false;
	CharTemplate.bIsTooBigForArmory = true;

	CharTemplate.DefaultSoldierClass = 'ArchonKingClass';
	CharTemplate.DefaultLoadout = 'ArchonBoss_Loadout';
	CharTemplate.RequiredLoadout = 'ArchonBoss_Loadout';

	CharTemplate.Abilities.AddItem('Interact_PlantBomb');
	CharTemplate.Abilities.AddItem('Interact_TakeVial');
	CharTemplate.Abilities.AddItem('Interact_StasisTube');
	CharTemplate.Abilities.AddItem('Interact_MarkSupplyCrate');
	CharTemplate.Abilities.AddItem('Interact_ActivateAscensionGate');
	CharTemplate.Abilities.AddItem('Interact_UseElevator');
	CharTemplate.Abilities.AddItem('CarryUnit');
	CharTemplate.Abilities.AddItem('PutDownUnit');
	CharTemplate.Abilities.AddItem('Evac');
	CharTemplate.Abilities.AddItem('PlaceEvacZone');
	CharTemplate.Abilities.AddItem('LiftOffAvenger');
	CharTemplate.Abilities.AddItem('Knockout');
	CharTemplate.Abilities.AddItem('KnockoutSelf');
	CharTemplate.Abilities.AddItem('HunkerDown');
	CharTemplate.Abilities.AddItem('DisableConsumeAllPoints');
	CharTemplate.Abilities.AddItem('Revive');
	CharTemplate.Abilities.AddItem('ArchonKingBlazingPinionsStage1');
	CharTemplate.Abilities.AddItem('ArchonKingBlazingPinionsStage2');
	CharTemplate.Abilities.AddItem('IcarusDropSlam');

	CharTemplate.ImmuneTypes.AddItem('Shattered');
	CharTemplate.ImmuneTypes.AddItem('Panicked');
	CharTemplate.ImmuneTypes.AddItem('Obsessed');


	CharTemplate.ImmuneTypes.AddItem('Mental');

	CharTemplate.MPPointValue = CharTemplate.XpKillscore * 10;
	
	CharTemplate.strScamperBT = "ScamperRoot_NoCover";

	CharTemplate.SightedNarrativeMoments.AddItem(XComNarrativeMoment'DLC_60_NarrativeMoments.DLC2_T_Archon_King_Reveal');

	CharTemplate.strTargetIconImage = class'UIUtilities_Image'.const.TargetIcon_Alien;

	return CharTemplate;
}

static function X2CharacterTemplate CreateTemplate_BerserkerBoss()
{
	local X2CharacterTemplate CharTemplate;
	local LootReference Loot;

	`CREATE_X2CHARACTER_TEMPLATE(CharTemplate, 'PA_BerserkerQueen');
	CharTemplate.CharacterGroupName = 'BerserkerQueen';
	CharTemplate.DefaultSoldierClass = 'BerserkerQueenClass';
	CharTemplate.DefaultLoadout='BerserkerBoss_Loadout';
	CharTemplate.BehaviorClass=class'XGAIBehavior';
	CharTemplate.strPawnArchetypes.AddItem("GameUnit_BerserkerQueen.ARC_GameUnit_BerserkerQueen");

	// Timed Loot

	CharTemplate.strMatineePackages.AddItem("CIN_Berserker");

	CharTemplate.UnitSize = 1;
	CharTemplate.UnitHeight = 3; //One unit taller than normal
	// Traversal Rules
	CharTemplate.bCanUse_eTraversal_Normal = true;
	CharTemplate.bCanUse_eTraversal_ClimbOver = true;
	CharTemplate.bCanUse_eTraversal_ClimbOnto = true;
	CharTemplate.bCanUse_eTraversal_ClimbLadder = true;
	CharTemplate.bCanUse_eTraversal_DropDown = true;
	CharTemplate.bCanUse_eTraversal_Grapple = false;
	CharTemplate.bCanUse_eTraversal_Landing = true;
	CharTemplate.bCanUse_eTraversal_BreakWindow = true;
	CharTemplate.bCanUse_eTraversal_KickDoor = true;
	CharTemplate.bCanUse_eTraversal_JumpUp = false;
	CharTemplate.bCanUse_eTraversal_WallClimb = false;
	CharTemplate.bCanUse_eTraversal_BreakWall = false;
	CharTemplate.bAppearanceDefinesPawn = false;    
	CharTemplate.bCanTakeCover = false;

	CharTemplate.bIsAlien = true;
	CharTemplate.bIsAdvent = false;
	CharTemplate.bIsCivilian = false;
	CharTemplate.bIsPsionic = false;
	CharTemplate.bIsRobotic = false;
	CharTemplate.bIsSoldier = true;
	CharTemplate.bIsMeleeOnly = true;

	CharTemplate.bCanBeTerrorist = false;
	CharTemplate.bCanBeCriticallyWounded = false;
	CharTemplate.bIsAfraidOfFire = true;
	CharTemplate.bCanBeCarried = true;	
	CharTemplate.bCanBeRevived = true;
	CharTemplate.bUsePoolSoldiers = true;
	CharTemplate.bStaffingAllowed = true;
	CharTemplate.bAppearInBase = true;
	CharTemplate.bWearArmorInBase = true;
	CharTemplate.bAllowSpawnFromATT = false;
	CharTemplate.bUsesWillSystem = false;
	CharTemplate.bIsTooBigForArmory = true;

	CharTemplate.ImmuneTypes.AddItem('Mental');

	CharTemplate.Abilities.AddItem('Interact_UseElevator');

	CharTemplate.Abilities.AddItem('Interact_PlantBomb');
	CharTemplate.Abilities.AddItem('Interact_TakeVial');
	CharTemplate.Abilities.AddItem('Interact_StasisTube');
	CharTemplate.Abilities.AddItem('Interact_MarkSupplyCrate');
	CharTemplate.Abilities.AddItem('Interact_ActivateAscensionGate');
	CharTemplate.Abilities.AddItem('Interact_UseElevator');
	CharTemplate.Abilities.AddItem('CarryUnit');
	CharTemplate.Abilities.AddItem('PutDownUnit');
	CharTemplate.Abilities.AddItem('Evac');
	CharTemplate.Abilities.AddItem('PlaceEvacZone');
	CharTemplate.Abilities.AddItem('LiftOffAvenger');
	CharTemplate.Abilities.AddItem('Knockout');
	CharTemplate.Abilities.AddItem('KnockoutSelf');
	CharTemplate.Abilities.AddItem('HunkerDown');
	CharTemplate.Abilities.AddItem('DisableConsumeAllPoints');
	CharTemplate.Abilities.AddItem('Revive');

	CharTemplate.ImmuneTypes.AddItem('Obsessed');
	CharTemplate.ImmuneTypes.AddItem('Shattered');
	CharTemplate.ImmuneTypes.AddItem('Panicked');

	CharTemplate.bAllowSpawnFromATT = false;
	CharTemplate.bAllowRushCam = false;

	CharTemplate.strScamperBT = "ScamperRoot_MeleeNoCover";

	CharTemplate.strTargetIconImage = class'UIUtilities_Image'.const.TargetIcon_Alien;

	return CharTemplate;
}