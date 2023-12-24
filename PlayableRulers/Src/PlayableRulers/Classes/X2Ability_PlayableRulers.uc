class X2Ability_PlayableRulers extends X2Ability config(GameData_SoldierSkills);

//* ======================================================
//* Viper King
//* ======================================================

// Frostbite
var config bool PA_ViperKing_FrostBite_ConsumeAllActionPointCost;
var config int PA_ViperKing_FrostBite_AP_Cost;
var config int PA_ViperKing_FrostBite_Cooldown;
var config bool PA_ViperKing_FrostBite_RestrictToWeaponRange;
var config bool PA_ViperKing_FrostBite_ExcludeSelfAsTargetIfWithinRadius;
var config int PA_ViperKing_FrostBite_MinRulerFreezeDuration;
var config int PA_ViperKing_FrostBite_MaxRulerFreezeDuration;

//* Bind ability

var config WeaponDamageValue PA_ViperKing_Bind_BaseDamage;

var config bool PA_ViperKing_DontDisplay_Bind_InSummary;
var config bool PA_ViperKing_DoesBind_ConsumeAllActionPointCost;

// Exlusion rules
var config bool PA_ViperKing_Does_Bind_ExcludeRobot;
var config bool PA_ViperKing_Does_Bind_ExcludeAlien;
var config bool PA_ViperKing_Does_Bind_ExcludeFriendly;

var config int PA_ViperKing_Bind_ActionPointCost;
var config int PA_ViperKing_Bind_Cooldown;
var config int PA_ViperKing_Bind_Range;
var config int PA_ViperKing_Bind_FragileAmount;
var config int PA_ViperKing_Bind_UnconsciousChance;

//* Bind Sustain

var config WeaponDamageValue PA_ViperKing_Bind_SustainDamage;

var config bool PA_ViperKing_DontDisplay_BindSustain_InSummary;
var config bool PA_ViperKing_DoesBindSustain_ConsumeAllActionPointCost;

var config int PA_ViperKing_BindSustain_ActionsPointCost;
var config int PA_KingBindSustained_UnconsciousPercent;

//* Bind end

var config bool PA_ViperKing_DontDisplay_EndBind_InSummary;

var config int PA_ViperKing_EndBind_ActionPointCost;

//* Get over here ability (tongue pull)

var config bool PA_ViperKing_DontDisplay_GetOverHere_InSummary;
var config bool PA_ViperKing_DoesGetOverHere_ConsumeAllActionPointCost;

var config bool PA_ViperKing_Does_GetOverHere_ExcludeRobot; // true
var config bool PA_ViperKing_Does_GetOverHere_ExcludeDead; // true
var config bool PA_ViperKing_Does_GetOverHere_ExcludeFriendly; // true

var config int PA_ViperKing_GetOverHere_ActionPointCost;
var config int PA_ViperKing_GetOverHere_MinRange;
var config int PA_ViperKing_GetOverHere_MaxRange;
var config int PA_ViperKing_GetOverHere_Cooldown;
var config int PA_ViperKing_GetOverHere_ActionPointAdded; // 1

var name PA_KingBindSustainedEffectName;
var name PA_KingBindAbilityName;
var privatewrite name PA_KingBlazingPinionsStage2AbilityName;

//* ======================================================
//* Archon King
//* ======================================================

//* Blazing Pinions

var config bool PA_ArchonKing_Does_BlazingPinions_ConsumeAllActionPointCost; // false
var config bool PA_ArchonKing_Does_BlazingPinions_ExcludeCivilians; // true

var config int PA_ArchonKing_BlazingPinions_AbilityPointCost; // 1
var config int PA_ArchonKing_BlazingPinions_Cooldown;
var config int PA_ArchonKing_BlazingPinions_TargetRadius;
var config int PA_ArchonKing_BlazingPinions_Range;
var config int PA_ArchonKing_BlazingPinions_NumberOfTargets;
var config int PA_ArchonKing_BlazingPinions_EnvDamage;

var const config int PA_ArchonKing_BlazingPinions_MaxNumberOfDesorient;
var const config int PA_ArchonKing_BlazingPinions_MaxNumberOfStun;
var const config int PA_ArchonKing_BlazingPinions_MaxNumberOfUnconscious;

var config float PA_ArchonKing_BlazingPinions_ImpactRadius;

//* ======================================================
//* Berserker Queen
//* ======================================================

//* Punch

var config bool PA_BerserkerQueen_Punch_ConsumeAllActionPointCost;
var config int PA_BerserkerQueen_Punch_ActionPointCost;
var name RageTriggeredEffectName;

//* Quake

var config WeaponDamageValue PA_BerserkerQueen_Quake_Damage;

var config bool PA_BerserkerQueen_DontDisplay_Quake_InSummary;

var config bool PA_BerserkerQueen_Quake_ConsumeAllActionPointCost;

var config int PA_BerserkerQueen_Quake_ActionPointCost;
var config int PA_BerserkerQueen_Quake_Cooldown;

var config float PA_BerserkerQueen_Quake_Damage_Radius;
var config float PA_BerserkerQueen_Quake_Knockback_Distance;

// Number of hit, min / max, max number of enemy with status effect

var config int PA_BerserkerQueen_Quake_MinHitDesoriented;
var config int PA_BerserkerQueen_Quake_MaxHitDesoriented;
var config int PA_BerserkerQueen_Quake_MaxEnemyDesoriented_Allowed;

var config int PA_BerserkerQueen_Quake_MinHitStunned;
var config int PA_BerserkerQueen_Quake_MaxHitStunned;
var config int PA_BerserkerQueen_Quake_MaxEnemyStun_Allowed;

var config int PA_BerserkerQueen_Quake_MinHitUnconscious;
var config int PA_BerserkerQueen_Quake_MaxHitUnconscious;
var config int PA_BerserkerQueen_Quake_MaxEnemyUnconscious_Allowed;

//* Faith Breaker

var config bool PA_BerserkerQueen_FaithBreaker_ConsumeAllActionPointCost;

// Exclude rules

var config bool PA_BerserkerQueen_DoesFaithBreakerExcludeAlive; //false
var config bool PA_BerserkerQueen_DoesFaithBreakerExcludeAlien; //true
var config bool PA_BerserkerQueen_DoesFaithBreakerExcludeDead; //true
var config bool PA_BerserkerQueen_DoesFaithBreakerExcludeFriendly; //true
var config bool PA_BerserkerQueen_DoesFaithBreakerExcludeHostile; //false
var config bool PA_BerserkerQueen_DoesFaithBreakerExcludeAFriendly_MindControlled; //false
var config bool PA_BerserkerQueen_DoesFaithBreakerExcludeRobot; //true


var config int PA_BerserkerQueen_FaithBreaker_ActionPointCost;
var config int PA_BerserkerQueen_FaithBreaker_AddedChances_PerHP_Lost;
var config int PA_BerserkerQueen_FaithBreaker_Cooldown;

//* =================================
//* Mind control
//* =================================

//* Viper King

var config bool PA_ViperKing_DontDisplay_MindControl_InSummary;

var name PA_Viper_MC_Test;

var config bool PA_ViperKing_MC_DisplayIn_UI_Tooltip;
var config bool PA_ViperKing_MC_DisplayIn_TacText;
var config bool PA_Is_ViperKing_MC_Infinite;

var config int PA_Viper_MC_Chance;
var config int PA_Viper_MC_Per_Pod;
var config int PA_Viper_MC_MaxNumTurn;

//* Archon King

var config bool PA_ArchonKing_DontDisplay_MindControl_InSummary;

var name PA_Archon_MC_Test;

var config bool PA_ArchonKing_MC_DisplayIn_UI_Tooltip;
var config bool PA_ArchonKing_MC_DisplayIn_TacText;
var config bool PA_Is_ArchonKing_MC_Infinite;

var config int PA_Archon_MC_Chance;
var config int PA_Archon_MC_Per_Pod;
var config int PA_Archon_MC_MaxNumTurn;

//* Berserker Queen

var config bool PA_BerserkerQueen_DontDisplay_MindControl_InSummary;

var name PA_Muton_MC_Test;

var config bool PA_BerserkerQueen_MC_DisplayIn_UI_Tooltip;
var config bool PA_BerserkerQueen_MC_DisplayIn_TacText;
var config bool PA_Is_BerserkerQueen_MC_Infinite;

var config int PA_Muton_MC_Chance;
var config int PA_Muton_MC_Per_Pod;
var config int PA_Muton_MC_MaxNumTurn;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;

	// Ruler reaction
	Templates.AddItem(Create_PA_RulersReactions_Ability());

	// Viper King
	Templates.AddItem(Create_PA_GetOverHereAbility());
	Templates.AddItem(Create_PA_BindAbility());
	Templates.AddItem(Create_PA_BindSustainedAbility());
	Templates.AddItem(Create_PA_EndBindAbility());

	// Archon King
	Templates.AddItem(Create_PA_BlazingPinionsStage1Ability());
	Templates.AddItem(Create_PA_BlazingPinionsStage2Ability());

	// Berserker Queen
	Templates.AddItem(Create_PA_QuakeAbility());
	Templates.AddItem(Create_PA_FaithBreaker());
	Templates.AddItem(Create_PA_QueenDevastatingPunchAbility());
	Templates.AddItem(Create_PA_BerserkerQueenSlash_Ability());


	// Mind control
	Templates.AddItem(Create_PA_Muton_MC_Ability());
	Templates.AddItem(Create_PA_Archon_MC_Ability());
	Templates.AddItem(Create_PA_Viper_MC_Ability());


	return Templates;
}

// Because I use BattleLord as a ref, need either Skirmisher Rebalance or I need to copy the fixes here (with permission)
static function X2AbilityTemplate Create_PA_RulersReactions_Ability()
{
	local X2AbilityTemplate				Template;
	local X2AbilityCharges				Charges;
	local X2AbilityCost_Charges			ChargeCost;
	local X2AbilityCost_ActionPoints	ActionPointCost;
	local X2Effect_Battlelord			BattlelordEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'PA_RulersReactions');

	Template.IconImage = "img:///UILibrary_XPACK_Common.PerkIcons.UIPerk_Battlelord";
	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_AlwaysShow;
	Template.Hostility = eHostility_Neutral;

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	if (default.DoesRulerReactionHaveCharges)
	{
		Charges = new class'X2AbilityCharges';
		Charges.InitialCharges = 1;
		Template.AbilityCharges = Charges;

		ChargeCost = new class'X2AbilityCost_Charges';
		ChargeCost.NumCharges = 1;
		Template.AbilityCosts.AddItem(ChargeCost);
	}

	if (default.DoesRulerReactionHaveActionPointCost)
	{
		ActionPointCost = new class'X2AbilityCost_ActionPoints';
		ActionPointCost.iNumPoints = 1;
		ActionPointCost.bConsumeAllPoints = true;
		ActionPointCost.AllowedTypes.RemoveItem(class'X2CharacterTemplateManager'.default.SkirmisherInterruptActionPoint);
		Template.AbilityCosts.AddItem(ActionPointCost);
	}

	BattlelordEffect = new class'X2Effect_Battlelord';
	BattlelordEffect.BuildPersistentEffect(1, false, , , eGameRule_PlayerTurnBegin);
	BattlelordEffect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.LocLongDescription, Template.IconImage, true, , Template.AbilitySourceName);
	Template.AddTargetEffect(BattlelordEffect);

	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AddShooterEffectExclusions();

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.bSkipFireAction = true;
	Template.bShowActivation = true;
