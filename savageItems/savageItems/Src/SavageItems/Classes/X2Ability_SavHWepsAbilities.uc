class X2Ability_SavHWepsAbilities extends XMBAbility
	dependson (XComGameStateContext_Ability) config(GameCore);

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;
/////HEAVY WEAPONS ABILITIES
	Templates.AddItem(SAVHeavyAutocannonShot());
	Templates.AddItem(SAVHeavyAutocannonShot_BIT());
	Templates.AddItem(SAVAntiTankShot());
	Templates.AddItem(SAVAntiTankShot_BIT());
	Templates.AddItem(SAVHeavyMicroMissileVolley());
	Templates.AddItem(SAVHeavyMicroMissileVolley_BIT());
	return Templates;
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////HEAVY WEAPONS
//
static function X2AbilityTemplate SAVHeavyAutocannonShot()
{
	local X2AbilityTemplate						Template;
	local X2AbilityCost_HeavyWeaponActionPoints	ActionPointCost;
	local X2AbilityCost_Ammo					AmmoCost;
	local X2AbilityToHitCalc_StandardAim		ToHitCalc;
	local X2AbilityCooldown						Cooldown;
	local X2Effect_ApplyDirectionalWorldDamage	WorldDamage;
	local X2Condition_UnitProperty				ShooterPropertyCondition;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'SAVHeavyAutocannonShot');

	ActionPointCost = new class'X2AbilityCost_HeavyWeaponActionPoints';
	Template.AbilityCosts.AddItem(ActionPointCost);

	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = 1;
	Template.AbilityCooldown = Cooldown;

	AmmoCost = new class'X2AbilityCost_Ammo';
	AmmoCost.iAmmo = 1;
	Template.AbilityCosts.AddItem(AmmoCost);

	ToHitCalc = new class'X2AbilityToHitCalc_StandardAim';
	Template.AbilityToHitCalc = ToHitCalc;
	Template.AbilityToHitOwnerOnMissCalc = ToHitCalc;

	Template.AbilityTargetStyle = default.SimpleSingleTarget;

	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AddShooterEffectExclusions();

	Template.AbilityTargetConditions.AddItem(default.LivingHostileTargetProperty);
	Template.AbilityTargetConditions.AddItem(default.GameplayVisibilityCondition);

	Template.AddTargetEffect(class'X2Ability_Chosen'.static.HoloTargetEffect());
	Template.AddTargetEffect(class'X2Ability_GrenadierAbilitySet'.static.HoloTargetEffect());
	Template.AddTargetEffect(class'X2Ability_GrenadierAbilitySet'.static.ShredderDamageEffect());
	Template.bAllowAmmoEffects = true;
	Template.bAllowBonusWeaponEffects = false;

	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	WorldDamage = new class'X2Effect_ApplyDirectionalWorldDamage';
	WorldDamage.bUseWeaponDamageType = true;
	WorldDamage.bUseWeaponEnvironmentalDamage = true;
	WorldDamage.bApplyOnHit = true;
	WorldDamage.bApplyOnMiss = false;
	WorldDamage.bApplyToWorldOnHit = true;
	WorldDamage.bApplyToWorldOnMiss = false;
	WorldDamage.bHitAdjacentDestructibles = true;
	WorldDamage.PlusNumZTiles = 1;
	WorldDamage.bHitTargetTile = true;
	Template.AddTargetEffect(WorldDamage);

	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_HideSpecificErrors;
	Template.HideErrors.AddItem('AA_WrongSoldierClass');
	Template.HideIfAvailable.AddItem('SAVHeavyAutocannonShot_BIT');//=======================Hide if Spark is there
	Template.IconImage = "img:///UILibrary_SavageItems.UIPerk_HeavyAutocannon";
	Template.bUseAmmoAsChargesForHUD = true;
	Template.bDisplayInUITacticalText = false;
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.ARMOR_ACTIVE_PRIORITY;
	Template.AbilityConfirmSound = "TacticalUI_ActivateAbility";

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.BuildInterruptGameStateFn = TypicalAbility_BuildInterruptGameState;
	Template.CinescriptCameraType = "Soldier_HeavyWeapons";

	ShooterPropertyCondition = new class'X2Condition_UnitProperty';
	ShooterPropertyCondition.ExcludeSoldierClasses.AddItem('Spark');
	Template.AbilityShooterConditions.AddItem(ShooterPropertyCondition);

	Template.SuperConcealmentLoss = class'X2AbilityTemplateManager'.default.SuperConcealmentStandardShotLoss;
	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.StandardShotChosenActivationIncreasePerUse;
	Template.LostSpawnIncreasePerUse = class'X2AbilityTemplateManager'.default.HeavyWeaponLostSpawnIncreasePerUse;
	Template.bFrameEvenWhenUnitIsHidden = true;

	return Template;
}

