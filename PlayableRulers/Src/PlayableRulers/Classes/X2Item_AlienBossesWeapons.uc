class X2Item_AlienBossesWeapons extends X2Item config(GameData_WeaponData);

var config int GENERIC_MELEE_ACCURACY;

var config WeaponDamageValue ARCHONBOSS_WPN_BASEDAMAGE;
var config WeaponDamageValue ARCHONBOSS_BLAZINGPINIONS_BASEDAMAGE;
var config WeaponDamageValue ARCHONBOSS_ICARUS_DROP_BASEDAMAGE;
var config WeaponDamageValue PARulers_BQF_BaseDamage;

var config int ARCHONBOSS_IDEALRANGE;
var config int ARCHONBOSS_BLAZINGPINIONS_ENVDAMAGE;

var config int PARulers_ArchonWPN_NumUpgradeSlot;

var config int PARulers_BC_StunChance;

var config WeaponDamageValue  PARulers_BC_CV_Damage;
var config int PARulers_BC_CV_Aim;
var config int PARulers_BC_CV_CritChance;
var config int PARulers_BC_CV_ClipSize;
var config int PARulers_BC_CV_SoundRange;
var config int PARulers_BC_CV_EnvDamage;
var config int PARulers_BC_CV_IdealRange;
var config int PARulers_BC_CV_NumUpgradeSlots;


var config WeaponDamageValue  PARulers_BC_MG_Damage;
var config int PARulers_BC_MG_Aim;
var config int PARulers_BC_MG_CritChance;
var config int PARulers_BC_MG_ClipSize;
var config int PARulers_BC_MG_SoundRange;
var config int PARulers_BC_MG_EnvDamage;
var config int PARulers_BC_MG_IdealRange;
var config int PARulers_BC_MG_NumUpgradeSlots;


var config WeaponDamageValue  PARulers_BC_BM_Damage;
var config int PARulers_BC_BM_Aim;
var config int PARulers_BC_BM_CritChance;
var config int PARulers_BC_BM_ClipSize;
var config int PARulers_BC_BM_SoundRange;
var config int PARulers_BC_BM_EnvDamage;
var config int PARulers_BC_BM_IdealRange;
var config int PARulers_BC_BM_NumUpgradeSlots;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Weapons;

	// Alien Rulers

		Weapons.AddItem(CreateTemplate_PARulers_Tongue_WPN());
		Weapons.AddItem(CreateTemplate_PARulers_BoltCaster_CV());
		Weapons.AddItem(CreateTemplate_PARulers_BoltCaster_MG());
		Weapons.AddItem(CreateTemplate_PARulers_BoltCaster_BM());
		Weapons.AddItem(CreateTemplate_ArchonBoss_WPN());
		Weapons.AddItem(CreateTemplate_ArchonBoss_MeleeAttack());
		Weapons.AddItem(CreateTemplate_BerserkerBoss_MeleeAttack());


	return Weapons;
}


static function X2DataTemplate CreateTemplate_PARulers_BoltCaster_CV()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'PARulers_BoltCaster_CV');
	Template.WeaponPanelImage = "_ConventionalRifle";                       // used by the UI. Probably determines iconview of the weapon.
	Template.EquipSound = "Conventional_Weapon_Equip";

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'PA_ViperKingGunCat';
	Template.WeaponTech = 'conventional';
	Template.strImage = "img:///UILibrary_DLC2Images.ConvBoltCaster_base";
	Template.RemoveTemplateAvailablility(Template.BITFIELD_GAMEAREA_Multiplayer);
	Template.Tier = 0;

	Template.bCanBeDodged = false;
	Template.RangeAccuracy = class'X2Item_DefaultWeapons'.default.MEDIUM_CONVENTIONAL_RANGE;
	Template.BaseDamage = default.PARulers_BC_CV_Damage;
	Template.Aim = default.PARulers_BC_CV_Aim;
	Template.CritChance = default.PARulers_BC_CV_CritChance;
	Template.iClipSize = default.PARulers_BC_CV_ClipSize;
	Template.iSoundRange = default.PARulers_BC_CV_SoundRange;
	Template.iEnvironmentDamage = default.PARulers_BC_CV_EnvDamage;
	Template.iIdealRange = default.PARulers_BC_CV_IdealRange;

	Template.DamageTypeTemplateName = 'Heavy';
	Template.NumUpgradeSlots = default.PARulers_BC_CV_NumUpgradeSlots;

	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('StandardShot');
	Template.Abilities.AddItem('Overwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');

	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "DLC_60_WP_BoltCaster_CV.WP_BoltCaster_CV";
	
	Template.BonusWeaponEffects.AddItem(PA_BoltCasterStunEffect());

	Template.iPhysicsImpulse = 5;

	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = false;
	
	Template.fKnockbackDamageAmount = 5.0f;
	Template.fKnockbackDamageRadius = 0.0f;

	Template.DamageTypeTemplateName = 'Projectile_Conventional';

	Template.SetUIStatMarkup(class'XLocalizedData'.default.StunChanceLabel, , default.PARulers_BC_StunChance, , , "%");

	return Template;
}

