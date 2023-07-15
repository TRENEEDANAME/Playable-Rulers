class X2Item_PlayableRulersArmor extends X2Item config(GameData_ArmorData);

var config int PA_FaithBreakerStrength_T1, PA_FaithBreakerStrength_T2, PA_FaithBreakerStrength_T3;
var config WeaponDamageValue PA_BerserkerFistStrength_T1, PA_BerserkerFistStrength_T2, PA_BerserkerFistStrength_T3;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Armors;

		Armors.AddItem(Create_BerserkerArmor());
		Armors.AddItem(Create_PlatedBerserkerArmor());
		Armors.AddItem(Create_PoweredBerserkerArmor());

	return Armors;
}

static function X2DataTemplate Create_BerserkerArmor()
{
	local X2BQArmorTemplate Template;

	`CREATE_X2TEMPLATE(class'X2BQArmorTemplate', Template, 'BerserkerQueenArmor');
	Template.strImage = "img:///UILibrary_DLC3Images.Inv_Spark_Conventional_A";

	Template.StartingItem = true;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = true;
	Template.ArmorTechCat = 'conventional';
	Template.ArmorCat = 'BerserkerQueenArmorCat';
	Template.Tier = 0;
	Template.AkAudioSoldierArmorSwitch = 'Conventional';
	Template.EquipSound = "StrategyUI_Armor_Equip_Conventional_Spark";

	Template.FaithBreaker = default.PA_FaithBreakerStrength_T1;
	Template.FistDamage = default.PA_BerserkerFistStrength_T1;
	
	return Template;
}

static function X2DataTemplate Create_PlatedBerserkerArmor()
{
	local X2BQArmorTemplate Template;

	`CREATE_X2TEMPLATE(class'X2BQArmorTemplate', Template, 'PlatedBerserkerQueenArmor');
	Template.strImage = "img:///UILibrary_DLC2Images.Inv_RageSuit";
	Template.ItemCat = 'armor';
	Template.StartingItem = false;
	Template.CanBeBuilt = true;
	Template.bInfiniteItem = true;
	Template.PointsToComplete = 200;
	Template.Abilities.AddItem('PlatedBerserkerQueenArmorStats_Ability');
	Template.ArmorTechCat = 'plated';
	Template.ArmorCat = 'BerserkerQueenArmorCat';
	Template.Tier = 1;
	Template.AkAudioSoldierArmorSwitch = 'Predator';
	Template.EquipSound = "StrategyUI_Armor_Equip_Plated_Spark";

	Template.CreatorTemplateName = 'PlatedBerserkerQueenArmor_Schematic'; // The schematic which creates this item
	Template.BaseItem = 'BerserkerQueenArmor'; // Which item this will be upgraded from

	Template.FaithBreaker = default.PA_FaithBreakerStrength_T2;
	Template.FistDamage = default.PA_BerserkerFistStrength_T2;

    return Template;
}

static function X2DataTemplate Create_PoweredBerserkerArmor()
{
	local X2BQArmorTemplate Template;

	`CREATE_X2TEMPLATE(class'X2BQArmorTemplate', Template, 'PoweredBerserkerQueenArmor');
	Template.strImage = "img:///UILibrary_DLC2Images.Inv_RageSuit";
	Template.ItemCat = 'armor';
	Template.StartingItem = false;
	Template.CanBeBuilt = true;
	Template.bInfiniteItem = true;
	Template.PointsToComplete = 200;
	Template.Abilities.AddItem('PoweredBerserkerQueenArmorStats_Ability');
	Template.ArmorTechCat = 'powered';
	Template.ArmorCat = 'BerserkerQueenArmorCat';
	Template.Tier = 3;
	Template.AkAudioSoldierArmorSwitch = 'Warden';
	Template.EquipSound = "StrategyUI_Armor_Equip_Powered_Spark";

	Template.CreatorTemplateName = 'PoweredBerserkerQueenArmor_Schematic'; // The schematic which creates this item
	Template.BaseItem = 'PlatedBerserkerQueenArmor'; // Which item this will be upgraded from

	Template.FaithBreaker = default.PA_FaithBreakerStrength_T3;
	Template.FistDamage = default.PA_BerserkerFistStrength_T3;

	return Template;
}