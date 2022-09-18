class X2Ability_PlayableRulers extends X2Ability config(GameData_SoldierSkills);

//* =================================
//* Viper King
//* =================================

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

var config bool PA_Does_GetOverHere_ExcludeRobot; // true
var config bool PA_Does_GetOverHere_ExcludeDead; // true
var config bool PA_Does_GetOverHere_ExcludeFriendly; // true

var config int PA_ViperKing_GetOverHere_ActionPointCost;
var config int PA_ViperKing_GetOverHere_MinRange;
var config int PA_ViperKing_GetOverHere_MaxRange;
var config int PA_ViperKing_GetOverHere_Cooldown;
var config int PA_ViperKing_GetOverHere_ActionPointAdded; // 1

var name PA_KingBindSustainedEffectName;
var name PA_KingBindAbilityName;
var privatewrite name PA_KingBlazingPinionsStage2AbilityName;

//* =================================
//* Archon King
//* =================================

//* Blazing Pinions

var config bool PA_ArchonKing_DoesBlazingPinions_ConsumeAllActionPointCost; // false
var config bool PA_Does_BlazingPinions_ExcludeCivilians; // true

var config int PA_ArchonKing_BlazingPinions_AbilityPointCost; // 1
var config int PA_ArchonKing_BlazingPinions_Cooldown;
var config int PA_ArchonKing_BlazingPinions_TargetRadius;
var config int PA_ArchonKing_BlazingPinions_Range;
var config int PA_ArchonKing_BlazingPinions_NumberOfTargets;
var config float PA_ArchonKing_BlazingPinions_ImpactRadius;
var config int PA_ArchonKing_BlazingPinions_EnvDamage;
var config string PA_ArchonKing_BlazingPinions_TargetParticleSystem;
var const config int PA_ArchonKing_BlazingPinions_MaxNumberOfDesorient;
var const config int PA_ArchonKing_BlazingPinions_MaxNumberOfStun;
var const config int PA_ArchonKing_BlazingPinions_MaxNumberOfUnconscious;

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

	Templates.AddItem(Create_PA_RulersReactions_Ability());
	Templates.AddItem(Create_PA_GetOverHereAbility());
	Templates.AddItem(Create_PA_BindAbility());
	Templates.AddItem(Create_PA_BindSustainedAbility());
	Templates.AddItem(Create_PA_EndBindAbility());
	Templates.AddItem(Create_PA_BlazingPinionsStage1Ability());
	Templates.AddItem(Create_PA_BlazingPinionsStage2Ability());
	Templates.AddItem(Create_PA_Muton_MC_Ability());
	Templates.AddItem(Create_PA_Archon_MC_Ability());
	Templates.AddItem(Create_PA_Viper_MC_Ability());


	return Templates;
}


static function X2AbilityTemplate Create_PA_RulersReactions_Ability()
{
	local X2AbilityTemplate Template;
	local X2AbilityTrigger_EventListener Trigger;
	local X2Effect_RunBehaviorTree ReactionEffect;
	local X2Effect_GrantActionPoints AddAPEffect;
	local array<name> SkipExclusions;
	local X2Condition_UnitProperty UnitPropertyCondition;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'PA_RulersReactions');

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

//* =================================================================
//* Viper King Ability
//* =================================================================

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
	PhysicalDamageEffect.EffectDamageValue = class'X2Item_DLC_Day60Weapons'.default.VIPERKING_BIND_SUSTAINDAMAGE;
	PhysicalDamageEffect.DamageTypes.AddItem('ViperCrush');
	PhysicalDamageEffect.EffectDamageValue.DamageType = 'Melee';
	PhysicalDamageEffect.TargetConditions.AddItem(UnconsciousEffectsCondition);
	Template.AddTargetEffect(PhysicalDamageEffect);

	Template.bSkipFireAction = true;
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = PA_BindSustained_BuildVisualization;

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

	PA_BindEndTarget_BuildVisualization(VisualizeGameState, ActionMetadata, 'AA_Success');
		//****************************************************************************************
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

