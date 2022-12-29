class X2Effect_PunchDamage extends X2Effect_ApplyWeaponDamage;

function WeaponDamageValue GetBonusEffectDamageValue(XComGameState_Ability AbilityState, XComGameState_Unit SourceUnit, XComGameState_Item SourceWeapon, StateObjectReference TargetRef)
{
	local X2BQArmorTemplate BerserkerArmorTemplate;
	local XComGameState_Item ArmorState;
	local XComGameState_Unit UnitState;
	local XComGameStateHistory History;
	local WeaponDamageValue DamageValue;

	History = `XCOMHISTORY;
	UnitState = XComGameState_Unit(History.GetGameStateForObjectID(AbilityState.OwnerStateObject.ObjectID));
	ArmorState = UnitState.GetItemInSlot(eInvSlot_Armor);
	BerserkerArmorTemplate = X2BQArmorTemplate(ArmorState.GetMyTemplate());
	if (BerserkerArmorTemplate != none)
	{
		DamageValue = BerserkerArmorTemplate.FistDamage;
	}
	return DamageValue;
}