static function X2DataTemplate CreateTemplate_PARulers_BoltCaster_MG()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'PARulers_BoltCaster_MG');
	Template.WeaponPanelImage = "_MagneticRifle";                       // used by the UI. Probably determines iconview of the weapon.
	Template.EquipSound = "Magnetic_Weapon_Equip";

	Template.WeaponCat = 'PA_ViperKingGunCat';
	Template.WeaponTech = 'magnetic';
	Template.ItemCat = 'weapon';
	Template.strImage = "img:///UILibrary_DLC2Images.MagBoltCaster_base";
	Template.RemoveTemplateAvailablility(Template.BITFIELD_GAMEAREA_Multiplayer);
	Template.Tier = 3;

	Template.bCanBeDodged = false;
	Template.RangeAccuracy = class'X2Item_DefaultWeapons'.default.MEDIUM_MAGNETIC_RANGE;
	Template.BaseDamage = default.PARulers_BC_MG_Damage;
	Template.Aim = default.PARulers_BC_MG_Aim;
	Template.CritChance = default.PARulers_BC_MG_CritChance;
	Template.iClipSize = default.PARulers_BC_MG_ClipSize;
	Template.iSoundRange = default.PARulers_BC_MG_SoundRange;
	Template.iEnvironmentDamage = default.PARulers_BC_MG_EnvDamage;
	Template.iIdealRange = default.PARulers_BC_MG_IdealRange;

	Template.NumUpgradeSlots = default.PARulers_BC_MG_NumUpgradeSlots;
	Template.DamageTypeTemplateName = 'Heavy';

	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('StandardShot');
	Template.Abilities.AddItem('Overwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');

	Template.GameArchetype = "DLC_60_WP_BoltCaster_MG.WP_BoltCaster_MG";

	Template.BonusWeaponEffects.AddItem(PA_BoltCasterStunEffect());

	Template.iPhysicsImpulse = 5;

	Template.CreatorTemplateName = 'HunterRifle_MG_Schematic';
	Template.BaseItem = 'PARulers_BoltCaster_CV';

	Template.StartingItem = false;
	Template.CanBeBuilt = true;
	Template.bInfiniteItem = false;

	Template.DamageTypeTemplateName = 'Projectile_MagXCom';

	Template.SetUIStatMarkup(class'XLocalizedData'.default.StunChanceLabel, , default.PARulers_BC_StunChance, , , "%");

	return Template;
}

static function X2DataTemplate CreateTemplate_PARulers_BoltCaster_BM()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'PARulers_BoltCaster_BM');
	Template.WeaponPanelImage = "_BeamRifle";                       // used by the UI. Probably determines iconview of the weapon.
	Template.EquipSound = "Beam_Weapon_Equip";

	Template.WeaponCat = 'PA_ViperKingGunCat';
	Template.WeaponTech = 'beam';
	Template.ItemCat = 'weapon';
	Template.strImage = "img:///UILibrary_DLC2Images.BeamBoltCaster_base";
	Template.RemoveTemplateAvailablility(Template.BITFIELD_GAMEAREA_Multiplayer);
	Template.Tier = 5;

	Template.bCanBeDodged = false;
	Template.RangeAccuracy = class'X2Item_DefaultWeapons'.default.MEDIUM_BEAM_RANGE;
	Template.BaseDamage = default.PARulers_BC_BM_Damage;
	Template.Aim = default.PARulers_BC_BM_Aim;
	Template.CritChance = default.PARulers_BC_BM_CritChance;
	Template.iClipSize = default.PARulers_BC_BM_ClipSize;
	Template.iSoundRange = default.PARulers_BC_BM_SoundRange;
	Template.iEnvironmentDamage = default.PARulers_BC_BM_EnvDamage;
	Template.iIdealRange = default.PARulers_BC_BM_IdealRange;

	Template.DamageTypeTemplateName = 'Heavy';
	Template.NumUpgradeSlots = default.PARulers_BC_BM_NumUpgradeSlots;

	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('StandardShot');
	Template.Abilities.AddItem('Overwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');

	Template.GameArchetype = "DLC_60_WP_BoltCaster_BM.WP_BoltCaster_BM";
	
	Template.BonusWeaponEffects.AddItem(PA_BoltCasterStunEffect());

	Template.iPhysicsImpulse = 5;

	Template.CreatorTemplateName = 'HunterRifle_BM_Schematic';
	Template.BaseItem = 'PARulers_BoltCaster_MG';

	Template.StartingItem = false;
	Template.CanBeBuilt = true;
	Template.bInfiniteItem = false;

	Template.DamageTypeTemplateName = 'Projectile_BeamXCom';

	Template.SetUIStatMarkup(class'XLocalizedData'.default.StunChanceLabel, , default.PARulers_BC_StunChance, , , "%");

	return Template;
}