static function X2AbilityTemplate SAVHeavyAutocannonShot_BIT()
{
	local X2AbilityTemplate						Template;
	local X2AbilityCost_HeavyWeaponActionPoints	ActionPointCost;
	local X2AbilityCost_Ammo					AmmoCost;
	local X2AbilityToHitCalc_StandardAim		ToHitCalc;
	local X2AbilityCooldown						Cooldown;
	local X2Effect_ApplyDirectionalWorldDamage	WorldDamage;
	local X2Condition_UnitProperty				ShooterPropertyCondition;
	local XMBCondition_WeaponName				Condition;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'SAVHeavyAutocannonShot_BIT');

	ActionPointCost = new class'X2AbilityCost_HeavyWeaponActionPoints';
	Template.AbilityCosts.AddItem(ActionPointCost);

	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = 1;
	Template.AbilityCooldown = Cooldown;

	AmmoCost = new class'X2AbilityCost_Ammo';
	AmmoCost.iAmmo = 1;
	Template.AbilityCosts.AddItem(AmmoCost);

	ToHitCalc = new class'X2AbilityToHitCalc_StandardAim';
	Template.AbilityToHitCalc = ToHitCalc;
	Template.AbilityToHitOwnerOnMissCalc = ToHitCalc;

	Template.AbilityTargetStyle = default.SimpleSingleTarget;

	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AddShooterEffectExclusions();

	Template.AbilityTargetConditions.AddItem(default.LivingHostileTargetProperty);
	Template.AbilityTargetConditions.AddItem(default.GameplayVisibilityCondition);

	Template.AddTargetEffect(class'X2Ability_Chosen'.static.HoloTargetEffect());
	Template.AddTargetEffect(class'X2Ability_GrenadierAbilitySet'.static.HoloTargetEffect());
	Template.AddTargetEffect(class'X2Ability_GrenadierAbilitySet'.static.ShredderDamageEffect());
	Template.bAllowAmmoEffects = true;
	Template.bAllowBonusWeaponEffects = false;

	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	Condition = new class'XMBCondition_WeaponName';
	Condition.IncludeWeaponNames.AddItem('SAVHeavyAutocannon');
	Condition.bCheckAmmo = true;
	Template.AbilityTargetConditions.AddItem(Condition);

	WorldDamage = new class'X2Effect_ApplyDirectionalWorldDamage';
	WorldDamage.bUseWeaponDamageType = true;
	WorldDamage.bUseWeaponEnvironmentalDamage = true;
	WorldDamage.bApplyOnHit = true;
	WorldDamage.bApplyOnMiss = false;
	WorldDamage.bApplyToWorldOnHit = true;
	WorldDamage.bApplyToWorldOnMiss = false;
	WorldDamage.bHitAdjacentDestructibles = true;
	WorldDamage.PlusNumZTiles = 1;
	WorldDamage.bHitTargetTile = true;
	Template.AddTargetEffect(WorldDamage);

	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_HideSpecificErrors;
	Template.HideErrors.AddItem('AA_WrongSoldierClass');
	Template.IconImage = "img:///UILibrary_SavageItems.UIPerk_HeavyAutocannon";
	Template.bUseAmmoAsChargesForHUD = true;
	Template.bDisplayInUITacticalText = false;
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.ARMOR_ACTIVE_PRIORITY;
	Template.AbilityConfirmSound = "TacticalUI_ActivateAbility";
	////////////////////////////////////////////////BITSTUFF
	ShooterPropertyCondition = new class'X2Condition_UnitProperty';
	ShooterPropertyCondition.RequireSoldierClasses.AddItem('Spark');
	Template.AbilityShooterConditions.AddItem(ShooterPropertyCondition);

	Template.bSkipExitCoverWhenFiring = true;
	Template.bStationaryWeapon = true;	
	////////////////////////////////////////////////BITSTUFF

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = SparkHeavyWeaponVisualization;/////////////////////////////////////SPARK SPECIFIC
	Template.BuildInterruptGameStateFn = TypicalAbility_BuildInterruptGameState;
	Template.CinescriptCameraType = "Soldier_HeavyWeapons";

	Template.SuperConcealmentLoss = class'X2AbilityTemplateManager'.default.SuperConcealmentStandardShotLoss;
	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.StandardShotChosenActivationIncreasePerUse;
	Template.LostSpawnIncreasePerUse = class'X2AbilityTemplateManager'.default.HeavyWeaponLostSpawnIncreasePerUse;
	Template.bFrameEvenWhenUnitIsHidden = true;

	return Template;
}

