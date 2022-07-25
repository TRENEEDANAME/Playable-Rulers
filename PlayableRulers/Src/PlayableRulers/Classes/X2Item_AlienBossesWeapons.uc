class X2Item_AlienBossesWeapons extends X2Item config(GameData_WeaponData);

var config int GENERIC_MELEE_ACCURACY;

var config WeaponDamageValue ViperBoss_WPN_BASEDAMAGE;
var config WeaponDamageValue VIPERBOSS_BIND_BASEDAMAGE;
var config WeaponDamageValue VIPERBOSS_BIND_SUSTAINDAMAGE;

var config WeaponDamageValue ARCHONBOSS_WPN_BASEDAMAGE;
var config WeaponDamageValue ARCHONBOSS_BLAZINGPINIONS_BASEDAMAGE;
var config WeaponDamageValue ARCHONBOSS_ICARUS_DROP_BASEDAMAGE;

var config int VIPERBOSS_IDEALRANGE;

var config int ARCHONBOSS_IDEALRANGE;
var config int ARCHONBOSS_BLAZINGPINIONS_ENVDAMAGE;

var config int VIPERBOSSRIFLE_ICLIPSIZE;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Weapons;

	// Alien Rulers

	Weapons.AddItem(CreateTemplate_ViperBoss_WPN());
	Weapons.AddItem(CreateTemplate_ViperBoss_Tongue_WPN());
	Weapons.AddItem(CreateTemplate_ArchonBoss_WPN());
	Weapons.AddItem(CreateTemplate_ArchonBoss_Blazing_Pinions_WPN());
	Weapons.AddItem(CreateTemplate_ArchonBoss_MeleeAttack());

	return Weapons;
}

static function X2DataTemplate CreateTemplate_ViperBoss_WPN()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'ViperBoss_WPN');
	
	Template.WeaponPanelImage = "_ConventionalRifle";                       // used by the UI. Probably determines iconview of the weapon.
	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'PA_ViperKingGunCat';
	Template.WeaponTech = 'magnetic';
	Template.strImage = "img:///UILibrary_DLC2Images.ConvBoltCaster_base";
	Template.RemoveTemplateAvailablility(Template.BITFIELD_GAMEAREA_Multiplayer); //invalidates multiplayer availability

	Template.RangeAccuracy =  class'X2Item_DefaultWeapons'.default.FLAT_CONVENTIONAL_RANGE;
	Template.BaseDamage = default.ViperBoss_WPN_BASEDAMAGE;
	Template.iClipSize = default.VIPERBOSSRIFLE_ICLIPSIZE;
	Template.iSoundRange =  class'X2Item_DefaultWeapons'.default.ASSAULTRIFLE_MAGNETIC_ISOUNDRANGE;
	Template.iEnvironmentDamage =  class'X2Item_DefaultWeapons'.default.ASSAULTRIFLE_MAGNETIC_IENVIRONMENTDAMAGE;
	Template.iIdealRange = default.VIPERBOSS_IDEALRANGE;

	Template.DamageTypeTemplateName = 'Heavy';
	
	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('StandardShot_NoEnd');
	Template.Abilities.AddItem('Overwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');
	
	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "DLC_60_ProxyWeapons.WP_ViperKing_BoltCaster";

	Template.iPhysicsImpulse = 5;

	Template.CanBeBuilt = false;
	Template.TradingPostValue = 30;

	return Template;
}

static function X2DataTemplate CreateTemplate_ViperBoss_Tongue_WPN()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'ViperBoss_Tongue_WPN');

	Template.WeaponPanelImage = "_ConventionalRifle";                       // used by the UI. Probably determines iconview of the weapon.
	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'PA_ViperKingTongueCat';
	Template.WeaponTech = 'magnetic';
	Template.strImage = "img:///UILibrary_Common.AlienWeapons.ViperRifle";
	Template.RemoveTemplateAvailablility(Template.BITFIELD_GAMEAREA_Multiplayer); //invalidates multiplayer availability

	Template.Aim = 20;

	Template.RangeAccuracy = class'X2Item_DefaultWeapons'.default.FLAT_CONVENTIONAL_RANGE;
	Template.BaseDamage = class'X2Item_DefaultWeapons'.default.VIPER_WPN_BASEDAMAGE;
	Template.iClipSize = class'X2Item_DefaultWeapons'.default.ASSAULTRIFLE_MAGNETIC_ICLIPSIZE;
	Template.iSoundRange = class'X2Item_DefaultWeapons'.default.ASSAULTRIFLE_MAGNETIC_ISOUNDRANGE;
	Template.iEnvironmentDamage = class'X2Item_DefaultWeapons'.default.ASSAULTRIFLE_MAGNETIC_IENVIRONMENTDAMAGE;
	Template.iIdealRange = class'X2Item_DefaultWeapons'.default.VIPER_IDEALRANGE;

	Template.InventorySlot = eInvSlot_SecondaryWeapon;

	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "WP_Viper_Strangle_and_Pull.WP_Viper_Strangle_and_Pull";
	
	Template.iPhysicsImpulse = 5;

	Template.CanBeBuilt = false;
	Template.TradingPostValue = 30;

	return Template;
}