//* =================================================================
//* Archon Ruler Ability
//* =================================================================

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
	ActionPointCost.bConsumeAllPoints = default.PA_ArchonKing_DoesBlazingPinions_ConsumeAllActionPointCost;
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
	UnitProperty.ExcludeCivilian = default.PA_Does_BlazingPinions_ExcludeCivilians;
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
	BlazingPinionsTargetEffect.OverrideParticleSystemFill_Name = default.PA_ArchonKing_BlazingPinions_TargetParticleSystem;
	Template.AddShooterEffect(BlazingPinionsTargetEffect);

	Template.ModifyNewContextFn = PA_BlazingPinionsStage1_ModifyActivatedAbilityContext;
	Template.BuildNewGameStateFn = PA_BlazingPinionsStage1_BuildGameState;
	Template.BuildInterruptGameStateFn = TypicalAbility_BuildInterruptGameState;
	Template.BuildVisualizationFn = PA_BlazingPinionsStage1_BuildVisualization;
	Template.BuildAppliedVisualizationSyncFn = PA_BlazingPinionsStage1_BuildVisualizationSync;
	Template.CinescriptCameraType = "Archon_BlazingPinions_Stage1";
//BEGIN AUTOGENERATED CODE: Template Overrides 'ArchonKingBlazingPinionsStage1'
	Template.bFrameEvenWhenUnitIsHidden = true;
//END AUTOGENERATED CODE: Template Overrides 'ArchonKingBlazingPinionsStage1'
	
	return Template;
}

simulated function PA_BlazingPinionsStage1_ModifyActivatedAbilityContext(XComGameStateContext Context)
{
	local XComGameState_Unit UnitState;
	local XComGameStateContext_Ability AbilityContext;
	local XComGameStateHistory History;
	local vector EndLocation;
	local TTile EndTileLocation;
	local XComWorldData World;
	local PathingInputData InputData;
	local PathingResultData ResultData;

	History = `XCOMHISTORY;
	World = `XWORLD;

	AbilityContext = XComGameStateContext_Ability(Context);
	`assert(AbilityContext.InputContext.TargetLocations.Length > 0);
	
	UnitState = XComGameState_Unit(History.GetGameStateForObjectID(AbilityContext.InputContext.SourceObject.ObjectID));

	// solve the path to get him to the fire location
	EndLocation = AbilityContext.InputContext.TargetLocations[0];
	EndTileLocation = World.GetTileCoordinatesFromPosition(EndLocation);
	EndTileLocation.Z = World.NumZ - 3; // Subtract Magic Number X to make the height visually appealing

	class'X2PathSolver'.static.BuildPath(UnitState, UnitState.TileLocation, EndTileLocation, InputData.MovementTiles, false);
	
	// get the path points
	class'X2PathSolver'.static.GetPathPointsFromPath(UnitState, InputData.MovementTiles, InputData.MovementData);

	// string pull the path to smooth it out
	class'XComPath'.static.PerformStringPulling(XGUnitNativeBase(UnitState.GetVisualizer()), InputData.MovementData);

	//Now add the path to the input context
	InputData.MovingUnitRef = UnitState.GetReference();
	AbilityContext.InputContext.MovementPaths.AddItem(InputData);

	// Update the result context's PathTileData, without this the AI doesn't know it has been seen and will use the invisible teleport move action
	class'X2TacticalVisibilityHelpers'.static.FillPathTileData(AbilityContext.InputContext.SourceObject.ObjectID, InputData.MovementTiles, ResultData.PathTileData);
	AbilityContext.ResultContext.PathResults.AddItem(ResultData);
}

simulated function XComGameState PA_BlazingPinionsStage1_BuildGameState(XComGameStateContext Context)
{
	local XComGameState NewGameState;
	local XComGameState_Unit UnitState;
	local XComGameStateContext_Ability AbilityContext;
	local vector NewLocation;
	local TTile NewTileLocation;
	local XComWorldData World;
	local X2EventManager EventManager;
	local int LastPathElement;

	World = `XWORLD;
	EventManager = `XEVENTMGR;

	//Build the new game state frame
	NewGameState = TypicalAbility_BuildGameState(Context);

	AbilityContext = XComGameStateContext_Ability(NewGameState.GetContext());	
	UnitState = XComGameState_Unit(NewGameState.ModifyStateObject(class'XComGameState_Unit', AbilityContext.InputContext.SourceObject.ObjectID));
	
	LastPathElement = AbilityContext.InputContext.MovementPaths[0].MovementData.Length - 1;

	// Move the unit vertically, set the unit's new location
	// The last position in MovementData will be the end location
	`assert(LastPathElement > 0);
	NewLocation = AbilityContext.InputContext.MovementPaths[0].MovementData[LastPathElement].Position;
	NewTileLocation = World.GetTileCoordinatesFromPosition(NewLocation);
	UnitState.SetVisibilityLocation(NewTileLocation);

	AbilityContext.ResultContext.bPathCausesDestruction = MoveAbility_StepCausesDestruction(UnitState, AbilityContext.InputContext, 0, LastPathElement);
	MoveAbility_AddTileStateObjects(NewGameState, UnitState, AbilityContext.InputContext, 0, LastPathElement);

	EventManager.TriggerEvent('ObjectMoved', UnitState, UnitState, NewGameState);
	EventManager.TriggerEvent('UnitMoveFinished', UnitState, UnitState, NewGameState);

	//Return the game state we have created
	return NewGameState;
}