static function X2AbilityTemplate SAVAntiTankShot()
{
	local X2AbilityTemplate                 Template;	
	local X2AbilityCost_Ammo                AmmoCost;
	local X2AbilityCost_HeavyWeaponActionPoints	ActionPointCost;
//	local X2Effect_ApplyWeaponDamage        WeaponDamageEffect;
	local X2AbilityTarget_Cursor            CursorTarget;
	local X2AbilityMultiTarget_Line         LineMultiTarget;
	local X2Condition_UnitProperty          UnitPropertyCondition;
	local X2AbilityTrigger_PlayerInput      InputTrigger;
	local X2AbilityToHitCalc_StandardAim    StandardAim;
	local X2Condition_UnitProperty			ShooterPropertyCondition;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'SAVAntiTankShot');
	
	AmmoCost = new class'X2AbilityCost_Ammo';	
	AmmoCost.iAmmo = 1;
	Template.AbilityCosts.AddItem(AmmoCost);
	
	ActionPointCost = new class'X2AbilityCost_HeavyWeaponActionPoints';
	Template.AbilityCosts.AddItem(ActionPointCost);
	
	StandardAim = new class'X2AbilityToHitCalc_StandardAim';
	StandardAim.bGuaranteedHit = true;
	Template.AbilityToHitCalc = StandardAim;
/*	
	WeaponDamageEffect = new class'X2Effect_ApplyWeaponDamage';
	WeaponDamageEffect.bExplosiveDamage = false;
	Template.AddMultiTargetEffect(WeaponDamageEffect);
	*/
	CursorTarget = new class'X2AbilityTarget_Cursor';
	CursorTarget.bRestrictToWeaponRange = true;
	Template.AbilityTargetStyle = CursorTarget;
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.ARMOR_ACTIVE_PRIORITY;

	LineMultiTarget = new class'X2AbilityMultiTarget_Line';
	LineMultiTarget.AddAbilityBonusWidth('Rainmaker', 1);
	Template.AbilityMultiTargetStyle = LineMultiTarget;

	Template.AddMultiTargetEffect(class'X2Ability_Chosen'.static.HoloTargetEffect());
	Template.AddMultiTargetEffect(class'X2Ability_GrenadierAbilitySet'.static.HoloTargetEffect());
	Template.AddMultiTargetEffect(class'X2Ability_GrenadierAbilitySet'.static.ShredderDamageEffect());
	Template.bAllowAmmoEffects = true;
	Template.bAllowBonusWeaponEffects = false;

	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AddShooterEffectExclusions();

	UnitPropertyCondition = new class'X2Condition_UnitProperty';
	UnitPropertyCondition.ExcludeFriendlyToSource = false;
	UnitPropertyCondition.ExcludeDead = true;
	Template.AbilityMultiTargetConditions.AddItem(UnitPropertyCondition);

	InputTrigger = new class'X2AbilityTrigger_PlayerInput';
	Template.AbilityTriggers.AddItem(InputTrigger);

	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_HideSpecificErrors;
	Template.HideErrors.AddItem('AA_WrongSoldierClass');
	Template.HideIfAvailable.AddItem('SAVAntiTankShot_BIT');//=======================Hide if Spark is there
	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.bDisplayInUITacticalText = false;
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.ARMOR_ACTIVE_PRIORITY;
	Template.IconImage = "img:///UILibrary_SavageItems.UIPerk_HeavyATRifle";
	Template.bUseAmmoAsChargesForHUD = true;
	Template.TargetingMethod = class'X2TargetingMethod_Line';

	Template.ActivationSpeech = 'ShredderGun';

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.BuildInterruptGameStateFn = TypicalAbility_BuildInterruptGameState;
	Template.CinescriptCameraType = "Soldier_HeavyWeapons";

	ShooterPropertyCondition = new class'X2Condition_UnitProperty';
	ShooterPropertyCondition.ExcludeSoldierClasses.AddItem('Spark');
	Template.AbilityShooterConditions.AddItem(ShooterPropertyCondition);

	Template.SuperConcealmentLoss = class'X2AbilityTemplateManager'.default.SuperConcealmentStandardShotLoss;
	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.StandardShotChosenActivationIncreasePerUse;
	Template.LostSpawnIncreasePerUse = class'X2AbilityTemplateManager'.default.HeavyWeaponLostSpawnIncreasePerUse;
	Template.bFrameEvenWhenUnitIsHidden = true;

	return Template;	
}