//BEGIN AUTOGENERATED CODE: Template Overrides 'Battlelord'
	Template.AbilityConfirmSound = "Battlelord_Activate";
	Template.ActivationSpeech = 'Battlelord';
//END AUTOGENERATED CODE: Template Overrides 'Battlelord'

	return Template;
}

//* ======================================================
//* Viper King Ability
//* ======================================================

static function X2AbilityTemplate Create_PA_GetOverHereAbility()
{
	local X2AbilityTemplate                 Template;
	local X2AbilityCost_ActionPoints        ActionPointCost;
	local X2Condition_UnitProperty          UnitPropertyCondition;
	local X2Condition_UnitEffects           UnitEffectsCondition;
	local X2AbilityTrigger_PlayerInput      InputTrigger;
	local X2AbilityCooldown					Cooldown;
	local X2Condition_Visibility            TargetVisibilityCondition;
	local X2Condition_UnblockedNeighborTile UnblockedNeighborTileCondition;
	local X2AbilityTarget_Single            SingleTarget;
	local X2AbilityToHitCalc_StandardAim    StandardAim;
	local X2Effect_GetOverHere              GetOverHereEffect;
	local X2Effect_ImmediateAbilityActivation BindAbilityEffect;
	local X2Effect_GrantActionPoints        ActionPointsEffect;
	local array<name> SkipExclusions;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'PA_KingGetOverHere');
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_viper_getoverhere";

	Template.AbilitySourceName = 'eAbilitySource_Standard';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_AlwaysShow;
	Template.bDontDisplayInAbilitySummary = default.PA_ViperKing_DontDisplay_GetOverHere_InSummary;

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = default.PA_ViperKing_GetOverHere_ActionPointCost;
	ActionPointCost.bConsumeAllPoints = default.PA_ViperKing_DoesGetOverHere_ConsumeAllActionPointCost;
	Template.AbilityCosts.AddItem(ActionPointCost);

	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = default.PA_ViperKing_GetOverHere_Cooldown;
	Template.AbilityCooldown = Cooldown;

	// Source cannot be dead
	UnitPropertyCondition = new class'X2Condition_UnitProperty';
	UnitPropertyCondition.ExcludeDead = true;
	Template.AbilityShooterConditions.AddItem(UnitPropertyCondition);

	// GetOverHere may be used if disoriented, burning, or confused.  Not bound though.
	SkipExclusions.AddItem(class'X2AbilityTemplateManager'.default.DisorientedName);
	SkipExclusions.AddItem(class'X2StatusEffects'.default.BurningName);
	SkipExclusions.AddItem(class'X2AbilityTemplateManager'.default.ConfusedName);
	Template.AddShooterEffectExclusions(SkipExclusions);

	// There must be a free tile around the source unit
	UnblockedNeighborTileCondition = new class'X2Condition_UnblockedNeighborTile';
	template.AbilityShooterConditions.AddItem(UnblockedNeighborTileCondition);

	// The Target must be alive and a humanoid
	UnitPropertyCondition = new class'X2Condition_UnitProperty';
	UnitPropertyCondition.ExcludeDead = true;
	UnitPropertyCondition.ExcludeRobotic = default.PA_ViperKing_Does_GetOverHere_ExcludeRobot;
	UnitPropertyCondition.ExcludeAlien = default.PA_ViperKing_Does_GetOverHere_ExcludeDead;
	UnitPropertyCondition.ExcludeFriendlyToSource = default.PA_ViperKing_Does_GetOverHere_ExcludeFriendly;
	UnitPropertyCondition.RequireWithinMinRange = true;
	UnitPropertyCondition.WithinMinRange = default.PA_ViperKing_GetOverHere_MinRange;
	UnitPropertyCondition.RequireWithinRange = true;
	UnitPropertyCondition.WithinRange = default.PA_ViperKing_GetOverHere_MaxRange;
	Template.AbilityTargetConditions.AddItem(UnitPropertyCondition);

	// This Target cannot already be bound
	UnitEffectsCondition = new class'X2Condition_UnitEffects';
	UnitEffectsCondition.AddExcludeEffect(class'X2AbilityTemplateManager'.default.BoundName, 'AA_UnitIsBound');
	UnitEffectsCondition.AddExcludeEffect(class'X2Ability_CarryUnit'.default.CarryUnitEffectName, 'AA_CarryingUnit');
	UnitEffectsCondition.AddExcludeEffect(class'X2Effect_PersistentVoidConduit'.default.EffectName, 'AA_UnitIsBound');
	Template.AbilityTargetConditions.AddItem(UnitEffectsCondition);

	// Target must be visible and not in high cover
	TargetVisibilityCondition = new class'X2Condition_Visibility';
	TargetVisibilityCondition.bRequireGameplayVisible = true;
	Template.AbilityTargetConditions.AddItem(TargetVisibilityCondition);

	SingleTarget = new class'X2AbilityTarget_Single';
	Template.AbilityTargetStyle = SingleTarget;

	InputTrigger = new class'X2AbilityTrigger_PlayerInput';
	Template.AbilityTriggers.AddItem(InputTrigger);

	// This will attack using the standard aim
	StandardAim = new class'X2AbilityToHitCalc_StandardAim';
	Template.AbilityToHitCalc = StandardAim;

	// Apply the effect that pulls the unit to the Viper
	GetOverHereEffect = new class'X2Effect_GetOverHere';
	Template.AddTargetEffect(GetOverHereEffect);

	// Successful GetOverHere leads to a bind
	BindAbilityEffect = new class 'X2Effect_ImmediateAbilityActivation';
	BindAbilityEffect.BuildPersistentEffect(1, false, true, , eGameRule_PlayerTurnBegin);
	BindAbilityEffect.EffectName = 'ImmediateBind';
	BindAbilityEffect.AbilityName = default.PA_KingBindAbilityName;
	BindAbilityEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, true, , Template.AbilitySourceName);
	Template.AddTargetEffect(BindAbilityEffect);

	// The shooter gets a free point that can be used bind
	ActionPointsEffect = new class'X2Effect_GrantActionPoints';
	ActionPointsEffect.NumActionPoints = default.PA_ViperKing_GetOverHere_ActionPointAdded;
	ActionPointsEffect.PointType = class'X2CharacterTemplateManager'.default.GOHBindActionPoint;
	Template.AddShooterEffect(ActionPointsEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = class'X2Ability_Viper'.static.GetOverhere_BuildVisualization;
	Template.CinescriptCameraType = "Viper_StranglePull";

	// This action is considered 'hostile' and can be interrupted!
	Template.Hostility = eHostility_Offensive;
	Template.BuildInterruptGameStateFn = TypicalAbility_BuildInterruptGameState;

	class'X2Ability_DLC_Day60AlienRulers'.static.RemoveMimicBeaconsFromTargets(Template);

	Template.LostSpawnIncreasePerUse = class'X2AbilityTemplateManager'.default.MeleeLostSpawnIncreasePerUse;
	Template.bFrameEvenWhenUnitIsHidden = true;

	return Template;
}


static function X2AbilityTemplate Create_PA_BindSustainedAbility()
{
	local X2AbilityTemplate                 Template;
	local X2AbilityCost_ActionPoints        ActionPointCost;
	local X2AbilityTrigger_PlayerInput		InputTrigger;
	local X2Condition_UnitEffectsWithAbilitySource UnitEffectsCondition;
	local X2AbilityTarget_Single            SingleTarget;
	local X2Effect_ApplyWeaponDamage        PhysicalDamageEffect;
	local X2Effect_Persistent               UnconsciousEffect;
	local X2Condition_UnitEffects           UnconsciousEffectsCondition;
	local X2Effect_RemoveEffects            RemoveEffects;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'KingBindSustained');
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_viper_bind";

	Template.bDontDisplayInAbilitySummary = true;
	Template.AbilitySourceName = 'eAbilitySource_Standard';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Offensive;

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	ActionPointCost.bConsumeAllPoints = false;
	Template.AbilityCosts.AddItem(ActionPointCost);

	Template.AbilityToHitCalc = default.DeadEye;

	// This ability is only valid if this unit is currently binding the target
	UnitEffectsCondition = new class'X2Condition_UnitEffectsWithAbilitySource';
	UnitEffectsCondition.AddRequireEffect(default.PA_KingBindSustainedEffectName, 'AA_UnitIsBound');
	Template.AbilityTargetConditions.AddItem(UnitEffectsCondition);

	// May only target a single unit
	SingleTarget = new class'X2AbilityTarget_Single';
	Template.AbilityTargetStyle = SingleTarget;

	InputTrigger = new class'X2AbilityTrigger_PlayerInput';
	Template.AbilityTriggers.AddItem(InputTrigger);

	// Chance the target becomes unconscious. If the target becomes unconscious then don't do the damage
	// but remove the sustained effect
	UnconsciousEffect = class'X2StatusEffects'.static.CreateUnconsciousStatusEffect();
	UnconsciousEffect.ApplyChance = default.PA_ViperKing_Bind_UnconsciousChance;
	Template.AddTargetEffect(UnconsciousEffect);

	UnconsciousEffectsCondition = new class'X2Condition_UnitEffects';
	UnconsciousEffectsCondition.AddRequireEffect(class'X2StatusEffects'.default.UnconsciousName, 'AA_UnitIsUnconscious');

	// Remove the bind/bound effects from the Target
	RemoveEffects = new class'X2Effect_RemoveEffects';
	RemoveEffects.EffectNamesToRemove.AddItem(default.PA_KingBindSustainedEffectName);
	RemoveEffects.TargetConditions.AddItem(UnconsciousEffectsCondition);
	Template.AddTargetEffect(RemoveEffects);

	UnconsciousEffectsCondition = new class'X2Condition_UnitEffects';
	UnconsciousEffectsCondition.AddExcludeEffect(class'X2StatusEffects'.default.UnconsciousName, 'AA_UnitIsUnconscious');

	// While sustained this ability causes damage by crushing
	PhysicalDamageEffect = new class'X2Effect_ApplyWeaponDamage';
	PhysicalDamageEffect.EffectDamageValue = default.PA_ViperKing_Bind_SustainDamage;
	PhysicalDamageEffect.DamageTypes.AddItem('ViperCrush');
	PhysicalDamageEffect.EffectDamageValue.DamageType = 'Melee';
	PhysicalDamageEffect.TargetConditions.AddItem(UnconsciousEffectsCondition);
	Template.AddTargetEffect(PhysicalDamageEffect);

	Template.bSkipFireAction = true;
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = PA_BindSustained_BuildVisualization;

