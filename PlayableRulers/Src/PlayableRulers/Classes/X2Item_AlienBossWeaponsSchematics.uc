class X2Item_AlienBossWeaponsSchematics extends X2Item config(StrategyTuning);

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Schematics;

		Schematics.AddItem(CreateTemplate_PARulers_BoltCaster_CV_Schematic());
		Schematics.AddItem(CreateTemplate_PARulers_BoltCaster_MG_Schematic());
		Schematics.AddItem(CreateTemplate_PARulers_BoltCaster_BM_Schematic());

	return Schematics;
}

static function X2DataTemplate CreateTemplate_PARulers_BoltCaster_CV_Schematic()
{
	local X2SchematicTemplate Template;

	`CREATE_X2TEMPLATE(class'X2SchematicTemplate', Template, 'PARulers_BoltCaster_CV_Schematic');

	Template.ItemCat = 'weapon';
	Template.strImage = "img:///UILibrary_DLC2Images.ConvBoltCaster";
	Template.PointsToComplete = 0;
	Template.Tier = 0;
	Template.OnBuiltFn = class'X2Item_DefaultSchematics'.static.GiveItems;
	Template.bSquadUpgrade = false;

	// Items to Reward
	Template.ItemRewards.AddItem('PARulers_BoltCaster_CV');
	Template.ReferenceItemTemplate = 'PARulers_BoltCaster_CV';

	// Requirements
	Template.Requirements.SpecialRequirementsFn = PA_Rulers_AreConventionalHunterWeaponsAvailable;
	Template.Requirements.RequiredEquipment.AddItem('AlienBoltCasterCV');

	return Template;
}

static function X2DataTemplate CreateTemplate_PARulers_BoltCaster_MG_Schematic()
{
	local X2SchematicTemplate Template;
	local StrategyRequirement AltReq;

	`CREATE_X2TEMPLATE(class'X2SchematicTemplate', Template, 'PARulers_BoltCaster_MG_Schematic');

	Template.ItemCat = 'weapon';
	Template.strImage = "img:///UILibrary_DLC2Images.MagBoltCaster";
	Template.PointsToComplete = 0;
	Template.Tier = 1;
	Template.OnBuiltFn = class'X2Item_DefaultSchematics'.static.UpgradeItems;
	Template.bSquadUpgrade = false;

	// Reference Item
	Template.ReferenceItemTemplate = 'PARulers_BoltCaster_MG';

	// Narrative Requirements
	Template.Requirements.RequiredEquipment.AddItem('PARulers_BoltCaster_CV');
	Template.Requirements.SpecialRequirementsFn = PA_Rulers_IsAlienHuntersNarrativeContentComplete;
	Template.Requirements.RequiredTechs.AddItem('MagnetizedWeapons');

	// Non-Narrative Requirements
	Template.AlternateRequirements.AddItem(AltReq);
	AltReq.RequiredItems.AddItem('PARulers_BoltCaster_CV');
	AltReq.RequiredTechs.AddItem('MagnetizedWeapons');

	return Template;
}

static function X2DataTemplate CreateTemplate_PARulers_BoltCaster_BM_Schematic()
{
	local X2SchematicTemplate Template;
	local StrategyRequirement AltReq;
	
	`CREATE_X2TEMPLATE(class'X2SchematicTemplate', Template, 'PARulers_BoltCaster_BM_Schematic');

	Template.ItemCat = 'weapon';
	Template.strImage = "img:///UILibrary_DLC2Images.BeamBoltCaster";
	Template.PointsToComplete = 0;
	Template.Tier = 3;
	Template.OnBuiltFn = class'X2Item_DefaultSchematics'.static.UpgradeItems;
	Template.bSquadUpgrade = false;

	// Reference Item
	Template.ReferenceItemTemplate = 'PARulers_BoltCaster_BM';

	// Narrative Requirements
	Template.Requirements.RequiredEquipment.AddItem('PARulers_BoltCaster_MG');
	Template.Requirements.SpecialRequirementsFn = PA_Rulers_IsAlienHuntersNarrativeContentComplete;
	Template.Requirements.RequiredTechs.AddItem('PlasmaRifle');

	// Non-Narrative Requirements
	AltReq.RequiredEquipment.AddItem('PARulers_BoltCaster_MG');
	AltReq.RequiredTechs.AddItem('PlasmaRifle');

	return Template;
}

static function bool PA_Rulers_IsAlienHuntersNarrativeContentComplete()
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

	
}

static function bool PA_Rulers_AreConventionalHunterWeaponsAvailable()
{
    local XComGameState_HeadquartersXCom XcomHQ;

    XcomHQ = XComGameState_HeadquartersXCom(`XCOMHISTORY.GetSingleGameStateObjectForClass(class'XComGameState_HeadquartersXCom'));

    if (XcomHQ.EverAcquiredInventoryTypes.Find('AlienHunterRifle_CV') != INDEX_NONE )
    {
        return true;
    }

    
}