static function X2AbilityTemplate SAVAntiTankShot_BIT()
{
	local X2AbilityTemplate                 Template;	
	local X2AbilityCost_Ammo                AmmoCost;
	local X2AbilityCost_HeavyWeaponActionPoints	ActionPointCost;
//	local X2Effect_ApplyWeaponDamage        WeaponDamageEffect;
	local X2AbilityTarget_Cursor            CursorTarget;
	local X2AbilityMultiTarget_Line         LineMultiTarget;
	local X2Condition_UnitProperty          UnitPropertyCondition;
	local X2AbilityTrigger_PlayerInput      InputTrigger;
	local X2AbilityToHitCalc_StandardAim    StandardAim;
	local X2Condition_UnitProperty			ShooterPropertyCondition;
	local XMBCondition_WeaponName			Condition;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'SAVAntiTankShot_BIT');
	
	AmmoCost = new class'X2AbilityCost_Ammo';	
	AmmoCost.iAmmo = 1;
	Template.AbilityCosts.AddItem(AmmoCost);
	
	ActionPointCost = new class'X2AbilityCost_HeavyWeaponActionPoints';
	Template.AbilityCosts.AddItem(ActionPointCost);
	
	StandardAim = new class'X2AbilityToHitCalc_StandardAim';
	StandardAim.bGuaranteedHit = true;
	Template.AbilityToHitCalc = StandardAim;
/*	
	WeaponDamageEffect = new class'X2Effect_ApplyWeaponDamage';
	WeaponDamageEffect.bExplosiveDamage = false;
	Template.AddMultiTargetEffect(WeaponDamageEffect);
*/
	CursorTarget = new class'X2AbilityTarget_Cursor';
	CursorTarget.bRestrictToWeaponRange = true;
	Template.AbilityTargetStyle = CursorTarget;
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.ARMOR_ACTIVE_PRIORITY;

	LineMultiTarget = new class'X2AbilityMultiTarget_Line';
	LineMultiTarget.AddAbilityBonusWidth('Rainmaker', 1);
	Template.AbilityMultiTargetStyle = LineMultiTarget;

	Template.AddMultiTargetEffect(class'X2Ability_Chosen'.static.HoloTargetEffect());
	Template.AddMultiTargetEffect(class'X2Ability_GrenadierAbilitySet'.static.HoloTargetEffect());
	Template.AddMultiTargetEffect(class'X2Ability_GrenadierAbilitySet'.static.ShredderDamageEffect());
	Template.bAllowAmmoEffects = true;
	Template.bAllowBonusWeaponEffects = false;

	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AddShooterEffectExclusions();

	UnitPropertyCondition = new class'X2Condition_UnitProperty';
	UnitPropertyCondition.ExcludeFriendlyToSource = false;
	UnitPropertyCondition.ExcludeDead = true;
	Template.AbilityMultiTargetConditions.AddItem(UnitPropertyCondition);

	Condition = new class'XMBCondition_WeaponName';
	Condition.IncludeWeaponNames.AddItem('SAVAntiTankCannon');
	Condition.bCheckAmmo = true;
	Template.AbilityTargetConditions.AddItem(Condition);

	InputTrigger = new class'X2AbilityTrigger_PlayerInput';
	Template.AbilityTriggers.AddItem(InputTrigger);
	
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_HideSpecificErrors;
	Template.HideErrors.AddItem('AA_WrongSoldierClass');
	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.bDisplayInUITacticalText = false;
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.ARMOR_ACTIVE_PRIORITY;
	Template.IconImage = "img:///UILibrary_SavageItems.UIPerk_HeavyATRifle";
	Template.bUseAmmoAsChargesForHUD = true;
	Template.TargetingMethod = class'X2TargetingMethod_Line';

	Template.ActivationSpeech = 'ShredderGun';

	////////////////////////////////////////////////BITSTUFF
	ShooterPropertyCondition = new class'X2Condition_UnitProperty';
	ShooterPropertyCondition.RequireSoldierClasses.AddItem('Spark');
	Template.AbilityShooterConditions.AddItem(ShooterPropertyCondition);

	Template.bSkipExitCoverWhenFiring = true;
	Template.bStationaryWeapon = true;	
	////////////////////////////////////////////////BITSTUFF

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = SparkHeavyWeaponVisualization;/////////////////////////////////////SPARK SPECIFIC
	Template.BuildInterruptGameStateFn = TypicalAbility_BuildInterruptGameState;
	Template.CinescriptCameraType = "Soldier_HeavyWeapons";

	Template.SuperConcealmentLoss = class'X2AbilityTemplateManager'.default.SuperConcealmentStandardShotLoss;
	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.StandardShotChosenActivationIncreasePerUse;
	Template.LostSpawnIncreasePerUse = class'X2AbilityTemplateManager'.default.HeavyWeaponLostSpawnIncreasePerUse;
	Template.bFrameEvenWhenUnitIsHidden = true;

	return Template;	
}