static function X2DataTemplate CreateTemplate_ArchonBoss_WPN()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'ArchonBoss_WPN');
	
	Template.WeaponPanelImage = "_ConventionalRifle";                       // used by the UI. Probably determines iconview of the weapon.
	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'PA_ArchonKingGunCat';
	Template.WeaponTech = 'magnetic';
	Template.strImage = "img:///UILibrary_Common.AlienWeapons.ArchonStaff";
	Template.RemoveTemplateAvailablility(Template.BITFIELD_GAMEAREA_Multiplayer); //invalidates multiplayer availability

	Template.RangeAccuracy =  class'X2Item_DefaultWeapons'.default.FLAT_CONVENTIONAL_RANGE;
	Template.BaseDamage = default.ARCHONBOSS_WPN_BASEDAMAGE;
	Template.iClipSize =  class'X2Item_DefaultWeapons'.default.ASSAULTRIFLE_MAGNETIC_ICLIPSIZE;
	Template.iSoundRange =  class'X2Item_DefaultWeapons'.default.ASSAULTRIFLE_MAGNETIC_ISOUNDRANGE;
	Template.iEnvironmentDamage =  class'X2Item_DefaultWeapons'.default.ASSAULTRIFLE_MAGNETIC_IENVIRONMENTDAMAGE;
	Template.iIdealRange = default.ARCHONBOSS_IDEALRANGE;

	Template.DamageTypeTemplateName = 'Heavy';
	
	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('StandardShot_NoEnd');
	Template.Abilities.AddItem('Overwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');
	
	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "WP_ArchonKing_Staff.WP_ArchonKing_Staff";

	Template.iPhysicsImpulse = 5;

	Template.CanBeBuilt = false;
	Template.TradingPostValue = 30;

	return Template;
}

static function X2DataTemplate CreateTemplate_ArchonBoss_Blazing_Pinions_WPN()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'ArchonBoss_Blazing_Pinions_WPN');
	
	Template.WeaponPanelImage = "_ConventionalRifle";                       // used by the UI. Probably determines iconview of the weapon.
	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'rifle';
	Template.WeaponTech = 'magnetic';
	Template.strImage = "img:///UILibrary_Common.AlienWeapons.ArchonStaff";

	Template.RangeAccuracy = class'X2Item_DefaultWeapons'.default.FLAT_CONVENTIONAL_RANGE;
	Template.BaseDamage = default.ARCHONBOSS_BLAZINGPINIONS_BASEDAMAGE;
	Template.iClipSize = 0;
	Template.iSoundRange = 0;
	Template.iEnvironmentDamage = default.ARCHONBOSS_BLAZINGPINIONS_ENVDAMAGE;
	Template.iIdealRange = 0;
	Template.iPhysicsImpulse = 5;
	Template.DamageTypeTemplateName = 'BlazingPinions';

	Template.InventorySlot = eInvSlot_Utility;
	Template.Abilities.AddItem('ArchonKingBlazingPinionsStage2');

	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "DLC_60_WP_Archon_Devastate.WP_Devastate_CV";

	Template.CanBeBuilt = false;
	Template.TradingPostValue = 0;

	return Template;
}

static function X2DataTemplate CreateTemplate_ArchonBoss_MeleeAttack()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'ArchonBossStaff');

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'PA_ArchonKingStaffCat';
	Template.WeaponTech = 'magnetic';
	Template.strImage = "img:///UILibrary_Common.AlienWeapons.ArchonStaff";
	Template.InventorySlot = eInvSlot_SecondaryWeapon;
	Template.StowedLocation = eSlot_RightBack;
	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "WP_Archon_Staff.WP_ArchonStaff";
	Template.RemoveTemplateAvailablility(Template.BITFIELD_GAMEAREA_Multiplayer); //invalidates multiplayer availability

	Template.Aim = class'X2Item_DefaultWeapons'.default.GENERIC_MELEE_ACCURACY; // DLC60 also has a GENERIC_MELEE_ACCURACY, but it is not being used, and not set in the config file.

	Template.iRange = 0;
	Template.iRadius = 1;
	Template.NumUpgradeSlots = 2;
	Template.InfiniteAmmo = true;
	Template.iPhysicsImpulse = 5;
	Template.iIdealRange = 1;

	Template.BaseDamage = class'X2Item_DefaultWeapons'.default.ARCHON_MELEEATTACK_BASEDAMAGE;
	Template.BaseDamage.DamageType = 'Melee';
	Template.iSoundRange = 2;
	Template.iEnvironmentDamage = 10;

	//Build Data
	Template.StartingItem = false;
	Template.CanBeBuilt = false;

	Template.Abilities.AddItem('StandardMelee_NoEnd');
	Template.AddAbilityIconOverride('StandardMelee', "img:///UILibrary_PerkIcons.UIPerk_archon_beatdown");

	return Template;
}

defaultproperties
{
	bShouldCreateDifficultyVariants = true
}