//BEGIN AUTOGENERATED CODE: Template Overrides 'KingBindSustained'
	Template.bFrameEvenWhenUnitIsHidden = true;
//END AUTOGENERATED CODE: Template Overrides 'KingBindSustained'

	return Template;
}

// Ability only exists for player-controlled Vipers to end their bind ability.  Not actually used by the AI.
static function X2AbilityTemplate Create_PA_EndBindAbility()
{
	local X2AbilityTemplate                 Template;
	local X2AbilityCost_ActionPoints        ActionPointCost;
	local X2Condition_UnitEffectsWithAbilitySource UnitEffectsCondition;
	local X2AbilityTrigger_PlayerInput      InputTrigger;
	local X2AbilityTarget_Single            SingleTarget;
	local X2Effect_RemoveEffects            RemoveEffects;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'KingEndBind');
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_viper_bind";

	Template.AbilitySourceName = 'eAbilitySource_Standard';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_ShowIfAvailable;
	Template.Hostility = eHostility_Offensive;

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.AllowedTypes.Length = 0;        //  clear default allowances
	ActionPointCost.AllowedTypes.AddItem(class'X2CharacterTemplateManager'.default.EndBindActionPoint);
	ActionPointCost.iNumPoints = 1;
	Template.AbilityCosts.AddItem(ActionPointCost);

	Template.AbilityToHitCalc = default.DeadEye;

	// This ability is only valid if this unit is currently binding the target
	UnitEffectsCondition = new class'X2Condition_UnitEffectsWithAbilitySource';
	UnitEffectsCondition.AddRequireEffect(default.PA_KingBindSustainedEffectName, 'AA_UnitIsBound');
	Template.AbilityTargetConditions.AddItem(UnitEffectsCondition);

	SingleTarget = new class'X2AbilityTarget_Single';
	Template.AbilityTargetStyle = SingleTarget;

	InputTrigger = new class'X2AbilityTrigger_PlayerInput';
	Template.AbilityTriggers.AddItem(InputTrigger);

	// Remove the bind/bound effects from the Target
	RemoveEffects = new class'X2Effect_RemoveEffects';
	RemoveEffects.EffectNamesToRemove.AddItem(default.PA_KingBindSustainedEffectName);
	Template.AddTargetEffect(RemoveEffects);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = PA_BindEnd_BuildVisualization;
//BEGIN AUTOGENERATED CODE: Template Overrides 'KingEndBind'
	Template.bFrameEvenWhenUnitIsHidden = true;
//END AUTOGENERATED CODE: Template Overrides 'KingEndBind'

	return Template;
}

static function X2AbilityTemplate Create_PA_ViperKing_FrostbiteAbility()
{
	local X2AbilityTemplate                 Template;
	local X2AbilityCost_ActionPoints        ActionPointCost;
	local X2AbilityTarget_Cursor            CursorTarget;
	local X2AbilityMultiTarget_Radius       RadiusMultiTarget;
	local X2Condition_UnitProperty          UnitPropertyCondition;
	local X2AbilityTrigger_PlayerInput      InputTrigger;
	local X2AbilityCooldown                 Cooldown;
	local X2Effect_ApplyWeaponDamage        WeaponEffect;
	local array<name> SkipExclusions;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'PA_ViperKing_Frostbite');
	Template.bDontDisplayInAbilitySummary = false;
	Template.IconImage = "img:///UILibrary_DLC2Images.UIPerk_freezingbreath";

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = default.PA_ViperKing_FrostBite_AP_Cost;
	ActionPointCost.bConsumeAllPoints = default.PA_ViperKing_FrostBite_ConsumeAllActionPointCost;
	Template.AbilityCosts.AddItem(ActionPointCost);

	Template.AbilityToHitCalc = default.DeadEye;

	WeaponEffect = new class'X2Effect_ApplyWeaponDamage';
	WeaponEffect.DamageTypes.AddItem('Frost');
	Template.AddMultiTargetEffect(WeaponEffect);
	Template.AddMultiTargetEffect(class'X2Effect_DLC_Day60Freeze'.static.CreateFreezeEffect(default.PA_ViperKing_FrostBite_MinRulerFreezeDuration, default.PA_ViperKing_FrostBite_MaxRulerFreezeDuration));
	Template.AddMultiTargetEffect(class'X2Effect_DLC_Day60Freeze'.static.CreateFreezeRemoveEffects());

	CursorTarget = new class'X2AbilityTarget_Cursor';
	CursorTarget.bRestrictToWeaponRange = default.PA_ViperKing_FrostBite_RestrictToWeaponRange;
	Template.AbilityTargetStyle = CursorTarget;

	RadiusMultiTarget = new class'X2AbilityMultiTarget_Radius';
	RadiusMultiTarget.bUseWeaponRadius = true;
	RadiusMultiTarget.bExcludeSelfAsTargetIfWithinRadius = default.PA_ViperKing_FrostBite_ExcludeSelfAsTargetIfWithinRadius;
	Template.AbilityMultiTargetStyle = RadiusMultiTarget;

	UnitPropertyCondition = new class'X2Condition_UnitProperty';
	UnitPropertyCondition.ExcludeDead = true;
	Template.AbilityShooterConditions.AddItem(UnitPropertyCondition);

	// PA_ViperKing_FrostBite may be used if disoriented, burning, or confused.  Not bound though.
	SkipExclusions.AddItem(class'X2AbilityTemplateManager'.default.DisorientedName);
	SkipExclusions.AddItem(class'X2StatusEffects'.default.BurningName);
	SkipExclusions.AddItem(class'X2AbilityTemplateManager'.default.ConfusedName);
	Template.AddShooterEffectExclusions(SkipExclusions);

	InputTrigger = new class'X2AbilityTrigger_PlayerInput';
	Template.AbilityTriggers.AddItem(InputTrigger);

	Template.AbilitySourceName = 'eAbilitySource_Standard';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_AlwaysShow;
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_viper_frostbite";
	Template.bUseAmmoAsChargesForHUD = true;

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.CinescriptCameraType = "Viper_PoisonSpit";

	Template.TargetingMethod = class'X2TargetingMethod_ViperSpit';

	// Cooldown on the ability
	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = default.PA_ViperKing_FrostBite_Cooldown;
	Template.AbilityCooldown = Cooldown;

	// This action is considered 'hostile' and can be interrupted!
	Template.Hostility = eHostility_Offensive;
	Template.BuildInterruptGameStateFn = TypicalAbility_BuildInterruptGameState;

	Template.LostSpawnIncreasePerUse = class'X2AbilityTemplateManager'.default.StandardShotLostSpawnIncreasePerUse;
//BEGIN AUTOGENERATED CODE: Template Overrides 'Frostbite'
	Template.bFrameEvenWhenUnitIsHidden = true;
//END AUTOGENERATED CODE: Template Overrides 'Frostbite'

	return Template;
}


static function X2AbilityTemplate Create_PA_BindAbility()
{
	local X2AbilityTemplate                 Template;
	local X2AbilityCost_ActionPoints        ActionPointCost;
	local X2Condition_UnitProperty          UnitPropertyCondition;
	local X2Condition_UnitEffects           UnitEffectsCondition;
	local X2AbilityTrigger_PlayerInput      InputTrigger;
	local X2AbilityCooldown                 Cooldown;
	local X2Condition_Visibility            TargetVisibilityCondition;
	local X2AbilityTarget_Single            SingleTarget;
	local X2Effect_Persistent			    BoundEffect;
	local X2Effect_ViperBindSustained       SustainedEffect;
	local X2Effect_ApplyWeaponDamage        PhysicalDamageEffect;
	local X2Effect_ApplyDirectionalWorldDamage EnvironmentDamageEffect;
	local array<name> SkipExclusions;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'PA_KingBind');
	Template.IconImage = "img:///UILibrary_DLC2Images.PerkIcons.UIPerk_viper_choke";

	Template.AbilitySourceName = 'eAbilitySource_Standard';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_AlwaysShow;
	Template.bDontDisplayInAbilitySummary = default.PA_ViperKing_DontDisplay_Bind_InSummary;

	Template.AdditionalAbilities.AddItem('PA_KingBindSustained');
	Template.AdditionalAbilities.AddItem('PA_KingEndBind');

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = default.PA_ViperKing_Bind_ActionPointCost;
	ActionPointCost.bConsumeAllPoints = default.PA_ViperKing_DoesBind_ConsumeAllActionPointCost;
	ActionPointCost.AllowedTypes.AddItem(class'X2CharacterTemplateManager'.default.GOHBindActionPoint);
	Template.AbilityCosts.AddItem(ActionPointCost);

	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = default.PA_ViperKing_Bind_Cooldown;
	Template.AbilityCooldown = Cooldown;

	Template.AbilityToHitCalc = new class'X2AbilityToHitCalc_DeadEye';

	// Source cannot be dead
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	// Bind may be used if disoriented, burning, or confused.  Not if already bound though.
	SkipExclusions.AddItem(class'X2AbilityTemplateManager'.default.DisorientedName);
	SkipExclusions.AddItem(class'X2StatusEffects'.default.BurningName);
	SkipExclusions.AddItem(class'X2AbilityTemplateManager'.default.ConfusedName);
	Template.AddShooterEffectExclusions(SkipExclusions);

	// The Target must be alive and a humanoid
	UnitPropertyCondition = new class'X2Condition_UnitProperty';
	UnitPropertyCondition.ExcludeDead = true;
	UnitPropertyCondition.ExcludeRobotic = default.PA_ViperKing_Does_Bind_ExcludeRobot; // true
	UnitPropertyCondition.ExcludeAlien = default.PA_ViperKing_Does_Bind_ExcludeAlien; // true
	UnitPropertyCondition.ExcludeFriendlyToSource = default.PA_ViperKing_Does_Bind_ExcludeFriendly; // true
	UnitPropertyCondition.RequireWithinRange = true;
	UnitPropertyCondition.WithinRange = default.PA_ViperKing_Bind_Range;
	Template.AbilityTargetConditions.AddItem(UnitPropertyCondition);

	// This Target cannot already be bound
	UnitEffectsCondition = new class'X2Condition_UnitEffects';
	UnitEffectsCondition.AddExcludeEffect(class'X2AbilityTemplateManager'.default.BoundName, 'AA_UnitIsBound');
	UnitEffectsCondition.AddExcludeEffect(class'X2Ability_CarryUnit'.default.CarryUnitEffectName, 'AA_CarryingUnit');
	UnitEffectsCondition.AddExcludeEffect(class'X2Effect_PersistentVoidConduit'.default.EffectName, 'AA_UnitIsBound');
	Template.AbilityTargetConditions.AddItem(UnitEffectsCondition);

	SingleTarget = new class'X2AbilityTarget_Single';
	Template.AbilityTargetStyle = SingleTarget;

	TargetVisibilityCondition = new class'X2Condition_Visibility';
	TargetVisibilityCondition.bRequireGameplayVisible = true;
	TargetVisibilityCondition.bCannotPeek = true;
	TargetVisibilityCondition.bRequireNotMatchCoverType = true;
	TargetVisibilityCondition.TargetCover = CT_Standing;
	Template.AbilityTargetConditions.AddItem(TargetVisibilityCondition);

	InputTrigger = new class'X2AbilityTrigger_PlayerInput';
	Template.AbilityTriggers.AddItem(InputTrigger);

	// Add to the target the sustained bind effect
	SustainedEffect = new class'X2Effect_ViperBindSustained';
	SustainedEffect.FragileAmount = default.PA_ViperKing_Bind_FragileAmount;
	SustainedEffect.EffectName = default.PA_KingBindSustainedEffectName;
	SustainedEffect.bRemoveWhenTargetDies = true;
	SustainedEffect.EffectRemovedSourceVisualizationFn = PA_BindEndSource_BuildVisualization;
	SustainedEffect.EffectRemovedVisualizationFn = PA_BindEndTarget_BuildVisualization;
	SustainedEffect.BuildPersistentEffect(1, true, true, false, eGameRule_PlayerTurnBegin);
	SustainedEffect.bBringRemoveVisualizationForward = true;
	SustainedEffect.RegisterAdditionalEventsLikeImpair.AddItem('AffectedByStasis');
	SustainedEffect.RegisterAdditionalEventsLikeImpair.AddItem('StunStrikeActivated');

	SustainedEffect.bCanTickEveryAction = true;

	// Since this will also be a sustained ability, only put the bound status on the target
	// for one round
	BoundEffect = class'X2StatusEffects'.static.CreateBoundStatusEffect(1, true, true);
	BoundEffect.CustomIdleOverrideAnim = 'NO_BindLoop';
	Template.AddTargetEffect(BoundEffect);
	// This target effect needs to be set as a child on the sustain effect
	SustainedEffect.EffectsToRemoveFromTarget.AddItem(BoundEffect.EffectName);

	// The shooter is also bound
	BoundEffect = class'X2StatusEffects'.static.CreateBoundStatusEffect(1, true, false);
	BoundEffect.CustomIdleOverrideAnim = 'NO_BindLoop';
	Template.AddShooterEffect(BoundEffect);
	// This source effect needs to be set as a child on the sustain effect
	SustainedEffect.EffectsToRemoveFromSource.AddItem(BoundEffect.EffectName);

	// All child effects to the sustained effect have been added, submit
	Template.AddTargetEffect(SustainedEffect);

	// Ability causes damage by crushing
	PhysicalDamageEffect = new class'X2Effect_ApplyWeaponDamage';
	PhysicalDamageEffect.EffectDamageValue = default.PA_ViperKing_Bind_BaseDamage;
	PhysicalDamageEffect.DamageTypes.AddItem('ViperCrush');
	PhysicalDamageEffect.EffectDamageValue.DamageType = 'Melee';
	Template.AddTargetEffect(PhysicalDamageEffect);

	EnvironmentDamageEffect = new class 'X2Effect_ApplyDirectionalWorldDamage';
	EnvironmentDamageEffect.DamageTypeTemplateName = 'Melee';
	EnvironmentDamageEffect.EnvironmentalDamageAmount = 30;
	EnvironmentDamageEffect.PlusNumZTiles = 1;
	EnvironmentDamageEffect.bApplyToWorldOnMiss = false;
	EnvironmentDamageEffect.bHitSourceTile = true;
	Template.AddTargetEffect(EnvironmentDamageEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = class'X2Ability_Viper'.static.Bind_BuildVisualization;
	Template.BuildAffectedVisualizationSyncFn = class'X2Ability_Viper'.static.BindUnit_BuildAffectedVisualization;
	Template.BuildInterruptGameStateFn = TypicalAbility_BuildInterruptGameState;

	Template.CinescriptCameraType = "Viper_Bind";

	class'X2Ability_DLC_Day60AlienRulers'.static.RemoveMimicBeaconsFromTargets(Template);

	Template.LostSpawnIncreasePerUse = class'X2AbilityTemplateManager'.default.MeleeLostSpawnIncreasePerUse;
	Template.bFrameEvenWhenUnitIsHidden = true;

	return Template;
}