static function X2DataTemplate SAVHeavyMicroMissileVolley()
{
	local X2AbilityTemplate						Template;
	local X2AbilityCost_Ammo					AmmoCost;
	local X2AbilityCost_HeavyWeaponActionPoints	ActionPointCost;
	local X2AbilityTarget_Cursor				CursorTarget;
	local X2AbilityMultiTarget_Radius			RadiusMultiTarget;
	local X2AbilityTrigger_PlayerInput			InputTrigger;
	local X2Effect_ApplyWeaponDamage			WeaponEffect;
	local X2AbilityToHitCalc_StandardAim		StandardAim;
	local X2Condition_UnitProperty				ShooterPropertyCondition;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'SAVHeavyMicroMissileVolley');

	Template.IconImage = "img:///UILibrary_SavageItems.UIPerk_HeavyMicroMissiles";
	Template.Hostility = eHostility_Offensive;
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_HideSpecificErrors;
	Template.HideErrors.AddItem('AA_WrongSoldierClass');
	Template.HideIfAvailable.AddItem('SAVHeavyMicroMissileVolley_BIT');//=======================Hide if Spark is there
	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.bDisplayInUITacticalText = false;
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.ARMOR_ACTIVE_PRIORITY;

	Template.bUseAmmoAsChargesForHUD = true;

	Template.TargetingMethod = class'X2TargetingMethod_MECMicroMissile';
 
	AmmoCost = new class'X2AbilityCost_Ammo';	
	AmmoCost.iAmmo = 1;
	Template.AbilityCosts.AddItem(AmmoCost);

	ActionPointCost = new class'X2AbilityCost_HeavyWeaponActionPoints';
	Template.AbilityCosts.AddItem(ActionPointCost);
	
	StandardAim = new class'X2AbilityToHitCalc_StandardAim';
	StandardAim.bGuaranteedHit = true;
	Template.AbilityToHitCalc = StandardAim;
	
	CursorTarget = new class'X2AbilityTarget_Cursor';
	CursorTarget.bRestrictToWeaponRange = true;
	Template.AbilityTargetStyle = CursorTarget;

	RadiusMultiTarget = new class'X2AbilityMultiTarget_Radius';
	RadiusMultiTarget.bUseWeaponRadius = true;
	RadiusMultiTarget.AddAbilityBonusRadius('Rainmaker', 1);
	Template.AbilityMultiTargetStyle = RadiusMultiTarget;

	WeaponEffect = new class'X2Effect_ApplyWeaponDamage';
	Template.AddMultiTargetEffect(WeaponEffect);

	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AddShooterEffectExclusions();

	InputTrigger = new class'X2AbilityTrigger_PlayerInput';
	Template.AbilityTriggers.AddItem(InputTrigger);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.BuildInterruptGameStateFn = TypicalAbility_BuildInterruptGameState;

	ShooterPropertyCondition = new class'X2Condition_UnitProperty';
	ShooterPropertyCondition.ExcludeSoldierClasses.AddItem('Spark');
	Template.AbilityShooterConditions.AddItem(ShooterPropertyCondition);

	Template.CinescriptCameraType = "Soldier_HeavyWeapons";
	Template.ActivationSpeech = 'RocketLauncher';

	Template.SuperConcealmentLoss = class'X2AbilityTemplateManager'.default.SuperConcealmentStandardShotLoss;
	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.StandardShotChosenActivationIncreasePerUse;
	Template.LostSpawnIncreasePerUse = class'X2AbilityTemplateManager'.default.HeavyWeaponLostSpawnIncreasePerUse;
	Template.bFrameEvenWhenUnitIsHidden = true;

	return Template;
}

