class X2Item_PARulersGrenades extends X2Item config(GameData_WeaponData);

var config WeaponDamageValue PARulers_FrostGlob_Damage;

var config bool PARulers_IsFrostGlobInfinite;
var config bool PARulers_FrostGlob_IsSoundFromOwnerLocation;

var config int PARulers_FrostGlobRange;
var config int PARulers_FrostGlobRadius;
var config int PARulers_FrostGlobClipSize;
var config int PARulers_FrostGlob_SoundRange;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Grenades;

	// Alien Rulers
		Grenades.AddItem(CreatePA_ViperKingFrostGlobCat());

	return Grenades;
}

static function X2DataTemplate CreatePA_ViperKingFrostGlobCat()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2GrenadeTemplate', Template, 'PA_ViperKingFrostGlobCat');

	Template.ItemCat = 'grenade';
	Template.WeaponCat = 'grenade';
	Template.strImage = "img:///UILibrary_StrategyImages.InventoryIcons.Inv_Frost_Bomb";
	Template.EquipSound = "StrategyUI_Grenade_Equip";
	Template.GameArchetype = "DLC_60_WP_Viper_Frost_Spit.WP_Viper_Frost_Spit";
	Template.CanBeBuilt = false;
	Template.StartingItem = true;


	Template.iRange = default.PARulers_FrostGlobRange; // 12
	Template.iRadius = default.PARulers_FrostGlobRadius; // 4
	Template.iClipSize = default.PARulers_FrostGlobClipSize; // 1
	Template.InfiniteAmmo = default.PARulers_IsFrostGlobInfinite; // true

	Template.iSoundRange = default.PARulers_FrostGlob_SoundRange; // 6
	Template.bSoundOriginatesFromOwnerLocation = default.PARulers_FrostGlob_IsSoundFromOwnerLocation; // true

	Template.BaseDamage.DamageType = 'Frost';
	Template.BaseDamage = default.PARulers_FrostGlob_Damage;

	Template.InventorySlot = eInvSlot_Utility;
	Template.StowedLocation = eSlot_None;
	Template.Abilities.AddItem('PA_Frostbite');

	// This controls how much arc this projectile may have and how many times it may bounce
	Template.WeaponPrecomputedPathData.InitialPathTime = 0.5; // 0.5
	Template.WeaponPrecomputedPathData.MaxPathTime = 1.0; // 1.0
	Template.WeaponPrecomputedPathData.MaxNumberOfBounces = 0; // 0

	return Template;
}