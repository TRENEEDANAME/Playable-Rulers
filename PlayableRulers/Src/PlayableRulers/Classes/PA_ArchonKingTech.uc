class PA_ArchonKingTech extends X2StrategyElement config(PlayableAdvent);

var config int ArchonKingTech_Days;
var config int ArchonKingTech_SupplyCost;
var config int ArchonKingTech_CorpseCost;
var config int ArchonKingTech_CoreCost;
var config array<name> ArchonKingTech_RequiredTech;
var config name ArchonKingTech_RequiredCorpse;
var config(GameData) bool IsArchonKingActive;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Techs;

	Techs.AddItem(CreatePA_ArchonKing_TechTemplate());
	Techs.AddItem(CreateArchonKingReanimationResearch());

	return Techs;
}

static function X2DataTemplate CreatePA_ArchonKing_TechTemplate()
{

	local X2TechTemplate Template;
	local ArtifactCost Artifacts;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'PA_ArchonKing_Tech');
	Template.bProvingGround = true;
	Template.bRepeatable = false;
	Template.strImage = "img:///UILibrary_DLC2Images.LOOT_ArchonKingv";
	Template.SortingTier = 1;
	Template.ResearchCompletedFn = ResearchCompleted;
	Template.PointsToComplete = class'X2StrategyElement_DefaultTechs'.static.StafferXDays(1, default.ArchonKingTech_Days);
	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = default.ArchonKingTech_SupplyCost;
	Template.Cost.ResourceCosts.AddItem(Resources);
	Artifacts.ItemTemplateName = 'CorpseArchonKing';
	Artifacts.ItemTemplateName = 'EleriumCore';
	Artifacts.Quantity = default.ArchonKingTech_CorpseCost;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);
	Template.Requirements.RequiredTechs.AddItem('ArchonKingReanimationResearch');

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

	CharTemplate = CharTemplateManager.FindCharacterTemplate('PA_ArchonKing');
	UnitState = CharTemplate.CreateInstanceFromTemplate(NewGameState);
	
	CharGen = `XCOMGAME.spawn( class 'XGCharacterGenerator_ArchonKing' );
	CharGen.GenerateName(0, 'Country_Spark', strFirst, strLast);
	UnitState.SetCharacterName(strFirst, strLast, "");
	UnitState.SetCountry('Country_Spark');
	NewGameState.AddStateObject(UnitState);
	UnitState.kAppearance.iGender = 1;
	UnitState.StoreAppearance();
	return UnitState;
}

static function X2DataTemplate CreateArchonKingReanimationResearch()
{
	local X2TechTemplate Template;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'ArchonKingReanimationResearch');
	Template.PointsToComplete = 8000;
	Template.bJumpToLabs = true;
	Template.bAutopsy = true;
	Template.IsPriorityFn = class'X2StrategyElement_DefaultTechs'.static.AlwaysPriority;
	Template.SortingTier = 3;
	Template.strImage = "img:///UILibrary_DLC2Images.IC_AutopsyArchonKing";

	Template.Requirements.RequiredItems.AddItem('CorpseArchonKing');

	return Template;
}