static function X2DataTemplate SAVHeavyMicroMissileVolley_BIT()
{
	local X2AbilityTemplate						Template;
	local X2AbilityCost_Ammo					AmmoCost;
	local X2AbilityCost_HeavyWeaponActionPoints	ActionPointCost;
	local X2AbilityTarget_Cursor				CursorTarget;
	local X2AbilityMultiTarget_Radius			RadiusMultiTarget;
	local X2AbilityTrigger_PlayerInput			InputTrigger;
	local X2Effect_ApplyWeaponDamage			WeaponEffect;
	local X2AbilityToHitCalc_StandardAim		StandardAim;
	local X2Condition_UnitProperty				ShooterPropertyCondition;
	local XMBCondition_WeaponName				Condition;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'SAVHeavyMicroMissileVolley_BIT');
	
	Template.IconImage = "img:///UILibrary_SavageItems.UIPerk_HeavyMicroMissiles";
	Template.Hostility = eHostility_Offensive;
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_HideSpecificErrors;
	Template.HideErrors.AddItem('AA_WrongSoldierClass');
	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.bDisplayInUITacticalText = false;
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.ARMOR_ACTIVE_PRIORITY;

	Template.bUseAmmoAsChargesForHUD = true;

	Template.TargetingMethod = class'X2TargetingMethod_RocketLauncher';
//	Template.TargetingMethod = class'X2TargetingMethod_MECMicroMissile';
 
	AmmoCost = new class'X2AbilityCost_Ammo';	
	AmmoCost.iAmmo = 1;
	Template.AbilityCosts.AddItem(AmmoCost);

	ActionPointCost = new class'X2AbilityCost_HeavyWeaponActionPoints';
	Template.AbilityCosts.AddItem(ActionPointCost);

	StandardAim = new class'X2AbilityToHitCalc_StandardAim';
	StandardAim.bGuaranteedHit = true;
	Template.AbilityToHitCalc = StandardAim;
	
	CursorTarget = new class'X2AbilityTarget_Cursor';
	CursorTarget.bRestrictToWeaponRange = true;
	Template.AbilityTargetStyle = CursorTarget;

	Condition = new class'XMBCondition_WeaponName';
	Condition.IncludeWeaponNames.AddItem('SAVMicroMissiles');
	Condition.bCheckAmmo = true;
	Template.AbilityTargetConditions.AddItem(Condition);

	RadiusMultiTarget = new class'X2AbilityMultiTarget_Radius';
	RadiusMultiTarget.bUseWeaponRadius = true;
	RadiusMultiTarget.AddAbilityBonusRadius('Rainmaker', 1);
	Template.AbilityMultiTargetStyle = RadiusMultiTarget;

	WeaponEffect = new class'X2Effect_ApplyWeaponDamage';
	Template.AddMultiTargetEffect(WeaponEffect);

	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AddShooterEffectExclusions();

	InputTrigger = new class'X2AbilityTrigger_PlayerInput';
	Template.AbilityTriggers.AddItem(InputTrigger);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = SparkHeavyWeaponVisualization;/////////////////////////////////////SPARK SPECIFIC
	Template.BuildInterruptGameStateFn = TypicalAbility_BuildInterruptGameState;

	Template.CinescriptCameraType = "Soldier_HeavyWeapons";
	Template.ActivationSpeech = 'RocketLauncher';

	////////////////////////////////////////////////BITSTUFF
	ShooterPropertyCondition = new class'X2Condition_UnitProperty';
	ShooterPropertyCondition.RequireSoldierClasses.AddItem('Spark');
	Template.AbilityShooterConditions.AddItem(ShooterPropertyCondition);

	Template.bSkipExitCoverWhenFiring = true;
	Template.bStationaryWeapon = true;	
	////////////////////////////////////////////////BITSTUFF

	Template.SuperConcealmentLoss = class'X2AbilityTemplateManager'.default.SuperConcealmentStandardShotLoss;
	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.StandardShotChosenActivationIncreasePerUse;
	Template.LostSpawnIncreasePerUse = class'X2AbilityTemplateManager'.default.HeavyWeaponLostSpawnIncreasePerUse;
	Template.bFrameEvenWhenUnitIsHidden = true;

	return Template;
}