static function X2Effect_Stunned PA_BoltCasterStunEffect()
{
	local X2Effect_Stunned StunEffect;

	StunEffect = class'X2StatusEffects'.static.CreateStunnedStatusEffect(2, 0, false);
	StunEffect.ApplyChanceFn = PA_BoltCasterStunChance;
	return StunEffect;
}

function name PA_BoltCasterStunChance(const out EffectAppliedData ApplyEffectParameters, XComGameState_BaseObject kNewTargetState, XComGameState NewGameState)
{
	local XComGameState_Unit TargetUnit;
	local int Chance;

	TargetUnit = XComGameState_Unit(kNewTargetState);
	if (TargetUnit != none)
	{
		if (class'X2Helpers_DLC_Day60'.static.IsUnitAlienRuler(TargetUnit))
		{
			// Get the Stun Chance modifier for individual Ruler and subtract it
			Chance = default.PARulers_BC_StunChance - class'X2Helpers_DLC_Day60'.static.GetRulerStunChanceModifier(TargetUnit);
		}
		else
		{
			Chance = default.PARulers_BC_StunChance;
		}
		if (`SYNC_RAND(100) < Chance)
		{
			return 'AA_Success';
		}
	}
	return 'AA_EffectChanceFailed';
}

static function X2DataTemplate CreateTemplate_PARulers_Tongue_WPN()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'PARulers_Tongue_WPN');

	Template.WeaponPanelImage = "_ConventionalRifle";                       // used by the UI. Probably determines iconview of the weapon.
	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'PA_ViperKingTongueCat';
	Template.WeaponTech = 'magnetic';
	Template.strImage = "img:///PARulers_Tongue_Item.ViperTongue";
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
	Template.StartingItem = true;

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

	Template.RangeAccuracy =  class'X2Item_DefaultWeapons'.default.MEDIUM_CONVENTIONAL_RANGE;
	Template.BaseDamage = default.ARCHONBOSS_WPN_BASEDAMAGE;
	Template.iClipSize =  class'X2Item_DefaultWeapons'.default.ASSAULTRIFLE_MAGNETIC_ICLIPSIZE;
	Template.iSoundRange =  class'X2Item_DefaultWeapons'.default.ASSAULTRIFLE_MAGNETIC_ISOUNDRANGE;
	Template.iEnvironmentDamage =  class'X2Item_DefaultWeapons'.default.ASSAULTRIFLE_MAGNETIC_IENVIRONMENTDAMAGE;
	Template.iIdealRange = default.ARCHONBOSS_IDEALRANGE;

	Template.NumUpgradeSlots = default.PARulers_ArchonWPN_NumUpgradeSlot;

	Template.DamageTypeTemplateName = 'Heavy';
	
	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('StandardShot');
	Template.Abilities.AddItem('Overwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');
	
	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "WP_ArchonKing_Staff.WP_ArchonKing_Staff";

	Template.iPhysicsImpulse = 5;

	Template.CanBeBuilt = false;

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
	Template.NumUpgradeSlots = 0;
	Template.InfiniteAmmo = true;
	Template.iPhysicsImpulse = 5;
	Template.iIdealRange = 1;

	Template.BaseDamage = class'X2Item_DefaultWeapons'.default.ARCHON_MELEEATTACK_BASEDAMAGE;
	Template.BaseDamage.DamageType = 'Melee';
	Template.iSoundRange = 2;
	Template.iEnvironmentDamage = 10;

	//Build Data
	Template.StartingItem = true;
	Template.CanBeBuilt = false;

	Template.Abilities.AddItem('StandardMelee_NoEnd');
	Template.AddAbilityIconOverride('StandardMelee', "img:///UILibrary_PerkIcons.UIPerk_archon_beatdown");

	return Template;
}

static function X2DataTemplate CreateTemplate_BerserkerBoss_MeleeAttack()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'BerserkerFistWeapon');

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'PA_BerserkerQueenFistCat';
	Template.WeaponTech = 'magnetic';
	Template.strImage = "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_Sword";
	Template.InventorySlot = eInvSlot_PrimaryWeapon;

	Template.RemoveTemplateAvailablility(Template.BITFIELD_GAMEAREA_Multiplayer); //invalidates multiplayer availability
	Template.Aim = class'X2Item_DefaultWeapons'.default.GENERIC_MELEE_ACCURACY; // DLC60 also has a GENERIC_MELEE_ACCURACY, but it is not being used, and not set in the config file.

	Template.iRange = 1;
	Template.iRadius = 1;
	Template.NumUpgradeSlots = 0;
	Template.InfiniteAmmo = true;
	Template.iPhysicsImpulse = 5;
	Template.iIdealRange = 1;

	Template.BaseDamage = default.PARulers_BQF_BaseDamage;
	Template.BaseDamage.DamageType = 'Melee';
	Template.iSoundRange = 2;
	Template.iEnvironmentDamage = 10;

	//Build Data
	Template.StartingItem = true;
	Template.CanBeBuilt = false;

	return Template;
}
