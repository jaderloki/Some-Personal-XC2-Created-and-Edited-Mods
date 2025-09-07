class X2StrategyElement_SAVItemsPointsOfInterest extends X2StrategyElement
	dependson(X2PointOfInterestTemplate);

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;

	Templates.AddItem(CreatePOIAlienCacheTemplate());
	Templates.AddItem(CreatePOIADVENTCacheTemplate());
	Templates.AddItem(CreatePOIResistanceCacheTemplate());
	Templates.AddItem(CreatePOISAVUtilItemsTemplate());

	return Templates;
}

//---------------------------------------------------------------------------------------
static function X2DataTemplate CreatePOIAlienCacheTemplate()
{
	local X2PointOfInterestTemplate Template;

	`CREATE_X2POINTOFINTEREST_TEMPLATE(Template, 'POI_AlienCacheTemplate');

	Template.CanAppearFn = CanPOIAlienCacheAppear;

	return Template;
}
//In theory this checks if you have alien encryption
static function bool CanPOIAlienCacheAppear(XComGameState_PointOfInterest POIState)
{
	return (class'UIUtilities_Strategy'.static.GetXComHQ().IsTechResearched('AlienEncryption'));
}

//---------------------------------------------------------------------------------------
static function X2DataTemplate CreatePOIADVENTCacheTemplate()
{
	local X2PointOfInterestTemplate Template;

	`CREATE_X2POINTOFINTEREST_TEMPLATE(Template, 'POI_ADVENTCacheTemplate');

	return Template;
}

//---------------------------------------------------------------------------------------
static function X2DataTemplate CreatePOIResistanceCacheTemplate()
{
	local X2PointOfInterestTemplate Template;

	`CREATE_X2POINTOFINTEREST_TEMPLATE(Template, 'POI_ResistanceCacheTemplate');

	return Template;
}

//---------------------------------------------------------------------------------------
static function X2DataTemplate CreatePOISAVUtilItemsTemplate()
{
	local X2PointOfInterestTemplate Template;

	`CREATE_X2POINTOFINTEREST_TEMPLATE(Template, 'POI_SAVUtilItemsTemplate');

	return Template;
}