class X2Ability_PlayableRulers_ItemGrantedAbility extends X2Ability config(PlayableAdvent);

var config int PA_BerserkerQueen_Plated_HealthBonus;
var config int PA_BerserkerQueen_Plated_MobilityBonus;
var config int PA_BerserkerQueen_Plated_ArmorBonus;
var config int PA_BerserkerQueen_Plated_ArmorChanceBonus;

var config int PA_BerserkerQueen_Powered_HealthBonus;
var config int PA_BerserkerQueen_Powered_MobilityBonus;
var config int PA_BerserkerQueen_Powered_ArmorBonus;
var config int PA_BerserkerQueen_Powered_ArmorChanceBonus;

/// <summary>
/// Creates the set of abilities granted to units through their equipped items in X-Com 2
/// </summary>
static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;

	Templates.AddItem(PlatedBerserkerQueenArmorStats());
	Templates.AddItem(PoweredBerserkerQueenArmorStats());

	return Templates;
}

static function X2AbilityTemplate PlatedBerserkerQueenArmorStats()
{
	local X2AbilityTemplate                 Template;
	local X2AbilityTrigger					Trigger;
	local X2AbilityTarget_Self				TargetStyle;
	local X2Effect_PersistentStatChange		PersistentStatChangeEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'PlatedBerserkerQueenArmorStats_Ability');
	Template.RemoveTemplateAvailablility(Template.BITFIELD_GAMEAREA_Multiplayer);
	// Template.IconImage  -- no icon needed for armor stats

	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = false;

	Template.AbilityToHitCalc = default.DeadEye;

	TargetStyle = new class'X2AbilityTarget_Self';
	Template.AbilityTargetStyle = TargetStyle;

	Trigger = new class'X2AbilityTrigger_UnitPostBeginPlay';
	Template.AbilityTriggers.AddItem(Trigger);

	// giving health here; medium plated doesn't have mitigation
	//
	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	// PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Passive, default.MediumPlatedHealthBonusName, default.MediumPlatedHealthBonusDesc, Template.IconImage);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_HP, default.PA_BerserkerQueen_Plated_HealthBonus);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Mobility, default.PA_BerserkerQueen_Plated_MobilityBonus);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_ArmorChance, default.PA_BerserkerQueen_Plated_ArmorChanceBonus);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_ArmorMitigation, default.PA_BerserkerQueen_Plated_ArmorBonus);
	Template.AddTargetEffect(PersistentStatChangeEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;
}

static function X2AbilityTemplate PoweredBerserkerQueenArmorStats()
{
	local X2AbilityTemplate                 Template;
	local X2AbilityTrigger					Trigger;
	local X2AbilityTarget_Self				TargetStyle;
	local X2Effect_PersistentStatChange		PersistentStatChangeEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'PoweredBerserkerQueenArmorStats_Ability');
	Template.RemoveTemplateAvailablility(Template.BITFIELD_GAMEAREA_Multiplayer);
	// Template.IconImage  -- no icon needed for armor stats

	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = false;

	Template.AbilityToHitCalc = default.DeadEye;

	TargetStyle = new class'X2AbilityTarget_Self';
	Template.AbilityTargetStyle = TargetStyle;

	Trigger = new class'X2AbilityTrigger_UnitPostBeginPlay';
	Template.AbilityTriggers.AddItem(Trigger);

	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	// PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Passive, default.MediumPlatedHealthBonusName, default.MediumPlatedHealthBonusDesc, Template.IconImage);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_HP, default.PA_BerserkerQueen_Powered_HealthBonus);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Mobility, default.PA_BerserkerQueen_Powered_MobilityBonus);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_ArmorChance, default.PA_BerserkerQueen_Powered_ArmorChanceBonus);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_ArmorMitigation, default.PA_BerserkerQueen_Powered_ArmorBonus);
	Template.AddTargetEffect(PersistentStatChangeEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;
}