//==========================================================================
//	EQUIPMENT VISUALIZATION -- CURTESY OF IRIDARS SPARK ARSENAL 
//==========================================================================

function SparkHeavyWeaponVisualization(XComGameState VisualizeGameState)
{
	local XComGameStateHistory				History;
	local XComGameStateContext_Ability		Context;
	local XComGameState_Item				CosmeticHeavyWeapon;	//, SourceWeapon;
	local XComGameState_Unit				SourceUnitState, CosmeticUnit;
	local array<XComGameState_Unit>			AttachedUnitStates;

	local XComGameStateVisualizationMgr		VisMgr;
	local VisualizationActionMetadata		EmptyMetadata, ActionMetadata;
	local Actor								SourceVisualizer;

	local X2AbilityTemplate					AbilityTemplate;

	local Array<X2Action>					ParentArray, TempDamageNodes, DamageNodes;
	local X2Action_ExitCover				ExitCoverAction, SourceExitCoverAction;
	local X2Action_EnterCover				EnterCoverAction;
	local X2Action_Fire						FireAction, NewFireAction;

	local int ScanNodes;

	VisMgr = `XCOMVISUALIZATIONMGR;

	// Jwats: Build the standard visualization
	TypicalAbility_BuildVisualization(VisualizeGameState);

	// Jwats: Now handle the cosmetic unit
	History = `XCOMHISTORY;
	Context = XComGameStateContext_Ability(VisualizeGameState.GetContext());
	AbilityTemplate = class'XComGameState_Ability'.static.GetMyTemplateManager().FindAbilityTemplate(Context.InputContext.AbilityTemplateName);

	SourceUnitState = XComGameState_Unit(History.GetGameStateForObjectID(Context.InputContext.SourceObject.ObjectID));
	SourceVisualizer = History.GetVisualizer(SourceUnitState.ObjectID);
	SourceUnitState.GetAttachedUnits(AttachedUnitStates, VisualizeGameState);

	//SourceWeapon = XComGameState_Item(History.GetGameStateForObjectID(Context.InputContext.ItemObject.ObjectID));

	//==========================================================================
	//	CONTINUE ON WITH VISUALIZATION ONLY IF WE HAVE A COSMETIC UNIT, ie A BIT EQUIPED TO FIRE FROM
	//	IF WE DONT THEN TYPICALABILITY_BUILDVISUALIZATION ABOVE SHOULD HAVE US COVERED
	//==========================================================================

	//`assert(AttachedUnitStates.Length > 0);	//DONT USE FUXXING ASSERT BECAUSE IF IT FAILS IT CTD'S WITH AN ASSERT ERROR IN THE LOGS >:(
	//and honestly I'd rather the game just bugs out visually than a CTD
	if (AttachedUnitStates.Length > 0)
	{
		CosmeticUnit = AttachedUnitStates[0];
		CosmeticHeavyWeapon = CosmeticUnit.GetItemInSlot(eInvSlot_HeavyWeapon);

		//Iridar... check here for SPARK Arsenals BIT Heavy Slot if the cosmetic heavy weapon is not found ?? ... 
		if (CosmeticHeavyWeapon == none)
		{
			CosmeticHeavyWeapon = CosmeticUnit.GetItemInSlot(eInvSlot_ExtraBackpack);
		}

		if (CosmeticHeavyWeapon != none)
		{
			// Jwats: Because the shooter might be using a unique fire action we'll replace it with the standard fire action to just command the cosmetic unit
			SourceExitCoverAction = X2Action_ExitCover(VisMgr.GetNodeOfType(VisMgr.BuildVisTree, class'X2Action_ExitCover', SourceVisualizer));
			FireAction = X2Action_Fire(VisMgr.GetNodeOfType(VisMgr.BuildVisTree, AbilityTemplate.ActionFireClass, SourceVisualizer));

			// Jwats: Replace the current fire action with this fire action
			NewFireAction = X2Action_Fire(class'X2Action_Fire'.static.CreateVisualizationAction(Context, SourceVisualizer));
			NewFireAction.SetFireParameters(Context.IsResultContextHit());
			VisMgr.ReplaceNode(NewFireAction, FireAction);

			// Jwats: Have the bit do an exit cover/fire/enter cover
			ActionMetadata = EmptyMetadata;
			ActionMetadata.StateObject_OldState = History.GetGameStateForObjectID(CosmeticUnit.ObjectID, eReturnType_Reference, VisualizeGameState.HistoryIndex - 1);
			ActionMetadata.StateObject_NewState = VisualizeGameState.GetGameStateForObjectID(CosmeticUnit.ObjectID);

			if( ActionMetadata.StateObject_NewState == none )
			{
				ActionMetadata.StateObject_NewState = ActionMetadata.StateObject_OldState;
			}
			ActionMetadata.VisualizeActor = History.GetVisualizer(CosmeticUnit.ObjectID);

			// Jwats: Wait to exit cover until the main guy is ready
			ExitCoverAction = X2Action_ExitCover(class'X2Action_ExitCover'.static.AddToVisualizationTree(ActionMetadata, Context, false, , SourceExitCoverAction.ParentActions));
			FireAction = X2Action_Fire(AbilityTemplate.ActionFireClass.static.AddToVisualizationTree(ActionMetadata, Context, false));
			EnterCoverAction = X2Action_EnterCover(class'X2Action_EnterCover'.static.AddToVisualizationTree(ActionMetadata, Context, false, FireAction));
			ExitCoverAction.UseWeapon = XGWeapon(History.GetVisualizer(CosmeticHeavyWeapon.ObjectID));
			FireAction.SetFireParameters(Context.IsResultContextHit());
			
			// Jwats: Make sure that the fire actions are in sync! Wait until both have completed their exit cover
			ParentArray.Length = 0;
			ParentArray.AddItem(ExitCoverAction);
			ParentArray.AddItem(SourceExitCoverAction);
			VisMgr.ConnectAction(FireAction, VisMgr.BuildVisTree, false, , ParentArray);
			VisMgr.ConnectAction(NewFireAction, VisMgr.BuildVisTree, false, , ParentArray);

			// Jwats: Update the apply weapon damage nodes to have the bit's fire flamethrower as their parent instead of the spark's fire node
			VisMgr.GetNodesOfType(VisMgr.BuildVisTree, class'X2Action_ApplyWeaponDamageToUnit', TempDamageNodes);
			DamageNodes = TempDamageNodes;
			VisMgr.GetNodesOfType(VisMgr.BuildVisTree, class'X2Action_ApplyWeaponDamageToTerrain', TempDamageNodes);

			for( ScanNodes = 0; ScanNodes < TempDamageNodes.Length; ++ScanNodes )
			{
				DamageNodes.AddItem(TempDamageNodes[ScanNodes]);
			}
			
			for( ScanNodes = 0; ScanNodes < DamageNodes.Length; ++ScanNodes )
			{
				if( DamageNodes[ScanNodes].ParentActions[0] == NewFireAction )
				{
					VisMgr.DisconnectAction(DamageNodes[ScanNodes]);
					VisMgr.ConnectAction(DamageNodes[ScanNodes], VisMgr.BuildVisTree, false, FireAction);
				}
			}

			// Jwats: Now make sure the enter cover of the bit is a child of all the apply weapon damage nodes
			VisMgr.ConnectAction(EnterCoverAction, VisMgr.BuildVisTree, false, , DamageNodes);
		}
	}
}