simulated function PA_BlazingPinionsStage1_BuildVisualization(XComGameState VisualizeGameState)
{
	local XComGameStateHistory History;
	local XComGameStateContext_Ability  AbilityContext;
	local StateObjectReference InteractingUnitRef;
	local X2AbilityTemplate AbilityTemplate;
	local VisualizationActionMetadata EmptyTrack, ActionMetadata;
	local X2Action_PlaySoundAndFlyOver SoundAndFlyover;
	local int i;
	local X2Action_MoveTurn MoveTurnAction;
	local X2Action_PlayAnimation PlayAnimation;

	History = `XCOMHISTORY;

	AbilityContext = XComGameStateContext_Ability(VisualizeGameState.GetContext());
	InteractingUnitRef = AbilityContext.InputContext.SourceObject;

	AbilityTemplate = class'XComGameState_Ability'.static.GetMyTemplateManager().FindAbilityTemplate(AbilityContext.InputContext.AbilityTemplateName);

	//****************************************************************************************
	//Configure the visualization track for the source
	//****************************************************************************************
	ActionMetadata = EmptyTrack;
	ActionMetadata.StateObject_OldState = History.GetGameStateForObjectID(InteractingUnitRef.ObjectID, eReturnType_Reference, VisualizeGameState.HistoryIndex - 1);
	ActionMetadata.StateObject_NewState = VisualizeGameState.GetGameStateForObjectID(InteractingUnitRef.ObjectID);
	ActionMetadata.VisualizeActor = History.GetVisualizer(InteractingUnitRef.ObjectID);

	SoundAndFlyOver = X2Action_PlaySoundAndFlyOver(class'X2Action_PlaySoundAndFlyover'.static.AddToVisualizationTree(ActionMetadata, AbilityContext));
	SoundAndFlyOver.SetSoundAndFlyOverParameters(None, AbilityTemplate.LocFlyOverText, '', eColor_Bad);

	// Turn to face the target action. The target location is the center of the ability's radius, stored in the 0 index of the TargetLocations
	MoveTurnAction = X2Action_MoveTurn(class'X2Action_MoveTurn'.static.AddToVisualizationTree(ActionMetadata, AbilityContext));
	MoveTurnAction.m_vFacePoint = AbilityContext.InputContext.TargetLocations[0];

	// Fly up actions
	class'X2VisualizerHelpers'.static.ParsePath(AbilityContext, ActionMetadata);

	// Play the animation to get him to his looping idle
	PlayAnimation = X2Action_PlayAnimation(class'X2Action_PlayAnimation'.static.AddToVisualizationTree(ActionMetadata, AbilityContext));
	PlayAnimation.Params.AnimName = 'HL_Devastate';
	
	for( i = 0; i < AbilityContext.ResultContext.ShooterEffectResults.Effects.Length; ++i )
	{
		AbilityContext.ResultContext.ShooterEffectResults.Effects[i].AddX2ActionsForVisualization(VisualizeGameState, ActionMetadata, 
																								  AbilityContext.ResultContext.ShooterEffectResults.ApplyResults[i]);
	}

	}

simulated function PA_BlazingPinionsStage1_BuildVisualizationSync( name EffectName, XComGameState VisualizeGameState, out VisualizationActionMetadata ActionMetadata )
{
	local X2Action_MoveTurn MoveTurnAction;
	local XComGameStateContext_Ability  AbilityContext;
	local X2AbilityTemplate AbilityTemplate;
	local X2Action_PlayAnimation PlayAnimation;
	local X2Action_MoveTeleport MoveTeleport;
	local PathingInputData PathingData;
	local PathingResultData ResultData;
	local vector PathEndPos;
	local int i, LastPathIndex;

	if (!`XENGINE.IsMultiplayerGame() && EffectName == 'BlazingPinionsStage1Delay')
	{
		AbilityContext = XComGameStateContext_Ability( VisualizeGameState.GetContext( ) );
		AbilityTemplate = class'X2AbilityTemplateManager'.static.GetAbilityTemplateManager().FindAbilityTemplate(AbilityContext.InputContext.AbilityTemplateName);

		//The unit may be dead when loading a save. Don't try to make the archon fly around if so
		if (XComGameState_Unit(ActionMetadata.StateObject_NewState).IsAlive())
		{
			// Turn to face the target action. The target location is the center of the ability's radius, stored in the 0 index of the TargetLocations
			MoveTurnAction = X2Action_MoveTurn(class'X2Action_MoveTurn'.static.AddToVisualizationTree(ActionMetadata, AbilityContext));
			MoveTurnAction.m_vFacePoint = AbilityContext.InputContext.TargetLocations[0];

			// Fly up actions
			PathingData = AbilityContext.InputContext.MovementPaths[0];
			ResultData = AbilityContext.ResultContext.PathResults[0];
			LastPathIndex = PathingData.MovementData.Length - 1;
			PathEndPos = PathingData.MovementData[LastPathIndex].Position;
			MoveTeleport = X2Action_MoveTeleport(class'X2Action_MoveTeleport'.static.AddToVisualizationTree(ActionMetadata, ABilityContext));
			MoveTeleport.ParsePathSetParameters(LastPathIndex, PathEndPos, 0, PathingData, ResultData);
			MoveTeleport.SnapToGround = false;

			// Play the animation to get him to his looping idle
			PlayAnimation = X2Action_PlayAnimation(class'X2Action_PlayAnimation'.static.AddToVisualizationTree(ActionMetadata, AbilityContext));
			PlayAnimation.Params.AnimName = 'HL_Devastate';
		}

		// The references to the shooter effect instances in the input context don't restore to be the references to the ability
		// template that they should.  Which is okay, we'll just use the effects directly.
		for (i = 0; i < AbilityTemplate.AbilityShooterEffects.Length; ++i)
		{
			AbilityTemplate.AbilityShooterEffects[ i ].AddX2ActionsForVisualization( VisualizeGameState, ActionMetadata,
				AbilityContext.ResultContext.ShooterEffectResults.ApplyResults[ i ] );
		}
	}
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

	Template.ModifyNewContextFn = PA_BlazingPinionsStage2_ModifyActivatedAbilityContext;
	Template.BuildNewGameStateFn = PA_BlazingPinionsStage2_BuildGameState;
	Template.BuildVisualizationFn = PA_BlazingPinionsStage2_BuildVisualization;
	Template.CinescriptCameraType = "Archon_BlazingPinions_Stage2";

	Template.LostSpawnIncreasePerUse = class'X2AbilityTemplateManager'.default.HeavyWeaponLostSpawnIncreasePerUse;
