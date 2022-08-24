class X2Ability_PlayableRulers extends X2Ability config(GameData_SoldierSkills);

//* Bind ability

var config WeaponDamageValue PA_ViperKing_Bind_BaseDamage;

var config bool PA_ViperKing_DontDisplay_Bind_InSummary;
var config bool PA_ViperKing_DoesBind_ConsumeAllActionPointCost;

// Exlusion rules
var config bool ViperKing_DoesBindExcludeRobot;
var config bool ViperKing_DoesBindExcludeAlien;
var config bool ViperKing_DoesBindExcludeFriendly;

var config int PA_ViperKing_Bind_ActionPointCost;
var config int PA_ViperKing_Bind_Cooldown;
var config int PA_ViperKing_Bind_Range;
var config int PA_ViperKing_Bind_FragileAmount;

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

var config bool PA_Does_GetOverHere_ExcludeRobot; // true
var config bool PA_Does_GetOverHere_ExcludeDead; // true
var config bool PA_Does_GetOverHere_ExcludeFriendly; // true

var config int PA_ViperKing_GetOverHere_MinRange;
var config int PA_ViperKing_GetOverHere_MaxRange;
var config int PA_ViperKing_GetOverHere_Cooldown;
var config int PA_ViperKing_GetOverHere_ActionPointAdded; // 1

var name PA_KingGetOverHereAbilityName;
var name PA_KingBindSustainedEffectName;
var name PA_KingBindAbilityName;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;

	Templates.AddItem(Create_RulersReactions_Ability());
	Templates.AddItem(Create_PA_GetOverHereAbility());
	Templates.AddItem(Create_PA_BindAbility());
	Templates.AddItem(CreatePA_BindSustainedAbility());
	Templates.AddItem(Create_PA_EndBindAbility());


	return Templates;
}


static function X2AbilityTemplate Create_RulersReactions_Ability()
{
	local X2AbilityTemplate Template;
	local X2AbilityTrigger_EventListener Trigger;
	local X2Effect_RunBehaviorTree ReactionEffect;
	local X2Effect_GrantActionPoints AddAPEffect;
	local array<name> SkipExclusions;
	local X2Condition_UnitProperty UnitPropertyCondition;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'RulersReactions');

	Template.AbilitySourceName = 'eAbilitySource_Standard';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_NeverShow;
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_combatstims";

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;

	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);

	SkipExclusions.AddItem(class'X2AbilityTemplateManager'.default.DisorientedName);
	SkipExclusions.AddItem(class'X2StatusEffects'.default.BurningName);
	SkipExclusions.AddItem(class'X2AbilityTemplateManager'.default.ConfusedName);
	Template.AddShooterEffectExclusions(SkipExclusions);

	Trigger = new class'X2AbilityTrigger_EventListener';
	Trigger.ListenerData.Deferral = ELD_OnStateSubmitted;
	Trigger.ListenerData.EventID = 'UnitTakeEffectDamage';
	Trigger.ListenerData.EventFn = class'XComGameState_Ability'.static.AbilityTriggerEventListener_Self;
	Trigger.ListenerData.Filter = eFilter_Unit;
	Template.AbilityTriggers.AddItem(Trigger);

	UnitPropertyCondition = new class'X2Condition_UnitProperty';
	UnitPropertyCondition.ExcludeDead = true;
	UnitPropertyCondition.ExcludeAlive = false;
	UnitPropertyCondition.ExcludeStunned = true;
	Template.AbilityShooterConditions.AddItem(UnitPropertyCondition);

	AddAPEffect = new class'X2Effect_GrantActionPoints';
	AddAPEffect.NumActionPoints = 1;
	AddAPEffect.PointType = class'X2CharacterTemplateManager'.default.StandardActionPoint;
	Template.AddTargetEffect(AddAPEffect);

	ReactionEffect = new class'X2Effect_RunBehaviorTree';
	ReactionEffect.BehaviorTreeName = 'RulersReactions';
	Template.AddTargetEffect(ReactionEffect);

	Template.bShowActivation = true;
	Template.bSkipExitCoverWhenFiring = true;
	Template.bSkipFireAction = true;

	Template.FrameAbilityCameraType = eCameraFraming_Always;
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;

	return Template;
}

