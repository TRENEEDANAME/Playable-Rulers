class PA_BerserkerQueenTech extends X2StrategyElement config(PlayableAdvent);

var config int BerserkerQueenTech_Days;
var config int BerserkerQueenTech_SupplyCost;
var config int BerserkerQueenTech_CorpseCost;
var config int BerserkerQueenTech_CoreCost;
var config array<name> BerserkerQueenTech_RequiredTech;
var config name BerserkerQueenTech_RequiredCorpse;

var config(GameData) bool IsBerserkerQueenActive;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Techs;

	Techs.AddItem(CreatePA_BerserkerQueen_TechTemplate());
	Techs.AddItem(CreateBerserkerQueenReanimationResearch());

	return Techs;
}

static function X2DataTemplate CreatePA_BerserkerQueen_TechTemplate()

{

	local X2TechTemplate Template;
	local ArtifactCost Artifacts;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'PA_BerserkerQueen_Tech');
	Template.bProvingGround = true;
	Template.bRepeatable = false;
	Template.strImage = "img:///UILibrary_DLC2Images.LOOT_BerserkerQueen";
	Template.SortingTier = 1;
	Template.ResearchCompletedFn = ResearchCompleted;
	Template.PointsToComplete = class'X2StrategyElement_DefaultTechs'.static.StafferXDays(1, default.BerserkerQueenTech_Days);
	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = default.BerserkerQueenTech_SupplyCost;
	Template.Cost.ResourceCosts.AddItem(Resources);
	Artifacts.ItemTemplateName = 'EleriumCore';
	Artifacts.ItemTemplateName = 'CorpseBerserkerQueen';
	Artifacts.Quantity = default.BerserkerQueenTech_CoreCost;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);
	Template.Requirements.RequiredTechs.AddItem('BerserkerQueenReanimationResearch');
	
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

	CharTemplate = CharTemplateManager.FindCharacterTemplate('PA_BerserkerQueen');
	UnitState = CharTemplate.CreateInstanceFromTemplate(NewGameState);
	
	CharGen = `XCOMGAME.spawn( class 'XGCharacterGenerator_BerserkerQueen' );
	CharGen.GenerateName(0, 'Country_Spark', strFirst, strLast);
	UnitState.SetCharacterName(strFirst, strLast, "");
	UnitState.SetCountry('Country_Spark');
	NewGameState.AddStateObject(UnitState);
	UnitState.kAppearance.iGender = 1;
	UnitState.StoreAppearance();
	return UnitState;
}

static function X2DataTemplate CreateBerserkerQueenReanimationResearch()
{
	local X2TechTemplate Template;
	local ArtifactCost Artifacts;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'BerserkerQueenReanimationResearch');
	Template.PointsToComplete = 8000;
	Template.bJumpToLabs = true;
	Template.bAutopsy = true;
	Template.IsPriorityFn = class'X2StrategyElement_DefaultTechs'.static.AlwaysPriority;
	Template.SortingTier = 3;
	Template.strImage = "img:///UILibrary_DLC2Images.IC_AutopsyBerserkerQueen";

	Template.Requirements.RequiredItems.AddItem('CorpseBerserkerQueen');

	return Template;
}