//BEGIN AUTOGENERATED CODE: Template Overrides 'ArchonKingBlazingPinionsStage2'
	Template.bFrameEvenWhenUnitIsHidden = true;
//END AUTOGENERATED CODE: Template Overrides 'ArchonKingBlazingPinionsStage2'

	return Template;
}

simulated function PA_BlazingPinionsStage2_ModifyActivatedAbilityContext(XComGameStateContext Context)
{
	local XComGameState_Unit UnitState;
	local XComGameStateContext_Ability AbilityContext;
	local XComGameStateHistory History;
	local TTile SelectedTile, LandingTile;
	local XComWorldData World;
	local vector TargetLocation, LandingLocation;
	local array<vector> FloorPoints;
	local int i;
	local X2AbilityMultiTargetStyle RadiusMultiTarget;
	local XComGameState_Ability AbilityState;
	local AvailableTarget MultiTargets;
	local PathingInputData InputData;
	local X2AbilityTemplate AbilityTemplate;
	local AvailableTarget kTarget;
	local name AvailableCode;

	History = `XCOMHISTORY;
	World = `XWORLD;

	AbilityContext = XComGameStateContext_Ability(Context);
	
	UnitState = XComGameState_Unit(History.GetGameStateForObjectID(AbilityContext.InputContext.SourceObject.ObjectID));

	// Find a valid landing location
	TargetLocation = World.GetPositionFromTileCoordinates(UnitState.TileLocation);

	LandingLocation = TargetLocation;
	LandingLocation.Z = World.GetFloorZForPosition(TargetLocation, true);
	LandingTile = World.GetTileCoordinatesFromPosition(LandingLocation);
	LandingTile = class'Helpers'.static.GetClosestValidTile(LandingTile);

	if( !World.CanUnitsEnterTile(LandingTile) )
	{
		// The selected tile is no longer valid. A new landing position
		// must be found. TODO: Decide what to do when FoundFloorPositions is false.
		World.GetFloorTilePositions(TargetLocation, World.WORLD_StepSize * default.PA_ArchonKing_BlazingPinions_TargetRadius, World.WORLD_StepSize, FloorPoints, true);

		i = 0;
		while( i < FloorPoints.Length )
		{
			LandingLocation = FloorPoints[i];
			LandingTile = World.GetTileCoordinatesFromPosition(LandingLocation);
			if( World.CanUnitsEnterTile(SelectedTile) )
			{
				// Found a valid landing location
				i = FloorPoints.Length;
			}

			++i;
		}
	}

	//Attempting to build a path to our current location causes a problem, so avoid that
	if(UnitState.TileLocation != LandingTile) 
	{
		// Build the MovementData for the path
		// solve the path to get him to the end location
		class'X2PathSolver'.static.BuildPath(UnitState, UnitState.TileLocation, LandingTile, InputData.MovementTiles, false);

		// get the path points
		class'X2PathSolver'.static.GetPathPointsFromPath(UnitState, InputData.MovementTiles, InputData.MovementData);

		// string pull the path to smooth it out
		class'XComPath'.static.PerformStringPulling(XGUnitNativeBase(UnitState.GetVisualizer()), InputData.MovementData);

		//Now add the path to the input context
		InputData.MovingUnitRef = UnitState.GetReference();
		AbilityContext.InputContext.MovementPaths.AddItem(InputData);
	}

	// Build the MultiTarget array based upon the impact points
	AbilityState = XComGameState_Ability(History.GetGameStateForObjectID(AbilityContext.InputContext.AbilityRef.ObjectID, eReturnType_Reference));
	RadiusMultiTarget = AbilityState.GetMyTemplate().AbilityMultiTargetStyle;// new class'X2AbilityMultiTarget_Radius';

	AbilityContext.ResultContext.ProjectileHitLocations.Length = 0;
	for( i = 0; i < AbilityContext.InputContext.TargetLocations.Length; ++i )
	{
		RadiusMultiTarget.GetMultiTargetsForLocation(AbilityState, AbilityContext.InputContext.TargetLocations[i], MultiTargets);

		// Add the TargetLocations as ProjectileHitLocations
		AbilityContext.ResultContext.ProjectileHitLocations.AddItem(AbilityContext.InputContext.TargetLocations[i]);
	}

	// Cull multi targets based on conditions
	AbilityTemplate = AbilityState.GetMyTemplate();
	for( i = MultiTargets.AdditionalTargets.Length - 1; i >= 0; --i )
	{
		AvailableCode = AbilityTemplate.CheckMultiTargetConditions(AbilityState, UnitState, History.GetGameStateForObjectID(MultiTargets.AdditionalTargets[i].ObjectID));
		if( AvailableCode != 'AA_Success' )
		{
			MultiTargets.AdditionalTargets.Remove(i, 1);
		}
	}
	AbilityContext.InputContext.MultiTargets = MultiTargets.AdditionalTargets;

	//Re-Calculate the chance to hit here because we had to get the MultiTargets above
	if( AbilityTemplate.AbilityToHitCalc != none )
	{
		kTarget.PrimaryTarget = AbilityContext.InputContext.PrimaryTarget;
		kTarget.AdditionalTargets = AbilityContext.InputContext.MultiTargets;
		AbilityTemplate.AbilityToHitCalc.RollForAbilityHit(AbilityState, kTarget, AbilityContext.ResultContext);
	}
}

