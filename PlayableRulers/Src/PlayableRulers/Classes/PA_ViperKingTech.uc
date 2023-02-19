class PA_ViperKingTech extends X2StrategyElement config(PlayableAdvent);

var config int ViperKingTech_Days;
var config int ViperKingTech_SupplyCost;
var config int ViperKingTech_CorpseCost;
var config int ViperKingTech_CoreCost;
var config array<name> ViperKingTech_RequiredTech;
var config name ViperKingTech_RequiredCorpse;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Techs;
		
	Techs.AddItem(CreatePA_ViperKing_TechTemplate());
	Techs.AddItem(CreateViperKingReanimationResearch());
	
	return Techs;
}

static function X2DataTemplate CreatePA_ViperKing_TechTemplate()
{

	local X2TechTemplate Template;
	local ArtifactCost Artifacts;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'PA_ViperKing_Tech');
	Template.bProvingGround = true;
	Template.bRepeatable = false;
	Template.strImage = "img:///UILibrary_DLC2Images.LOOT_ViperKing";
	Template.SortingTier = 1;
	Template.ResearchCompletedFn = ResearchCompleted;
	Template.PointsToComplete = class'X2StrategyElement_DefaultTechs'.static.StafferXDays(1, default.ViperKingTech_Days);
		Resources.ItemTemplateName = 'Supplies';
		Resources.Quantity = default.ViperKingTech_SupplyCost;
		Template.Cost.ResourceCosts.AddItem(Resources);
		Artifacts.ItemTemplateName = 'EleriumCore';
		Artifacts.ItemTemplateName = 'CorpseViperKing';
		Artifacts.Quantity = default.ViperKingTech_CoreCost;
		Template.Cost.ArtifactCosts.AddItem(Artifacts);
		Template.Requirements.RequiredTechs.AddItem('ViperKingReanimationResearch');
	return Template;
}

function ResearchCompleted(XComGameState NewGameState, XComGameState_Tech TechState)
{
	local XComGameStateHistory History;
	local XComGameState_HeadquartersXCom XComHQ;
	local XComGameState_Unit UnitState;

	History = `XCOMHISTORY;
	XComHQ = XComGameState_HeadquartersXCom(History.GetSingleGameStateObjectForClass(class'XComGameState_HeadquartersXCom'));
	XComHQ = XComGameState_HeadquartersXCom(NewGameState.CreateStateObject(class'XComGameState_HeadquartersXCom', XComHQ.ObjectID));
	NewGameState.AddStateObject(XComHQ);
	UnitState = CreateUnit(NewGameState);
	NewGameState.AddStateObject(UnitState);
	XComHQ.AddToCrew(NewGameState, UnitState);
	UnitState.SetHQLocation(eSoldierLoc_Barracks);
	XcomHQ.HandlePowerOrStaffingChange(NewGameState);
}


static function XComGameState_Unit CreateUnit(XComGameState NewGameState)
{
	local XComGameStateHistory History;
	local XComGameState_HeadquartersXCom XComHQ;
	local XComGameState_Unit UnitState;
	local X2CharacterTemplateManager CharTemplateManager;
	local X2CharacterTemplate CharTemplate;
	local XGCharacterGenerator CharGen;
	local string strFirst, strLast;

	History = `XCOMHISTORY;
	XComHQ = XComGameState_HeadquartersXCom(History.GetSingleGameStateObjectForClass(class'XComGameState_HeadquartersXCom'));
	XComHQ = XComGameState_HeadquartersXCom(NewGameState.CreateStateObject(class'XComGameState_HeadquartersXCom', XComHQ.ObjectID));
	CharTemplateManager = class'X2CharacterTemplateManager'.static.GetCharacterTemplateManager();

	CharTemplate = CharTemplateManager.FindCharacterTemplate('PA_ViperKing');
	UnitState = CharTemplate.CreateInstanceFromTemplate(NewGameState);

	CharGen = `XCOMGAME.spawn( class 'XGCharacterGenerator_ViperKing' );
	CharGen.GenerateName(0, 'Country_Spark', strFirst, strLast);
	UnitState.SetCharacterName(strFirst, strLast, "");
	UnitState.SetCountry('Country_Spark');
	NewGameState.AddStateObject(UnitState);
	UnitState.kAppearance.iGender = 1;
	UnitState.StoreAppearance();

	return UnitState;
}

static function X2DataTemplate CreateViperKingReanimationResearch()
{
	local X2TechTemplate Template;
	local ArtifactCost Artifacts;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'ViperKingReanimationResearch');
	Template.PointsToComplete = 8000;
	Template.bJumpToLabs = true;
	Template.bAutopsy = true;
	Template.IsPriorityFn = class'X2StrategyElement_DefaultTechs'.static.AlwaysPriority;
	Template.SortingTier = 3;
	Template.strImage = "img:///UILibrary_DLC2Images.IC_AutopsyViperKing";

	Template.Requirements.RequiredItems.AddItem('CorpseViperKing');

	return Template;
}