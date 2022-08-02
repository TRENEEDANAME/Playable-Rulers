class X2Item_AlienBossesWeapons_Schematics extends X2Item config(GameData_SchematicCost);

// Variable for the schematic cost of the conventional Bolt Caster
var config int SupplyCost_BoltCaster_CV;

// Variable for the schematic cost of the magnetic Bolt Caster
var config int SupplyCost_BoltCaster_MG;
var config int AlloyCost_BoltCaster_MG;

// Variable for the schematic cost of the plasma Bolt Caster
var config int SupplyCost_BoltCaster_BM;
var config int AlloyCost_BoltCaster_BM;
var config int EleriumDustCost_BoltCaster_BM;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Schematics;

	// Weapon Schematics
	Schematics.AddItem(CreateTemplate_PARulers_BoltCaster_CV_Schematic());
	Schematics.AddItem(CreateTemplate_PARulers_BoltCaster_MG_Schematic());
	Schematics.AddItem(CreateTemplate_PARulers_BoltCaster_BM_Schematic());


	return Schematics;
}

static function X2DataTemplate CreateTemplate_PARulers_BoltCaster_CV_Schematic()
{
	local X2SchematicTemplate Template;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2SchematicTemplate', Template, 'PARulers_BoltCaster_CV_Schematic');

	Template.ItemCat = 'weapon';
	Template.strImage = "img:///UILibrary_DLC2Images.ConvBoltCaster";
	Template.PointsToComplete = 0;
	Template.Tier = 0;
	Template.OnBuiltFn = class'X2Item_DefaultSchematics'.static.GiveItems;
	Template.bSquadUpgrade = false;

	// Items to Reward
	Template.ItemRewards.AddItem('AlienHunterRifle_CV');
    Template.ItemRewards.AddItem('PARulers_BoltCaster_CV');
	Template.ReferenceItemTemplate = 'AlienHunterRifle_CV';

	// Requirements
	Template.Requirements.SpecialRequirementsFn = PA_ConventionalHunterWeaponsAvailable;

	// Cost
	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = default.SupplyCost_BoltCaster_CV;
	Template.Cost.ResourceCosts.AddItem(Resources);

	return Template;
}

static function X2DataTemplate CreateTemplate_PARulers_BoltCaster_MG_Schematic()
{
	local X2SchematicTemplate Template;
	local StrategyRequirement AltReq;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2SchematicTemplate', Template, 'PARulers_BoltCaster_MG_Schematic');

	Template.ItemCat = 'weapon';
	Template.strImage = "img:///UILibrary_DLC2Images.MagBoltCaster";
	Template.PointsToComplete = 0;
	Template.Tier = 1;
	Template.OnBuiltFn = class'X2Item_DefaultSchematics'.static.UpgradeItems;
	Template.bSquadUpgrade = false;

	// Reference Item
	Template.ReferenceItemTemplate = 'AlienHunterRifle_MG';
	Template.HideIfPurchased = 'HunterRifle_BM_Schematic';

	// Narrative Requirements
	Template.Requirements.RequiredTechs.AddItem('MagnetizedWeapons');
	Template.Requirements.RequiredEquipment.AddItem('AlienHunterRifle_CV');
	Template.Requirements.RequiredEngineeringScore = 10;
	Template.Requirements.bVisibleIfPersonnelGatesNotMet = true;
	Template.Requirements.SpecialRequirementsFn = PA_AlienHuntersNarrativeComplete;
	
	// Non-Narrative Requirements
	AltReq.RequiredItems.AddItem('HunterRifle_CV_Schematic');
	AltReq.RequiredEquipment.AddItem('AlienHunterRifle_CV');
	AltReq.RequiredTechs.AddItem('MagnetizedWeapons');
	AltReq.RequiredEngineeringScore = 10;
	AltReq.bVisibleIfPersonnelGatesNotMet = true;
	Template.AlternateRequirements.AddItem(AltReq);

	// Cost
	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = default.SupplyCost_BoltCaster_MG;
	Template.Cost.ResourceCosts.AddItem(Resources);

	Resources.ItemTemplateName = 'AlienAlloy';
	Resources.Quantity = default.AlloyCost_BoltCaster_MG;
	Template.Cost.ResourceCosts.AddItem(Resources);

	return Template;
}