//* Viper King Ability

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

	`CREATE_X2ABILITY_TEMPLATE(Template, default.PA_KingGetOverHereAbilityName);
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_viper_getoverhere";

	Template.AbilitySourceName = 'eAbilitySource_Standard';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_AlwaysShow;
	Template.bDontDisplayInAbilitySummary = PA_ViperKing_DontDisplay_GetOverHere_InSummary;

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	ActionPointCost.bConsumeAllPoints = false;
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
	UnitPropertyCondition.ExcludeRobotic = default.PA_Does_GetOverHere_ExcludeRobot;
	UnitPropertyCondition.ExcludeAlien = default.PA_Does_GetOverHere_ExcludeDead;
	UnitPropertyCondition.ExcludeFriendlyToSource = default.PA_Does_GetOverHere_ExcludeFriendly;
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

	`CREATE_X2ABILITY_TEMPLATE(Template, default.PA_KingBindAbilityName);
	Template.IconImage = "img:///UILibrary_DLC2Images.PerkIcons.UIPerk_viper_choke";

	Template.AbilitySourceName = 'eAbilitySource_Standard';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_AlwaysShow;
	bDontDisplayInAbilitySummary = default.PA_ViperKing_DontDisplay_Bind_InSummary;

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
	UnitPropertyCondition.ExcludeRobotic = default.ViperKing_DoesBindExcludeRobot; // true
	UnitPropertyCondition.ExcludeAlien = default.ViperKing_DoesBindExcludeAlien; // true
	UnitPropertyCondition.ExcludeFriendlyToSource = default.ViperKing_DoesBindExcludeFriendly; // true
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

static function X2AbilityTemplate CreatePA_BindSustainedAbility()
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

	Template.bDontDisplayInAbilitySummary = PA_ViperKing_DontDisplay_BindSustain_InSummary;
	Template.AbilitySourceName = 'eAbilitySource_Standard';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_NeverShow;

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = default.PA_ViperKing_BindSustain_ActionsPointCost;
	ActionPointCost.bConsumeAllPoints = default.PA_ViperKing_DoesBindSustain_ConsumeAllActionPointCost;
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
	UnconsciousEffect.ApplyChance = default.PA_KingBindSustained_UnconsciousPercent;
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
	PhysicalDamageEffect.EffectDamageValue = class'X2Item_DLC_Day60Weapons'.default.PA_ViperKing_Bind_SustainDamage;
	PhysicalDamageEffect.DamageTypes.AddItem('ViperCrush');
	PhysicalDamageEffect.EffectDamageValue.DamageType = 'Melee';
	PhysicalDamageEffect.TargetConditions.AddItem(UnconsciousEffectsCondition);
	Template.AddTargetEffect(PhysicalDamageEffect);

	Template.bSkipFireAction = true;
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = BindSustained_BuildVisualization;

	Template.LostSpawnIncreasePerUse = class'X2AbilityTemplateManager'.default.MeleeLostSpawnIncreasePerUse;
//BEGIN AUTOGENERATED CODE: Template Overrides 'KingBindSustained'
	Template.bFrameEvenWhenUnitIsHidden = true;
//END AUTOGENERATED CODE: Template Overrides 'KingBindSustained'

	return Template;
}