//* ======================================================
//* Archon Ruler Ability
//* ======================================================

static function X2DataTemplate Create_PA_BlazingPinionsStage1Ability()
{
	local X2AbilityTemplate Template;
	local X2AbilityCost_ActionPoints ActionPointCost;
	local X2AbilityMultiTarget_BlazingPinions BlazingPinionsMultiTarget;
	local X2AbilityTarget_Cursor CursorTarget;
	local X2Condition_UnitProperty UnitProperty;
	local X2Effect_DelayedAbilityActivation BlazingPinionsStage1DelayEffect;
	local X2Effect_Persistent BlazingPinionsStage1Effect;
	local X2Effect_ApplyBlazingPinionsTargetToWorld BlazingPinionsTargetEffect;
	local X2AbilityCooldown						Cooldown;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'PA_ArchonKingBlazingPinionsStage1');
	Template.IconImage = "img:///UILibrary_DLC2Images.UIPerk_archon_devestate"; // TODO: Change this icon
	Template.Hostility = eHostility_Offensive;
	Template.AbilitySourceName = 'eAbilitySource_Standard';
	Template.bShowActivation = true;
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_AlwaysShow;
	Template.TwoTurnAttackAbility = default.PA_KingBlazingPinionsStage2AbilityName;

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = default.PA_ArchonKing_BlazingPinions_AbilityPointCost;
	ActionPointCost.bConsumeAllPoints = default.PA_ArchonKing_Does_BlazingPinions_ConsumeAllActionPointCost;
	Template.AbilityCosts.AddItem(ActionPointCost);

	// Cooldown on the ability
	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = default.PA_ArchonKing_BlazingPinions_Cooldown;
	Template.AbilityCooldown = Cooldown;

	UnitProperty = new class'X2Condition_UnitProperty';
	UnitProperty.ExcludeDead = true;
	UnitProperty.HasClearanceToMaxZ = true;
	Template.AbilityShooterConditions.AddItem(UnitProperty);

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	Template.TargetingMethod = class'X2TargetingMethod_BlazingPinions';

	// The target locations are enemies
	UnitProperty = new class'X2Condition_UnitProperty';
	UnitProperty.ExcludeFriendlyToSource = true;
	UnitProperty.ExcludeCivilian = default.PA_ArchonKing_Does_BlazingPinions_ExcludeCivilians;
	UnitProperty.ExcludeDead = true;
	UnitProperty.HasClearanceToMaxZ = true;
	UnitProperty.FailOnNonUnits = true;
	Template.AbilityMultiTargetConditions.AddItem(UnitProperty);

	BlazingPinionsMultiTarget = new class'X2AbilityMultiTarget_BlazingPinions';
	BlazingPinionsMultiTarget.fTargetRadius = default.PA_ArchonKing_BlazingPinions_TargetRadius;
	BlazingPinionsMultiTarget.NumTargetsRequired = default.PA_ArchonKing_BlazingPinions_NumberOfTargets;
	Template.AbilityMultiTargetStyle = BlazingPinionsMultiTarget;

	CursorTarget = new class'X2AbilityTarget_Cursor';
	CursorTarget.FixedAbilityRange = default.PA_ArchonKing_BlazingPinions_Range;
	Template.AbilityTargetStyle = CursorTarget;

	//Delayed Effect to cause the second Blazing Pinions stage to occur
	BlazingPinionsStage1DelayEffect = new class 'X2Effect_DelayedAbilityActivation';
	BlazingPinionsStage1DelayEffect.BuildPersistentEffect(1, false, false, , eGameRule_PlayerTurnBegin);
	BlazingPinionsStage1DelayEffect.EffectName = 'BlazingPinionsStage1Delay';
	BlazingPinionsStage1DelayEffect.TriggerEventName = class'X2Ability_Archon'.default.BlazingPinionsStage2TriggerName;
	BlazingPinionsStage1DelayEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, true, , Template.AbilitySourceName);
	BlazingPinionsStage1DelayEffect.bCanTickEveryAction = true;
	BlazingPinionsStage1DelayEffect.bConvertTurnsToActions = false;
	Template.AddShooterEffect(BlazingPinionsStage1DelayEffect);

	// An effect to attach Perk FX to
	BlazingPinionsStage1Effect = new class'X2Effect_Persistent';
	BlazingPinionsStage1Effect.BuildPersistentEffect(1, true, false, true);
	BlazingPinionsStage1Effect.EffectName = class'X2Ability_Archon'.default.BlazingPinionsStage1EffectName;
	Template.AddShooterEffect(BlazingPinionsStage1Effect);

	//  The target FX goes in target array as there will be no single target hit and no side effects of this touching a unit
	BlazingPinionsTargetEffect = new class'X2Effect_ApplyBlazingPinionsTargetToWorld';
	BlazingPinionsTargetEffect.OverrideParticleSystemFill_Name = class'X2Ability_DLC_60ArchonKing'.default.KING_BLAZING_PINIONS_TARGET_PARTICLE_SYSTEM;
	Template.AddShooterEffect(BlazingPinionsTargetEffect);

	Template.ModifyNewContextFn = class'X2Ability_DLC_60ArchonKing'.BlazingPinionsStage1_ModifyActivatedAbilityContext;
	Template.BuildNewGameStateFn = class'X2Ability_DLC_60ArchonKing'.BlazingPinionsStage1_BuildGameState;
	Template.BuildInterruptGameStateFn = TypicalAbility_BuildInterruptGameState;
	Template.BuildVisualizationFn = class'X2Ability_DLC_60ArchonKing'.BlazingPinionsStage1_BuildVisualization;
	Template.BuildAppliedVisualizationSyncFn = class'X2Ability_DLC_60ArchonKing'.BlazingPinionsStage1_BuildVisualizationSync;
	Template.CinescriptCameraType = "Archon_BlazingPinions_Stage1";
//BEGIN AUTOGENERATED CODE: Template Overrides 'ArchonKingBlazingPinionsStage1'
	Template.bFrameEvenWhenUnitIsHidden = true;
//END AUTOGENERATED CODE: Template Overrides 'ArchonKingBlazingPinionsStage1'

	return Template;
}