simulated function XComGameState PA_BlazingPinionsStage2_BuildGameState(XComGameStateContext Context)
{
	local XComGameState NewGameState;
	local XComGameState_Unit UnitState;	
	local XComGameStateContext_Ability AbilityContext;
	local TTile LandingTile;
	local XComWorldData World;
	local X2EventManager EventManager;
	local vector LandingLocation;
	local int LastPathElement;

	World = `XWORLD;
	EventManager = `XEVENTMGR;

	//Build the new game state frame
	NewGameState = TypicalAbility_BuildGameState(Context);

	AbilityContext = XComGameStateContext_Ability(NewGameState.GetContext());	
	UnitState = XComGameState_Unit(NewGameState.ModifyStateObject(class'XComGameState_Unit', AbilityContext.InputContext.SourceObject.ObjectID));
	
	if(AbilityContext.InputContext.MovementPaths.Length > 0)
	{
		LastPathElement = AbilityContext.InputContext.MovementPaths[0].MovementData.Length - 1;

		// Move the unit vertically, set the unit's new location
		// The last position in MovementData will be the end location
		`assert(LastPathElement > 0);
		LandingLocation = AbilityContext.InputContext.MovementPaths[0].MovementData[LastPathElement /*- 1*/].Position;
		LandingTile = World.GetTileCoordinatesFromPosition(LandingLocation);
		UnitState.SetVisibilityLocation(LandingTile);

		AbilityContext.ResultContext.bPathCausesDestruction = MoveAbility_StepCausesDestruction(UnitState, AbilityContext.InputContext, 0, AbilityContext.InputContext.MovementPaths[0].MovementTiles.Length - 1);
		MoveAbility_AddTileStateObjects(NewGameState, UnitState, AbilityContext.InputContext, 0, AbilityContext.InputContext.MovementPaths[0].MovementTiles.Length - 1);
		EventManager.TriggerEvent('ObjectMoved', UnitState, UnitState, NewGameState);
		EventManager.TriggerEvent('UnitMoveFinished', UnitState, UnitState, NewGameState);
	}

	//Return the game state we have created
	return NewGameState;
}

simulated function PA_BlazingPinionsStage2_BuildVisualization(XComGameState VisualizeGameState)
{
	local XComGameStateHistory History;
	local XComGameStateContext_Ability  AbilityContext;
	local StateObjectReference InteractingUnitRef;
	local X2AbilityTemplate AbilityTemplate;
	local VisualizationActionMetadata EmptyTrack;
	local VisualizationActionMetadata ActionMetadata, ArchonTrack;
	local X2Action_PlaySoundAndFlyOver SoundAndFlyover;
	local X2Action_PersistentEffect	PersistentEffectAction;
	local int i, j;
	local X2VisualizerInterface TargetVisualizerInterface;

	local XComGameState_EnvironmentDamage EnvironmentDamageEvent;
	local XComGameState_WorldEffectTileData WorldDataUpdate;
	local XComGameState_InteractiveObject InteractiveObject;

	History = `XCOMHISTORY;

	AbilityContext = XComGameStateContext_Ability(VisualizeGameState.GetContext());
	InteractingUnitRef = AbilityContext.InputContext.SourceObject;

	AbilityTemplate = class'XComGameState_Ability'.static.GetMyTemplateManager().FindAbilityTemplate(AbilityContext.InputContext.AbilityTemplateName);

	//****************************************************************************************
	//Configure the visualization track for the source
	//****************************************************************************************
	ArchonTrack = EmptyTrack;
	ArchonTrack.StateObject_OldState = History.GetGameStateForObjectID(InteractingUnitRef.ObjectID, eReturnType_Reference, VisualizeGameState.HistoryIndex - 1);
	ArchonTrack.StateObject_NewState = VisualizeGameState.GetGameStateForObjectID(InteractingUnitRef.ObjectID);
	ArchonTrack.VisualizeActor = History.GetVisualizer(InteractingUnitRef.ObjectID);

	SoundAndFlyOver = X2Action_PlaySoundAndFlyOver(class'X2Action_PlaySoundAndFlyover'.static.AddToVisualizationTree(ArchonTrack, AbilityContext));
	SoundAndFlyOver.SetSoundAndFlyOverParameters(None, AbilityTemplate.LocFlyOverText, '', eColor_Bad);

	// Remove the override idle animation
	PersistentEffectAction = X2Action_PersistentEffect(class'X2Action_PersistentEffect'.static.AddToVisualizationTree(ArchonTrack, AbilityContext));
	PersistentEffectAction.IdleAnimName = '';

	// Play the firing action
	class'X2Action_BlazingPinionsStage2'.static.AddToVisualizationTree(ArchonTrack, AbilityContext);

	for( i = 0; i < AbilityContext.ResultContext.ShooterEffectResults.Effects.Length; ++i )
	{
		AbilityContext.ResultContext.ShooterEffectResults.Effects[i].AddX2ActionsForVisualization(VisualizeGameState, ArchonTrack, 
																								  AbilityContext.ResultContext.ShooterEffectResults.ApplyResults[i]);
	}

	if(AbilityContext.InputContext.MovementPaths.Length > 0)
	{
		class'X2VisualizerHelpers'.static.ParsePath(AbilityContext, ArchonTrack);
	}	
	//****************************************************************************************

	//****************************************************************************************
	//Configure the visualization track for the targets
	//****************************************************************************************
	for (i = 0; i < AbilityContext.InputContext.MultiTargets.Length; ++i)
	{
		InteractingUnitRef = AbilityContext.InputContext.MultiTargets[i];
		ActionMetadata = EmptyTrack;
		ActionMetadata.StateObject_OldState = History.GetGameStateForObjectID(InteractingUnitRef.ObjectID, eReturnType_Reference, VisualizeGameState.HistoryIndex - 1);
		ActionMetadata.StateObject_NewState = VisualizeGameState.GetGameStateForObjectID(InteractingUnitRef.ObjectID);
		ActionMetadata.VisualizeActor = History.GetVisualizer(InteractingUnitRef.ObjectID);

		class'X2Action_WaitForAbilityEffect'.static.AddToVisualizationTree(ActionMetadata, AbilityContext);
		for( j = 0; j < AbilityContext.ResultContext.MultiTargetEffectResults[i].Effects.Length; ++j )
		{
			AbilityContext.ResultContext.MultiTargetEffectResults[i].Effects[j].AddX2ActionsForVisualization(VisualizeGameState, ActionMetadata, AbilityContext.ResultContext.MultiTargetEffectResults[i].ApplyResults[j]);
		}

		TargetVisualizerInterface = X2VisualizerInterface(ActionMetadata.VisualizeActor);
		if( TargetVisualizerInterface != none )
		{
			//Allow the visualizer to do any custom processing based on the new game state. For example, units will create a death action when they reach 0 HP.
			TargetVisualizerInterface.BuildAbilityEffectsVisualization(VisualizeGameState, ActionMetadata);
		}
	}

	//****************************************************************************************
	//Configure the visualization tracks for the environment
	//****************************************************************************************
	foreach VisualizeGameState.IterateByClassType(class'XComGameState_EnvironmentDamage', EnvironmentDamageEvent)
	{
		ActionMetadata = EmptyTrack;
		ActionMetadata.VisualizeActor = none;
		ActionMetadata.StateObject_NewState = EnvironmentDamageEvent;
		ActionMetadata.StateObject_OldState = EnvironmentDamageEvent;

		//Wait until signaled by the shooter that the projectiles are hitting
		class'X2Action_WaitForAbilityEffect'.static.AddToVisualizationTree(ActionMetadata, AbilityContext);

		for( i = 0; i < AbilityTemplate.AbilityMultiTargetEffects.Length; ++i )
		{
			AbilityTemplate.AbilityMultiTargetEffects[i].AddX2ActionsForVisualization(VisualizeGameState, ActionMetadata, 'AA_Success');	
		}

			}

	foreach VisualizeGameState.IterateByClassType(class'XComGameState_WorldEffectTileData', WorldDataUpdate)
	{
		ActionMetadata = EmptyTrack;
		ActionMetadata.VisualizeActor = none;
		ActionMetadata.StateObject_NewState = WorldDataUpdate;
		ActionMetadata.StateObject_OldState = WorldDataUpdate;

		//Wait until signaled by the shooter that the projectiles are hitting
		class'X2Action_WaitForAbilityEffect'.static.AddToVisualizationTree(ActionMetadata, AbilityContext);

		for( i = 0; i < AbilityTemplate.AbilityMultiTargetEffects.Length; ++i )
		{
			AbilityTemplate.AbilityMultiTargetEffects[i].AddX2ActionsForVisualization(VisualizeGameState, ActionMetadata, 'AA_Success');	
		}

			}
	//****************************************************************************************

	//Process any interactions with interactive objects
	foreach VisualizeGameState.IterateByClassType(class'XComGameState_InteractiveObject', InteractiveObject)
	{
		// Add any doors that need to listen for notification
		if( InteractiveObject.IsDoor() && InteractiveObject.HasDestroyAnim() && InteractiveObject.InteractionCount % 2 != 0 ) //Is this a closed door?
		{
			ActionMetadata = EmptyTrack;
			//Don't necessarily have a previous state, so just use the one we know about
			ActionMetadata.StateObject_OldState = InteractiveObject;
			ActionMetadata.StateObject_NewState = InteractiveObject;
			ActionMetadata.VisualizeActor = History.GetVisualizer(InteractiveObject.ObjectID);
			class'X2Action_WaitForAbilityEffect'.static.AddToVisualizationTree(ActionMetadata, AbilityContext);
			class'X2Action_BreakInteractActor'.static.AddToVisualizationTree(ActionMetadata, AbilityContext);

					}
	}

	TypicalAbility_AddEffectRedirects(VisualizeGameState, ArchonTrack);
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
		return;
	}

	// pan to the panicking unit (but only if it isn't a civilian)
	UnitState = XComGameState_Unit(ActionMetadata.StateObject_NewState);
	if (UnitState == none)
		return;

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
}