simulated function PA_BindSustained_BuildVisualization(XComGameState VisualizeGameState)
{
	local XComGameStateHistory			History;
	local XComGameStateContext_Ability  Context;
	local StateObjectReference          InteractingUnitRef;
	local bool                          bTargetIsDead, bTargetIsUnconscious;
	local int                           i;

	local VisualizationActionMetadata        EmptyTrack;
	local VisualizationActionMetadata        ActionMetadata;

	History = `XCOMHISTORY;

	Context = XComGameStateContext_Ability(VisualizeGameState.GetContext());

	//Configure the visualization track for the target
	//****************************************************************************************
	ActionMetadata = EmptyTrack;
	InteractingUnitRef = Context.InputContext.PrimaryTarget;
	ActionMetadata.StateObject_OldState = History.GetGameStateForObjectID(InteractingUnitRef.ObjectID, eReturnType_Reference, VisualizeGameState.HistoryIndex - 1);
	ActionMetadata.StateObject_NewState = VisualizeGameState.GetGameStateForObjectID(InteractingUnitRef.ObjectID);
	ActionMetadata.VisualizeActor = History.GetVisualizer(InteractingUnitRef.ObjectID);

	bTargetIsDead = XComGameState_Unit(ActionMetadata.StateObject_NewState).IsDead() ||
					XComGameState_Unit(ActionMetadata.StateObject_NewState).IsBleedingOut();

	bTargetIsUnconscious = XComGameState_Unit(ActionMetadata.StateObject_NewState).IsUnconscious();

	if( bTargetIsDead || bTargetIsUnconscious )
	{
		class'X2Action_WaitForAbilityEffect'.static.AddToVisualizationTree(ActionMetadata, Context, false, ActionMetadata.LastActionAdded);
		class'X2Action_Death'.static.AddToVisualizationTree(ActionMetadata, Context, false, ActionMetadata.LastActionAdded);
	}

	for( i = 0; i < Context.ResultContext.TargetEffectResults.Effects.Length; ++i )
	{
		Context.ResultContext.TargetEffectResults.Effects[i].AddX2ActionsForVisualization(VisualizeGameState, ActionMetadata, Context.ResultContext.TargetEffectResults.ApplyResults[i]);
	}

		//****************************************************************************************

	//Configure the visualization track for the shooter
	//****************************************************************************************
	if( bTargetIsDead || bTargetIsUnconscious )
	{
		ActionMetadata = EmptyTrack;
		InteractingUnitRef = Context.InputContext.SourceObject;
		ActionMetadata.VisualizeActor = History.GetVisualizer(InteractingUnitRef.ObjectID);
		ActionMetadata.StateObject_OldState = History.GetGameStateForObjectID(InteractingUnitRef.ObjectID, eReturnType_Reference, VisualizeGameState.HistoryIndex - 1);
		ActionMetadata.StateObject_NewState = VisualizeGameState.GetGameStateForObjectID(InteractingUnitRef.ObjectID);

		if( bTargetIsUnconscious )
		{
			// The target is unconscious so the End Bind for source needs to happen
			PA_BindEndSource_BuildVisualization(VisualizeGameState, ActionMetadata, 'AA_Success');
		}
	}
	//****************************************************************************************
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
	bDontDisplayInAbilitySummary = default.PA_ViperKing_DontDisplay_EndBind_InSummary;

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.AllowedTypes.Length = 0;        //  clear default allowances
	ActionPointCost.AllowedTypes.AddItem(class'X2CharacterTemplateManager'.default.EndBindActionPoint);
	ActionPointCost.iNumPoints = default.PA_ViperKing_EndBind_ActionPointCost;
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

simulated function PA_BindEndSource_BuildVisualization(XComGameState VisualizeGameState, out VisualizationActionMetadata ActionMetadata, const name EffectApplyResult)
{
	local XComGameStateHistory			History;
	local XComGameState_Effect          BindSustainedEffectState;
	local XComGameState_Unit            OldUnitState, BindTarget;
	local X2Action_ViperBindEnd         BindEnd;
	local XComGameStateContext			Context;

	History = `XCOMHISTORY;

	if (ActionMetadata.VisualizeActor != None)
	{
		Context = VisualizeGameState.GetContext( );

		OldUnitState = XComGameState_Unit(ActionMetadata.StateObject_OldState);
		BindSustainedEffectState = OldUnitState.GetUnitApplyingEffectState(default.PA_KingBindSustainedEffectName);
		`assert(BindSustainedEffectState != none);
		BindTarget = XComGameState_Unit(History.GetGameStateForObjectID(BindSustainedEffectState.ApplyEffectParameters.TargetStateObjectRef.ObjectID));
		`assert(BindTarget != none);

		if( BindTarget.IsDead() ||
			BindTarget.IsBleedingOut() ||
			BindTarget.IsUnconscious() )
		{
			// The target is dead, wait for it to die and inform the source
			class'X2Action_WaitForAbilityEffect'.static.AddToVisualizationTree(ActionMetadata, Context, false, ActionMetadata.LastActionAdded);
		}
		else
		{

			BindEnd = X2Action_ViperBindEnd(class'X2Action_ViperBindEnd'.static.AddToVisualizationTree(ActionMetadata, Context, false, ActionMetadata.LastActionAdded));
			BindEnd.PartnerUnitRef = BindSustainedEffectState.ApplyEffectParameters.TargetStateObjectRef;
		}
	}
}