static function X2DataTemplate Create_PA_BlazingPinionsStage2Ability()
{
	local X2AbilityTemplate Template;
	local X2AbilityTrigger_EventListener DelayedEventListener;
	local X2Effect_RemoveEffects RemoveEffects;
	local X2Effect_ApplyWeaponDamage DamageEffect;
	local X2AbilityMultiTarget_Radius RadMultiTarget;
	local X2AbilityToHitCalc_StatCheck_UnitVsUnit StatContest;
	local X2Effect_Persistent DisorientedEffect;
	local X2Effect_Stunned StunnedEffect;
	local X2Effect_Persistent UnconsciousEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, default.PA_KingBlazingPinionsStage2AbilityName);
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;

	Template.bDontDisplayInAbilitySummary = true;
	Template.AbilityTargetStyle = default.SelfTarget;

	// Multi Target Conditions
	Template.AbilityMultiTargetConditions.AddItem(default.LivingTargetUnitOnlyProperty);

	// This ability fires when the event DelayedExecuteRemoved fires on this unit
	DelayedEventListener = new class'X2AbilityTrigger_EventListener';
	DelayedEventListener.ListenerData.Deferral = ELD_OnStateSubmitted;
	DelayedEventListener.ListenerData.EventID = class'X2Ability_Archon'.default.BlazingPinionsStage2TriggerName;
	DelayedEventListener.ListenerData.Filter = eFilter_Unit;
	DelayedEventListener.ListenerData.EventFn = class'XComGameState_Ability'.static.AbilityTriggerEventListener_BlazingPinions;
	Template.AbilityTriggers.AddItem(DelayedEventListener);

	RemoveEffects = new class'X2Effect_RemoveEffects';
	RemoveEffects.EffectNamesToRemove.AddItem(class'X2Ability_Archon'.default.BlazingPinionsStage1EffectName);
	RemoveEffects.EffectNamesToRemove.AddItem(class'X2Effect_ApplyBlazingPinionsTargetToWorld'.default.EffectName);
	Template.AddShooterEffect(RemoveEffects);

	RadMultiTarget = new class'X2AbilityMultiTarget_Radius';
	RadMultiTarget.fTargetRadius = default.PA_ArchonKing_BlazingPinions_ImpactRadius;

	Template.AbilityMultiTargetStyle = RadMultiTarget;

	// This will be a stat contest
	StatContest = new class'X2AbilityToHitCalc_StatCheck_UnitVsUnit';
	StatContest.AttackerStat = eStat_Strength;
	Template.AbilityToHitCalc = StatContest;

	// On hit effects
	//  Stunned effect for 1 or 2 unblocked hit
	DisorientedEffect = class'X2StatusEffects'.static.CreateDisorientedStatusEffect(, , false);
	DisorientedEffect.MinStatContestResult = 1;
	DisorientedEffect.MaxStatContestResult = 2;
	DisorientedEffect.MultiTargetStatContestInfo.MaxNumberAllowed = default.PA_ArchonKing_BlazingPinions_MaxNumberOfDesorient;
	DisorientedEffect.bRemoveWhenSourceDies = false;
	Template.AddMultiTargetEffect(DisorientedEffect);

	//  Stunned effect for 3 or 4 unblocked hit
	StunnedEffect = class'X2StatusEffects'.static.CreateStunnedStatusEffect(1, 100, false);
	StunnedEffect.MinStatContestResult = 3;
	StunnedEffect.MaxStatContestResult = 4;
	StunnedEffect.MultiTargetStatContestInfo.MaxNumberAllowed = default.PA_ArchonKing_BlazingPinions_MaxNumberOfStun;  // Max number of stunned units allowed from this ability
	StunnedEffect.MultiTargetStatContestInfo.EffectIdxToApplyOnMaxExceeded = 0;    // After the max allowed, targets become disoriented
	StunnedEffect.bRemoveWhenSourceDies = false;
	Template.AddMultiTargetEffect(StunnedEffect);

	//  Unconscious effect for 5 unblocked hits
	UnconsciousEffect = class'X2StatusEffects'.static.CreateUnconsciousStatusEffect();
	UnconsciousEffect.MinStatContestResult = 5;
	UnconsciousEffect.MaxStatContestResult = 0;
	UnconsciousEffect.MultiTargetStatContestInfo.MaxNumberAllowed = default.PA_ArchonKing_BlazingPinions_MaxNumberOfUnconscious;  // Max number of the multitargets that may become unconscious
	UnconsciousEffect.MultiTargetStatContestInfo.EffectIdxToApplyOnMaxExceeded = 1;    // After the max allowed, targets become stunned
	UnconsciousEffect.bRemoveWhenSourceDies = false;
	Template.AddMultiTargetEffect(UnconsciousEffect);

	// The MultiTarget Units are dealt this damage
	DamageEffect = new class'X2Effect_ApplyWeaponDamage';
	DamageEffect.bApplyWorldEffectsForEachTargetLocation = true;
	Template.AddMultiTargetEffect(DamageEffect);

	Template.ModifyNewContextFn = class'X2Ability_DLC_60ArchonKing'.BlazingPinionsStage2_ModifyActivatedAbilityContext;
	Template.BuildNewGameStateFn = class'X2Ability_DLC_60ArchonKing'.BlazingPinionsStage2_BuildGameState;
	Template.BuildVisualizationFn = class'X2Ability_DLC_60ArchonKing'.BlazingPinionsStage2_BuildVisualization;
	Template.CinescriptCameraType = "Archon_BlazingPinions_Stage2";

	Template.LostSpawnIncreasePerUse = class'X2AbilityTemplateManager'.default.HeavyWeaponLostSpawnIncreasePerUse;
//BEGIN AUTOGENERATED CODE: Template Overrides 'ArchonKingBlazingPinionsStage2'
	Template.bFrameEvenWhenUnitIsHidden = true;
//END AUTOGENERATED CODE: Template Overrides 'ArchonKingBlazingPinionsStage2'

	return Template;
}

//! ======================================================
//! Berserker Queen
//! ======================================================

static function X2AbilityTemplate Create_PA_QueenDevastatingPunchAbility(int MovementRangeAdjustment=1)
{
	local X2AbilityTemplate Template;
	local X2AbilityCost_ActionPoints ActionPointCost;
	local X2AbilityToHitCalc_StandardMelee MeleeHitCalc;
	local X2Effect_ImmediateAbilityActivation BrainDamageAbilityEffect;
	local X2AbilityTarget_MovingMelee MeleeTarget;
	local X2Effect_Knockback KnockbackEffect;
	local X2Effect_PunchDamage WeaponDamageEffect;
	local array<name> SkipExclusions;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'PA_DevastatingPunch');
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_muton_punch";
	Template.Hostility = eHostility_Offensive;
	Template.AbilitySourceName = 'eAbilitySource_Standard';

	Template.AdditionalAbilities.AddItem(class'X2Ability_Impairing'.default.ImpairingAbilityName);

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = default.PA_BerserkerQueen_Punch_ActionPointCost;
	ActionPointCost.bConsumeAllPoints = default.PA_BerserkerQueen_Punch_ConsumeAllActionPointCost;
	Template.AbilityCosts.AddItem(ActionPointCost);

	MeleeHitCalc = new class'X2AbilityToHitCalc_StandardMelee';
	Template.AbilityToHitCalc = MeleeHitCalc;

	MeleeTarget = new class'X2AbilityTarget_MovingMelee';
	MeleeTarget.MovementRangeAdjustment = MovementRangeAdjustment;
	Template.AbilityTargetStyle = MeleeTarget;
	Template.TargetingMethod = class'X2TargetingMethod_MeleePath';

	Template.AbilityTriggers.AddItem(new class'X2AbilityTrigger_PlayerInput');
	Template.AbilityTriggers.AddItem(new class'X2AbilityTrigger_EndOfMove');

	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);

	// May punch if the unit is burning or disoriented
	SkipExclusions.AddItem(class'X2AbilityTemplateManager'.default.DisorientedName);
	SkipExclusions.AddItem(class'X2StatusEffects'.default.BurningName);
	Template.AddShooterEffectExclusions(SkipExclusions);

	Template.AbilityTargetConditions.AddItem(new class'X2Condition_BerserkerDevastatingPunch');
	Template.AbilityTargetConditions.AddItem(default.MeleeVisibilityCondition);

	WeaponDamageEffect = new class'X2Effect_PunchDamage';
	Template.AddTargetEffect(WeaponDamageEffect);

	//Impairing effects need to come after the damage. This is needed for proper visualization ordering.
	//Effect on a successful melee attack is triggering the BrainDamage Ability
	BrainDamageAbilityEffect = new class 'X2Effect_ImmediateAbilityActivation';
	BrainDamageAbilityEffect.BuildPersistentEffect(1, false, true, , eGameRule_PlayerTurnBegin);
	BrainDamageAbilityEffect.EffectName = 'ImmediateBrainDamage';
	// NOTICE: For now StunLancer, Muton, and Berserker all use this ability. This may change.
	BrainDamageAbilityEffect.AbilityName = class'X2Ability_Impairing'.default.ImpairingAbilityName;
	BrainDamageAbilityEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, true, , Template.AbilitySourceName);
	BrainDamageAbilityEffect.bRemoveWhenTargetDies = true;
	BrainDamageAbilityEffect.VisualizationFn = class'X2Ability_Impairing'.static.ImpairingAbilityEffectTriggeredVisualization;
	Template.AddTargetEffect(BrainDamageAbilityEffect);

	KnockbackEffect = new class'X2Effect_Knockback';
	KnockbackEffect.KnockbackDistance = 5; //Knockback 5 meters
	Template.AddTargetEffect(KnockbackEffect);

	Template.CustomFireAnim = 'FF_Melee';
	Template.bSkipMoveStop = true;
	Template.bFrameEvenWhenUnitIsHidden = true;
	Template.bOverrideMeleeDeath = true;
	Template.BuildNewGameStateFn = TypicalMoveEndAbility_BuildGameState;
	Template.BuildVisualizationFn = DevastatingPunchAbility_BuildVisualization;
	Template.BuildInterruptGameStateFn = TypicalMoveEndAbility_BuildInterruptGameState;
	Template.CinescriptCameraType = "Berserker_DevastatingPunch";

	return Template;
}