static function X2DataTemplate CreateTemplate_PARulers_BoltCaster_BM_Schematic()
{
	local X2SchematicTemplate Template;
	local StrategyRequirement AltReq;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2SchematicTemplate', Template, 'PARulers_BoltCaster_BM_Schematic');

	Template.ItemCat = 'weapon';
	Template.strImage = "img:///UILibrary_DLC2Images.BeamBoltCaster";
	Template.PointsToComplete = 0;
	Template.Tier = 3;
	Template.OnBuiltFn = class'X2Item_DefaultSchematics'.static.UpgradeItems;
	Template.bSquadUpgrade = false;

	// Reference Item
	Template.ReferenceItemTemplate = 'AlienHunterRifle_BM';

	// Narrative Requirements
	Template.Requirements.RequiredTechs.AddItem('PlasmaRifle');
	Template.Requirements.RequiredEquipment.AddItem('AlienHunterRifle_CV');
	Template.Requirements.RequiredEquipment.AddItem('AlienHunterRifle_MG');
	Template.Requirements.bDontRequireAllEquipment = true;
	Template.Requirements.RequiredEngineeringScore = 20;
	Template.Requirements.bVisibleIfPersonnelGatesNotMet = true;
	Template.Requirements.SpecialRequirementsFn = PA_AlienHuntersNarrativeComplete;

	// Non-Narrative Requirements
	AltReq.RequiredItems.AddItem('HunterRifle_CV_Schematic');
	AltReq.RequiredEquipment.AddItem('AlienHunterRifle_CV');
	AltReq.RequiredEquipment.AddItem('AlienHunterRifle_MG');
	AltReq.bDontRequireAllEquipment = true;
	AltReq.RequiredTechs.AddItem('PlasmaRifle');
	AltReq.RequiredEngineeringScore = 20;
	AltReq.bVisibleIfPersonnelGatesNotMet = true;
	Template.AlternateRequirements.AddItem(AltReq);

	// Cost
	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = default.SupplyCost_BoltCaster_BM;
	Template.Cost.ResourceCosts.AddItem(Resources);

	Resources.ItemTemplateName = 'AlienAlloy';
	Resources.Quantity = default.AlloyCost_BoltCaster_BM;
	Template.Cost.ResourceCosts.AddItem(Resources);

	Resources.ItemTemplateName = 'EleriumDust';
	Resources.Quantity = default.EleriumDustCost_BoltCaster_BM;
	Template.Cost.ResourceCosts.AddItem(Resources);

	return Template;
}

static function bool PA_ConventionalHunterWeaponsAvailable()
{
	local XComGameState_CampaignSettings CampaignSettings;

	CampaignSettings = XComGameState_CampaignSettings(`XCOMHISTORY.GetSingleGameStateObjectForClass(class'XComGameState_CampaignSettings'));

	if (CampaignSettings.HasIntegratedDLCEnabled())
	{
		return false; // Conventional AH Weapons are not displayed if XPack Integration is turned on
	}

	// Otherwise check if the narrative has been disabled
	return (!CampaignSettings.HasOptionalNarrativeDLCEnabled(name(class'X2DownloadableContentInfo_DLC_Day60'.default.DLCIdentifier)));
}

static function bool PA_AlienHuntersNarrativeComplete()
{
	local XComGameState_CampaignSettings CampaignSettings;

	CampaignSettings = XComGameState_CampaignSettings(`XCOMHISTORY.GetSingleGameStateObjectForClass(class'XComGameState_CampaignSettings'));

	if (CampaignSettings.HasOptionalNarrativeDLCEnabled(name(class'X2DownloadableContentInfo_DLC_Day60'.default.DLCIdentifier)))
	{
		if (class'XComGameState_HeadquartersXCom'.static.IsObjectiveCompleted('DLC_AlienNestMissionComplete'))
		{
			return true;
		}
}
	return false;
}