simulated function PA_BindEndTarget_BuildVisualization(XComGameState VisualizeGameState, out VisualizationActionMetadata ActionMetadata, const name EffectApplyResult)
{	
	local XComGameState_Effect          BindSustainedEffectState;
	local XComGameState_Unit            OldUnitState;
	local X2Action_ViperBindEnd         BindEnd;
	local XComGameStateContext			Context;

	if(ActionMetadata.VisualizeActor != None)
	{
		Context = VisualizeGameState.GetContext();

		if( XComGameState_Unit(ActionMetadata.StateObject_NewState).IsDead() ||
		   XComGameState_Unit(ActionMetadata.StateObject_NewState).IsBleedingOut() ||
		   XComGameState_Unit(ActionMetadata.StateObject_NewState).IsUnconscious() )
		{
			OldUnitState = XComGameState_Unit(ActionMetadata.StateObject_OldState);
			BindSustainedEffectState = OldUnitState.GetUnitAffectedByEffectState(default.PA_KingBindSustainedEffectName);
			`assert(BindSustainedEffectState != none);

			BindEnd = X2Action_ViperBindEnd(class'X2Action_ViperBindEnd'.static.AddToVisualizationTree(ActionMetadata, Context, false, ActionMetadata.LastActionAdded));
			BindEnd.PartnerUnitRef = BindSustainedEffectState.ApplyEffectParameters.SourceStateObjectRef;
		}
		else
		{
			class'X2Action_WaitForAbilityEffect'.static.AddToVisualizationTree(ActionMetadata, Context, false, ActionMetadata.LastActionAdded);
		}
	}
}

simulated function PA_BindEnd_BuildVisualization(XComGameState VisualizeGameState)
{
	local XComGameStateHistory			History;
	local XComGameStateContext_Ability  Context;
	local StateObjectReference          InteractingUnitRef;
	

	local VisualizationActionMetadata        EmptyTrack;
	local VisualizationActionMetadata        ActionMetadata;

	History = `XCOMHISTORY;

	Context = XComGameStateContext_Ability(VisualizeGameState.GetContext());

	//Configure the visualization track for the shooter
	//****************************************************************************************
	ActionMetadata = EmptyTrack;
	InteractingUnitRef = Context.InputContext.SourceObject;
	ActionMetadata.VisualizeActor = History.GetVisualizer(InteractingUnitRef.ObjectID);
	ActionMetadata.StateObject_OldState = History.GetGameStateForObjectID(InteractingUnitRef.ObjectID, eReturnType_Reference, VisualizeGameState.HistoryIndex - 1);
	ActionMetadata.StateObject_NewState = VisualizeGameState.GetGameStateForObjectID(InteractingUnitRef.ObjectID);

	PA_BindEndSource_BuildVisualization(VisualizeGameState, ActionMetadata, 'AA_Success');
		//****************************************************************************************

	//Configure the visualization track for the target
	//****************************************************************************************
	ActionMetadata = EmptyTrack;
	InteractingUnitRef = Context.InputContext.PrimaryTarget;
	ActionMetadata.StateObject_OldState = History.GetGameStateForObjectID(InteractingUnitRef.ObjectID, eReturnType_Reference, VisualizeGameState.HistoryIndex - 1);
	ActionMetadata.StateObject_NewState = VisualizeGameState.GetGameStateForObjectID(InteractingUnitRef.ObjectID);
	ActionMetadata.VisualizeActor = History.GetVisualizer(InteractingUnitRef.ObjectID);

	BindEndTarget_BuildVisualization(VisualizeGameState, ActionMetadata, 'AA_Success');
		//****************************************************************************************
}

DefaultProperties
{
	PA_KingBindSustainedEffectName="KingBindSustainedEffect"
	PA_KingGetOverHereAbilityName="KingGetOverHere"
	PA_KingBindAbilityName="KingBind"
}