function DevastatingPunchAbility_BuildVisualization(XComGameState VisualizeGameState)
{
	local XComGameStateHistory History;
	local XComGameState_Unit SourceState, TargetState;
	local XComGameStateContext_Ability  Context;
	local VisualizationActionMetadata				ActionMetadata;
	local X2Action_PlaySoundAndFlyOver SoundAndFlyOver;

	TypicalAbility_BuildVisualization(VisualizeGameState);

	// Check if we should add a fly-over for 'Blind Rage' (iff both source and target are AI).
	History = `XCOMHISTORY;
	Context = XComGameStateContext_Ability(VisualizeGameState.GetContext());
	SourceState = XComGameState_Unit(History.GetGameStateForObjectID(Context.InputContext.SourceObject.ObjectID));
	if( SourceState.ControllingPlayerIsAI() && SourceState.IsUnitAffectedByEffectName(RageTriggeredEffectName))
	{
		TargetState = XComGameState_Unit(History.GetGameStateForObjectID(Context.InputContext.PrimaryTarget.ObjectID));
		if( TargetState.GetTeam() == SourceState.GetTeam() )
		{
			ActionMetadata.StateObject_OldState = History.GetGameStateForObjectID(SourceState.ObjectID, eReturnType_Reference, VisualizeGameState.HistoryIndex - 1);
			ActionMetadata.StateObject_NewState = VisualizeGameState.GetGameStateForObjectID(SourceState.ObjectID);
			ActionMetadata.VisualizeActor = History.GetVisualizer(SourceState.ObjectID);

			SoundAndFlyOver = X2Action_PlaySoundAndFlyOver(class'X2Action_PlaySoundAndFlyOver'.static.AddToVisualizationTree(ActionMetadata, Context, false, ActionMetadata.LastActionAdded));
 			SoundAndFlyOver.SetSoundAndFlyOverParameters(None, class'X2Ability_Berserker'.default.BlindRageFlyover, '', eColor_Good);
		}
	}
}

static function X2AbilityTemplate Create_PA_QuakeAbility()
{
	local X2AbilityTemplate							Template;
	local X2AbilityCost_ActionPoints				ActionPointCost;
	local X2AbilityTarget_Cursor					CursorTarget;
	local X2AbilityMultiTarget_Radius				RadiusMultiTarget;
	local X2AbilityTrigger_PlayerInput				InputTrigger;
	local X2AbilityCooldown							Cooldown;
	local X2Effect_Knockback						KnockbackEffect;
	local X2Effect_ApplyWeaponDamage				DamageEffect;
	local X2AbilityToHitCalc_StatCheck_UnitVsUnit   StatContest;
	local X2Effect_Persistent						DisorientedEffect;
	local X2Effect_Stunned							StunnedEffect;
	local X2Effect_Persistent						UnconsciousEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'PA_Quake');
	Template.bDontDisplayInAbilitySummary = default.PA_BerserkerQueen_DontDisplay_Quake_InSummary;
	Template.IconImage = "img:///UILibrary_DLC2Images.UIPerk_beserker_quake";

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = default.PA_BerserkerQueen_Quake_ActionPointCost;
	ActionPointCost.bConsumeAllPoints = default.PA_BerserkerQueen_Quake_ConsumeAllActionPointCost;
	Template.AbilityCosts.AddItem(ActionPointCost);

	// This will be a stat contest
	StatContest = new class'X2AbilityToHitCalc_StatCheck_UnitVsUnit';
	StatContest.AttackerStat = eStat_Strength;
	Template.AbilityToHitCalc = StatContest;

	// On hit effects
	//  Stunned effect for 1 or 2 unblocked hit
	DisorientedEffect = class'X2StatusEffects'.static.CreateDisorientedStatusEffect(, , false);
	DisorientedEffect.MinStatContestResult = default.PA_BerserkerQueen_Quake_MinHitDesoriented;
	DisorientedEffect.MaxStatContestResult = default.PA_BerserkerQueen_Quake_MaxHitDesoriented;
	DisorientedEffect.MultiTargetStatContestInfo.MaxNumberAllowed = default.PA_BerserkerQueen_Quake_MaxEnemyDesoriented_Allowed;
	DisorientedEffect.bRemoveWhenSourceDies = false;
	Template.AddMultiTargetEffect(DisorientedEffect);

	//  Stunned effect for 3 or 4 unblocked hit
	StunnedEffect = class'X2StatusEffects'.static.CreateStunnedStatusEffect(2, 100, false);
	StunnedEffect.MinStatContestResult = default.PA_BerserkerQueen_Quake_MinHitStunned;
	StunnedEffect.MaxStatContestResult = default.PA_BerserkerQueen_Quake_MaxHitStunned;
	StunnedEffect.MultiTargetStatContestInfo.MaxNumberAllowed = default.PA_BerserkerQueen_Quake_MaxEnemyStun_Allowed;  // Max number of stunned units allowed from this ability
	StunnedEffect.MultiTargetStatContestInfo.EffectIdxToApplyOnMaxExceeded = 0;    // After the max allowed, targets become disoriented
	StunnedEffect.bRemoveWhenSourceDies = false;
	Template.AddMultiTargetEffect(StunnedEffect);

	//  Unconscious effect for 5 unblocked hits
	UnconsciousEffect = class'X2StatusEffects'.static.CreateUnconsciousStatusEffect();
	UnconsciousEffect.MinStatContestResult = default.PA_BerserkerQueen_Quake_MinHitUnconscious;
	UnconsciousEffect.MaxStatContestResult = default.PA_BerserkerQueen_Quake_MaxHitUnconscious;
	UnconsciousEffect.MultiTargetStatContestInfo.MaxNumberAllowed = default.PA_BerserkerQueen_Quake_MaxEnemyUnconscious_Allowed;  // Max number of the multitargets that may become unconscious
	UnconsciousEffect.MultiTargetStatContestInfo.EffectIdxToApplyOnMaxExceeded = 1;    // After the max allowed, targets become stunned
	UnconsciousEffect.bRemoveWhenSourceDies = false;
	Template.AddMultiTargetEffect(UnconsciousEffect);

	// damage effect
	DamageEffect = new class'X2Effect_ApplyWeaponDamage';
	DamageEffect.EffectDamageValue = default.PA_BerserkerQueen_Quake_Damage;
	Template.AddMultiTargetEffect(DamageEffect);

	// knockback effect
	KnockbackEffect = new class'X2Effect_Knockback';
	KnockbackEffect.KnockbackDistance = default.PA_BerserkerQueen_Quake_Knockback_Distance;
	Template.AddMultiTargetEffect(KnockbackEffect);

	// Multi Targets
	Template.AbilityMultiTargetConditions.AddItem(default.LivingTargetUnitOnlyProperty);

	CursorTarget = new class'X2AbilityTarget_Cursor';
	Template.AbilityTargetStyle = CursorTarget;

	RadiusMultiTarget = new class'X2AbilityMultiTarget_Radius';
	RadiusMultiTarget.bUseWeaponRadius = false;
	RadiusMultiTarget.fTargetRadius = default.PA_BerserkerQueen_Quake_Damage_Radius;
	RadiusMultiTarget.bExcludeSelfAsTargetIfWithinRadius = true;
	Template.AbilityMultiTargetStyle = RadiusMultiTarget;

	Template.TargetingMethod = class'X2TargetingMethod_PathTarget';

	// shooter conditions
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);

	// trigger
	InputTrigger = new class'X2AbilityTrigger_PlayerInput';
	Template.AbilityTriggers.AddItem(InputTrigger);

	Template.AbilitySourceName = 'eAbilitySource_Standard';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_AlwaysShow;
	Template.IconImage = "img:///UILibrary_DLC2Images.PerkIcons.UIPerk_beserker_quake";

	// Cooldown on the ability
	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = default.PA_BerserkerQueen_Quake_Cooldown;
	Template.AbilityCooldown = Cooldown;

	Template.bSkipMoveStop = true;
	Template.CustomFireAnim = 'FF_Quake';
	Template.CustomMovingFireAnim = 'MV_Quake';
	Template.CustomMovingTurnLeftFireAnim = 'MV_RunTun90LeftQuake';
	Template.CustomMovingTurnRightFireAnim = 'MV_RunTun90RightQuake';

	// This action is considered 'hostile' and can be interrupted!
	Template.Hostility = eHostility_Offensive;
	Template.BuildNewGameStateFn = TypicalMoveEndAbility_BuildGameState;
	Template.BuildInterruptGameStateFn = TypicalMoveEndAbility_BuildInterruptGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.CinescriptCameraType = "BerserkerQueen_Quake";

	Template.LostSpawnIncreasePerUse = class'X2AbilityTemplateManager'.default.HeavyWeaponLostSpawnIncreasePerUse;
//BEGIN AUTOGENERATED CODE: Template Overrides 'Quake'
	Template.bFrameEvenWhenUnitIsHidden = true;
//END AUTOGENERATED CODE: Template Overrides 'Quake'

	return Template;
}

static function X2AbilityTemplate Create_PA_Faithbreaker()
{
	local X2AbilityTemplate     Template;
	local X2AbilityCost_ActionPoints ActionPointCost;
	local X2AbilityCooldown     Cooldown;
	local X2AbilityMultiTarget_AllUnits MultiTarget;
	local X2Effect_Panicked     PanicEffect;
	local X2Condition_UnitProperty UnitPropertyCondition;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'PA_FaithBreaker');

	Template.IconImage = "img:///UILibrary_DLC2Images.PerkIcons.UIPerk_beserker_faithbreaker";

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = default.PA_BerserkerQueen_FaithBreaker_ActionPointCost;
	ActionPointCost.bConsumeAllPoints = default.PA_BerserkerQueen_FaithBreaker_ConsumeAllActionPointCost;
	Template.AbilityCosts.AddItem(ActionPointCost);

	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = default.PA_BerserkerQueen_FaithBreaker_Cooldown;
	Template.AbilityCooldown = Cooldown;

	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);
	Template.AbilityTargetStyle = default.SelfTarget;
	MultiTarget = new class'X2AbilityMultiTarget_AllUnits';
	MultiTarget.bAcceptEnemyUnits = true;
	Template.AbilityMultiTargetStyle = MultiTarget;

	Template.AbilityMultiTargetConditions.AddItem(new class'X2Condition_Panic');

	UnitPropertyCondition = new class'X2Condition_UnitProperty';
	UnitPropertyCondition.ExcludeAlive = default.PA_BerserkerQueen_DoesFaithBreakerExcludeAlive; //false
	UnitPropertyCondition.ExcludeAlien = default.PA_BerserkerQueen_DoesFaithBreakerExcludeAlien;
	UnitPropertyCondition.ExcludeDead = default.PA_BerserkerQueen_DoesFaithBreakerExcludeDead; //true
	UnitPropertyCondition.ExcludeFriendlyToSource = default.PA_BerserkerQueen_DoesFaithBreakerExcludeFriendly; //true
	UnitPropertyCondition.ExcludeHostileToSource = default.PA_BerserkerQueen_DoesFaithBreakerExcludeHostile; //false
	UnitPropertyCondition.TreatMindControlledSquadmateAsHostile = default.PA_BerserkerQueen_DoesFaithBreakerExcludeAFriendly_MindControlled; //false
	UnitPropertyCondition.FailOnNonUnits = true; //true
	UnitPropertyCondition.ExcludeRobotic = default.PA_BerserkerQueen_DoesFaithBreakerExcludeRobot; //true
	Template.AbilityMultiTargetConditions.AddItem(UnitPropertyCondition);

	PanicEffect = class'X2StatusEffects'.static.CreatePanickedStatusEffect();
	PanicEffect.ApplyChanceFn = PA_FaithbreakerApplyChance;
	PanicEffect.VisualizationFn = PA_FaithBreaker_PanickedVisualization;
	Template.AddMultiTargetEffect(PanicEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.CinescriptCameraType = "Berserker_Rage";
	Template.bShowPostActivation = true;

	Template.CustomFireAnim = 'NO_Faithbreaker';

	class'X2Ability_DLC_Day60AlienRulers'.static.RemoveMimicBeaconsFromTargets(Template);

//BEGIN AUTOGENERATED CODE: Template Overrides 'Faithbreaker'
	Template.bFrameEvenWhenUnitIsHidden = true;
//END AUTOGENERATED CODE: Template Overrides 'Faithbreaker'
	Template.LostSpawnIncreasePerUse = class'X2AbilityTemplateManager'.default.StandardShotLostSpawnIncreasePerUse;
	return Template;
}

function name PA_FaithbreakerApplyChance(const out EffectAppliedData ApplyEffectParameters, XComGameState_BaseObject kNewTargetState, XComGameState NewGameState)
{
	//  this mimics the panic hit roll without actually BEING the panic hit roll
	local XComGameState_Unit TargetUnit;
	local name ImmuneName;
	local float MaxHealth, CurrentHealth, HealthLost;
	local int TargetRoll, RandRoll;
	local int AttackVal;
	local X2BQArmorTemplate BerserkerQueenArmorTemplate;
	local XComGameState_Item ArmorState;

	TargetUnit = XComGameState_Unit(kNewTargetState);

		//* This is basically the code for the "Intimidate" Spark perk

		if (TargetUnit != none)
	{
		ArmorState = TargetUnit.GetItemInSlot(eInvSlot_Armor, NewGameState);
		`assert(ArmorState != none);
		BerserkerQueenArmorTemplate = X2BQArmorTemplate(ArmorState.GetMyTemplate());
	}

		if (TargetUnit != none && BerserkerQueenArmorTemplate != none)
	{
		foreach class'X2AbilityToHitCalc_PanicCheck'.default.PanicImmunityAbilities(ImmuneName)
		{
			if (TargetUnit.FindAbility(ImmuneName).ObjectID != 0)
			{
				return 'AA_UnitIsImmune';
			}
		}

		MaxHealth = TargetUnit.GetMaxStat(eStat_HP);
		CurrentHealth = TargetUnit.GetCurrentStat(eStat_HP);
		AttackVal = BerserkerQueenArmorTemplate.FaithBreaker;
		HealthLost = MaxHealth + AttackVal - CurrentHealth;

		TargetRoll = HealthLost * default.PA_BerserkerQueen_FaithBreaker_AddedChances_PerHP_Lost;
		RandRoll = `SYNC_RAND(100);
		if (RandRoll < TargetRoll)
		{
			return 'AA_Success';
		}

	}

	return 'AA_EffectChanceFailed';
}


static function PA_FaithBreaker_PanickedVisualization(XComGameState VisualizeGameState, out VisualizationActionMetadata ActionMetadata, const name EffectApplyResult)
{
	local XComGameState_Unit UnitState;

	UnitState = XComGameState_Unit(ActionMetadata.StateObject_NewState);
	if (UnitState == none)
	{

	}

	if (!UnitState.IsCivilian() && EffectApplyResult != 'AA_Success')
	{
		class'X2StatusEffects'.static.AddEffectSoundAndFlyOverToTrack(ActionMetadata, VisualizeGameState.GetContext(), class'X2Effect_Panicked'.default.EffectFailedFriendlyName, '', eColor_Good, class'UIUtilities_Image'.const.UnitStatus_Panicked);
	}
}



static function X2AbilityTemplate Create_PA_BerserkerQueenSlash_Ability()
{
	local X2AbilityTemplate                 Template;
	local X2AbilityCost_ActionPoints        ActionPointCost;
	local X2AbilityToHitCalc_StandardMelee  StandardMelee;
	local X2Effect_ApplyWeaponDamage        WeaponDamageEffect;
	local array<name>                       SkipExclusions;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'PA_BerserkerQueenSlash');

	Template.AbilitySourceName = 'eAbilitySource_Standard';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_AlwaysShow;
	Template.BuildNewGameStateFn = TypicalMoveEndAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.BuildInterruptGameStateFn = TypicalMoveEndAbility_BuildInterruptGameState;
	Template.CinescriptCameraType = "Ranger_Reaper";
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_swordSlash";
	Template.bHideOnClassUnlock = false;
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_SQUADDIE_PRIORITY;
	Template.AbilityConfirmSound = "TacticalUI_SwordConfirm";

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	ActionPointCost.bConsumeAllPoints = true;
	Template.AbilityCosts.AddItem(ActionPointCost);

	StandardMelee = new class'X2AbilityToHitCalc_StandardMelee';
	Template.AbilityToHitCalc = StandardMelee;

	Template.AbilityTargetStyle = new class'X2AbilityTarget_MovingMelee';
	Template.TargetingMethod = class'X2TargetingMethod_MeleePath';

	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);
	Template.AbilityTriggers.AddItem(new class'X2AbilityTrigger_EndOfMove');

	// Target Conditions
	//
	Template.AbilityTargetConditions.AddItem(default.LivingHostileTargetProperty);
	Template.AbilityTargetConditions.AddItem(default.MeleeVisibilityCondition);

	// Shooter Conditions
	//
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	SkipExclusions.AddItem(class'X2StatusEffects'.default.BurningName);
	Template.AddShooterEffectExclusions(SkipExclusions);

	// Damage Effect
	//
	WeaponDamageEffect = new class'X2Effect_ApplyWeaponDamage';
	Template.AddTargetEffect(WeaponDamageEffect);

	Template.bAllowBonusWeaponEffects = true;
	Template.bSkipMoveStop = true;

	// Voice events
	//
	Template.SuperConcealmentLoss = class'X2AbilityTemplateManager'.default.SuperConcealmentStandardShotLoss;
	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.StandardShotChosenActivationIncreasePerUse;
	Template.LostSpawnIncreasePerUse = class'X2AbilityTemplateManager'.default.MeleeLostSpawnIncreasePerUse;
	Template.bFrameEvenWhenUnitIsHidden = true;

	return Template;
}







//* ========================================================
//* Ultimate ability : mind control
//* ========================================================

static function X2AbilityTemplate Create_PA_Muton_MC_Ability()
{
	local X2AbilityTemplate                 Template;
	local X2Condition_UnitValue				TargetAlreadyTestedCondition;
	local X2Condition_UnitType				UnitTypeCondition;
	local X2Condition_PanicOnPod            PanicOnPodCondition;
	local X2Effect_SetUnitValue				SetUnitValEffect;
	local X2Condition_UnitProperty          ShooterCondition;
	local X2AbilityTarget_Single            SingleTarget;
	local X2AbilityTrigger_EventListener	Trigger;
	local X2Effect_Panicked					PanickedEffect;
	local X2Effect_MindControl 				MindControlEffect;
	local X2AbilityToHitCalc_PercentChance	PercentChanceToHit;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'PA_MutonBerserker_MC');

	Template.bDontDisplayInAbilitySummary = default.PA_BerserkerQueen_DontDisplay_MindControl_InSummary;

	PercentChanceToHit = new class'X2AbilityToHitCalc_PercentChance';
	PercentChanceToHit.PercentToHit = default.PA_Muton_MC_Chance;
	Template.AbilityToHitCalc = PercentChanceToHit;

	Template.AbilityTargetConditions.AddItem(default.LivingHostileUnitDisallowMindControlProperty);

	TargetAlreadyTestedCondition = new class'X2Condition_UnitValue';
	TargetAlreadyTestedCondition.AddCheckValue(default.PA_Muton_MC_Test, 0, eCheck_Exact);
	Template.AbilityTargetConditions.AddItem(TargetAlreadyTestedCondition);

	UnitTypeCondition = new class'X2Condition_UnitType';
	UnitTypeCondition.IncludeTypes.AddItem('Muton');
	UnitTypeCondition.IncludeTypes.AddItem('Berserker');
	Template.AbilityTargetConditions.AddItem(UnitTypeCondition);

	PanicOnPodCondition = new class'X2Condition_PanicOnPod';
	PanicOnPodCondition.MaxPanicUnitsPerPod = default.PA_Muton_MC_Per_Pod;
	Template.AbilityTargetConditions.AddItem(PanicOnPodCondition);

	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	ShooterCondition = new class'X2Condition_UnitProperty';
	ShooterCondition.ExcludeConcealed = true;
	Template.AbilityShooterConditions.AddItem(ShooterCondition);

	SingleTarget = new class'X2AbilityTarget_Single';
	SingleTarget.OnlyIncludeTargetsInsideWeaponRange = false;
	Template.AbilityTargetStyle = SingleTarget;

	Trigger = new class'X2AbilityTrigger_EventListener';
	Trigger.ListenerData.Deferral = ELD_OnStateSubmitted;
	Trigger.ListenerData.EventFn = class'XComGameState_Ability'.static.AbilityTriggerEventListener_UnitSeesUnit;
	Trigger.ListenerData.EventID = 'UnitSeesUnit';
	Template.AbilityTriggers.AddItem(Trigger);

	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_overwatch";
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.ARMOR_ACTIVE_PRIORITY;
	Template.bDisplayInUITooltip = default.PA_BerserkerQueen_MC_DisplayIn_UI_Tooltip;
	Template.bDisplayInUITacticalText = default.PA_BerserkerQueen_MC_DisplayIn_TacText;
	Template.DisplayTargetHitChance = false;

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	Template.bAllowFreeFireWeaponUpgrade = false;
	Template.bAllowAmmoEffects = false;

	// Damage Effect
	//
	PanickedEffect = class'X2StatusEffects'.static.CreatePanickedStatusEffect();
	PanickedEffect.VisualizationFn = ArmorPanickedVisualization; // Overwriting Default Panic
	Template.AddTargetEffect(PanickedEffect);

	MindControlEffect = class'X2StatusEffects'.static.CreateMindControlStatusEffect(default.PA_Muton_MC_MaxNumTurn, default.PA_Is_BerserkerQueen_MC_Infinite, true, 0);
	MindControlEffect.VisualizationFn = ArmorPanickedVisualization; // Overwriting Default Panic
	Template.AddTargetEffect(MindControlEffect);

	SetUnitValEffect = new class'X2Effect_SetUnitValue';
	SetUnitValEffect.UnitName = default.PA_Muton_MC_Test;
	SetUnitValEffect.NewValueToSet = 1;
	SetUnitValEffect.CleanupType = eCleanup_BeginTactical;
	SetUnitValEffect.bApplyOnHit = true;
	SetUnitValEffect.bApplyOnMiss = true;
	Template.AddTargetEffect(SetUnitValEffect);

	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.bSkipFireAction = true;
//BEGIN AUTOGENERATED CODE: Template Overrides 'RagePanic'
	Template.bFrameEvenWhenUnitIsHidden = true;
//END AUTOGENERATED CODE: Template Overrides 'RagePanic'

	return Template;
}

static function X2AbilityTemplate Create_PA_Archon_MC_Ability()
{
	local X2AbilityTemplate                 Template;
	local X2Condition_UnitValue				TargetAlreadyTestedCondition;
	local X2Condition_UnitType				UnitTypeCondition;
	local X2Condition_PanicOnPod            PanicOnPodCondition;
	local X2Effect_SetUnitValue				SetUnitValEffect;
	local X2Condition_UnitProperty          ShooterCondition;
	local X2AbilityTarget_Single            SingleTarget;
	local X2AbilityTrigger_EventListener	Trigger;
	local X2Effect_Panicked					PanickedEffect;
	local X2Effect_MindControl 				MindControlEffect;
	local X2AbilityToHitCalc_PercentChance	PercentChanceToHit;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'PA_Archon_MC');

	Template.bDontDisplayInAbilitySummary = default.PA_ArchonKing_DontDisplay_MindControl_InSummary;

	PercentChanceToHit = new class'X2AbilityToHitCalc_PercentChance';
	PercentChanceToHit.PercentToHit = default.PA_Archon_MC_Chance;
	Template.AbilityToHitCalc = PercentChanceToHit;

	Template.AbilityTargetConditions.AddItem(default.LivingHostileUnitDisallowMindControlProperty);

	TargetAlreadyTestedCondition = new class'X2Condition_UnitValue';
	TargetAlreadyTestedCondition.AddCheckValue(default.PA_Archon_MC_Test, 0, eCheck_Exact);
	Template.AbilityTargetConditions.AddItem(TargetAlreadyTestedCondition);

	UnitTypeCondition = new class'X2Condition_UnitType';
	UnitTypeCondition.IncludeTypes.AddItem('Archon');
	Template.AbilityTargetConditions.AddItem(UnitTypeCondition);

	PanicOnPodCondition = new class'X2Condition_PanicOnPod';
	PanicOnPodCondition.MaxPanicUnitsPerPod = default.PA_Archon_MC_Per_Pod;
	Template.AbilityTargetConditions.AddItem(PanicOnPodCondition);

	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	ShooterCondition = new class'X2Condition_UnitProperty';
	ShooterCondition.ExcludeConcealed = true;
	Template.AbilityShooterConditions.AddItem(ShooterCondition);

	SingleTarget = new class'X2AbilityTarget_Single';
	SingleTarget.OnlyIncludeTargetsInsideWeaponRange = false;
	Template.AbilityTargetStyle = SingleTarget;

	Trigger = new class'X2AbilityTrigger_EventListener';
	Trigger.ListenerData.Deferral = ELD_OnStateSubmitted;
	Trigger.ListenerData.EventFn = class'XComGameState_Ability'.static.AbilityTriggerEventListener_UnitSeesUnit;
	Trigger.ListenerData.EventID = 'UnitSeesUnit';
	Template.AbilityTriggers.AddItem(Trigger);

	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_overwatch";
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.ARMOR_ACTIVE_PRIORITY;
	Template.bDisplayInUITooltip = default.PA_ArchonKing_MC_DisplayIn_UI_Tooltip;
	Template.bDisplayInUITacticalText = default.PA_ArchonKing_MC_DisplayIn_TacText;
	Template.DisplayTargetHitChance = false;

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	Template.bAllowFreeFireWeaponUpgrade = false;
	Template.bAllowAmmoEffects = false;

	// Damage Effect
	//
	PanickedEffect = class'X2StatusEffects'.static.CreatePanickedStatusEffect();
	PanickedEffect.VisualizationFn = ArmorPanickedVisualization; // Overwriting Default Panic
	Template.AddTargetEffect(PanickedEffect);

	MindControlEffect = class'X2StatusEffects'.static.CreateMindControlStatusEffect(default.PA_Archon_MC_MaxNumTurn, false, default.PA_Is_ArchonKing_MC_Infinite, 0);
	MindControlEffect.VisualizationFn = ArmorPanickedVisualization; // Overwriting Default Panic
	Template.AddTargetEffect(MindControlEffect);

	SetUnitValEffect = new class'X2Effect_SetUnitValue';
	SetUnitValEffect.UnitName = default.PA_Archon_MC_Test;
	SetUnitValEffect.NewValueToSet = 1;
	SetUnitValEffect.CleanupType = eCleanup_BeginTactical;
	SetUnitValEffect.bApplyOnHit = true;
	SetUnitValEffect.bApplyOnMiss = true;
	Template.AddTargetEffect(SetUnitValEffect);

	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.bSkipFireAction = true;
//BEGIN AUTOGENERATED CODE: Template Overrides 'IcarusPanic'
	Template.bFrameEvenWhenUnitIsHidden = true;
//END AUTOGENERATED CODE: Template Overrides 'IcarusPanic'

	return Template;
}

static function X2AbilityTemplate Create_PA_Viper_MC_Ability()
{
	local X2AbilityTemplate                 Template;
	local X2Condition_UnitValue				TargetAlreadyTestedCondition;
	local X2Condition_UnitType				UnitTypeCondition;
	local X2Condition_PanicOnPod            PanicOnPodCondition;
	local X2Effect_SetUnitValue				SetUnitValEffect;
	local X2Condition_UnitProperty          ShooterCondition;
	local X2AbilityTarget_Single            SingleTarget;
	local X2AbilityTrigger_EventListener	Trigger;
	local X2Effect_Panicked					PanickedEffect;
	local X2Effect_MindControl 				MindControlEffect;
	local X2AbilityToHitCalc_PercentChance	PercentChanceToHit;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'PA_Viper_MC');

	Template.bDontDisplayInAbilitySummary = default.PA_ViperKing_DontDisplay_MindControl_InSummary;

	PercentChanceToHit = new class'X2AbilityToHitCalc_PercentChance';
	PercentChanceToHit.PercentToHit = default.PA_Viper_MC_Chance;
	Template.AbilityToHitCalc = PercentChanceToHit;

	Template.AbilityTargetConditions.AddItem(default.LivingHostileUnitDisallowMindControlProperty);

	TargetAlreadyTestedCondition = new class'X2Condition_UnitValue';
	TargetAlreadyTestedCondition.AddCheckValue(default.PA_Viper_MC_Test, 0, eCheck_Exact);
	Template.AbilityTargetConditions.AddItem(TargetAlreadyTestedCondition);

	UnitTypeCondition = new class'X2Condition_UnitType';
	UnitTypeCondition.IncludeTypes.AddItem('Viper');
	Template.AbilityTargetConditions.AddItem(UnitTypeCondition);

	PanicOnPodCondition = new class'X2Condition_PanicOnPod';
	PanicOnPodCondition.MaxPanicUnitsPerPod = default.PA_Viper_MC_Per_Pod;
	Template.AbilityTargetConditions.AddItem(PanicOnPodCondition);

	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	ShooterCondition = new class'X2Condition_UnitProperty';
	ShooterCondition.ExcludeConcealed = true;
	Template.AbilityShooterConditions.AddItem(ShooterCondition);

	SingleTarget = new class'X2AbilityTarget_Single';
	SingleTarget.OnlyIncludeTargetsInsideWeaponRange = false;
	Template.AbilityTargetStyle = SingleTarget;

	Trigger = new class'X2AbilityTrigger_EventListener';
	Trigger.ListenerData.Deferral = ELD_OnStateSubmitted;
	Trigger.ListenerData.EventFn = class'XComGameState_Ability'.static.AbilityTriggerEventListener_UnitSeesUnit;
	Trigger.ListenerData.EventID = 'UnitSeesUnit';
	Template.AbilityTriggers.AddItem(Trigger);

	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_overwatch";
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.ARMOR_ACTIVE_PRIORITY;
	Template.bDisplayInUITooltip = default.PA_ViperKing_MC_DisplayIn_UI_Tooltip;
	Template.bDisplayInUITacticalText = default.PA_ViperKing_MC_DisplayIn_TacText;
	Template.DisplayTargetHitChance = false;

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	Template.bAllowFreeFireWeaponUpgrade = false;
	Template.bAllowAmmoEffects = false;

	// Damage Effect
	//
	PanickedEffect = class'X2StatusEffects'.static.CreatePanickedStatusEffect();
	PanickedEffect.VisualizationFn = ArmorPanickedVisualization; // Overwriting Default Panic
	//PanickedEffect.SetDisplayInfo(ePerkBuff_Penalty, Template.LocFriendlyName, Template.GetMyHelpText(), Template.IconImage, true);
	Template.AddTargetEffect(PanickedEffect);

	MindControlEffect = class'X2StatusEffects'.static.CreateMindControlStatusEffect(default.PA_Viper_MC_MaxNumTurn, false, default.PA_Is_ViperKing_MC_Infinite, 0);
	MindControlEffect.VisualizationFn = ArmorPanickedVisualization; // Overwriting Default Mind control
	Template.AddTargetEffect(MindControlEffect);

	SetUnitValEffect = new class'X2Effect_SetUnitValue';
	SetUnitValEffect.UnitName = default.PA_Viper_MC_Test;
	SetUnitValEffect.NewValueToSet = 1;
	SetUnitValEffect.CleanupType = eCleanup_BeginTactical;
	SetUnitValEffect.bApplyOnHit = true;
	SetUnitValEffect.bApplyOnMiss = true;
	Template.AddTargetEffect(SetUnitValEffect);

	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.bSkipFireAction = true;
//BEGIN AUTOGENERATED CODE: Template Overrides 'SerpentPanic'
	Template.bFrameEvenWhenUnitIsHidden = true;
//END AUTOGENERATED CODE: Template Overrides 'SerpentPanic'

	return Template;
}

static function ArmorPanickedVisualization(XComGameState VisualizeGameState, out VisualizationActionMetadata ActionMetadata, const name EffectApplyResult)
{
	local XComGameState_Unit UnitState;
	local XComGameStateContext_Ability  AbilityContext;
	local X2AbilityTemplate AbilityTemplate;

	if (EffectApplyResult != 'AA_Success')
	{

	}

	// pan to the panicking unit (but only if it isn't a civilian)
	UnitState = XComGameState_Unit(ActionMetadata.StateObject_NewState);
	if (UnitState == none)


	AbilityContext = XComGameStateContext_Ability(VisualizeGameState.GetContext());
	AbilityTemplate = class'XComGameState_Ability'.static.GetMyTemplateManager().FindAbilityTemplate(AbilityContext.InputContext.AbilityTemplateName);

	class'X2StatusEffects'.static.AddEffectCameraPanToAffectedUnitToTrack(ActionMetadata, VisualizeGameState.GetContext());
	class'X2StatusEffects'.static.AddEffectSoundAndFlyOverToTrack(ActionMetadata, VisualizeGameState.GetContext(), AbilityTemplate.LocFlyOverText, '', eColor_Bad, , 1.0f);
	class'X2StatusEffects'.static.AddEffectMessageToTrack(ActionMetadata,
														  AbilityTemplate.LocFlyOverText,
														  VisualizeGameState.GetContext(),
														  class'UIEventNoticesTactical'.default.PanickedTitle,
														  "img:///UILibrary_StrategyImages.X2StrategyMap.MapPin_Generic",
														  eUIState_Bad);

	class'X2StatusEffects'.static.UpdateUnitFlag(ActionMetadata, VisualizeGameState.GetContext());
}


DefaultProperties
{
	PA_KingBindSustainedEffectName="KingBindSustainedEffect"
	PA_KingBindAbilityName="KingBind"
	PA_KingBlazingPinionsStage2AbilityName="ArchonKingBlazingPinionsStage2"
	PA_Muton_MC_Test="HeavyAlienPanicTested"
	PA_Archon_MC_Test="MediumAlienPanicTested"
	PA_Viper_MC_Test="LightAlienPanicTested"
	RageTriggeredEffectName="RageTriggered" //String change requires updating DefaultAI.ini
}