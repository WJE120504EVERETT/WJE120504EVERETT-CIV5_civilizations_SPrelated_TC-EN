UPDATE CustomModOptions SET Value = 1 Where Name = 'EVENTS_UNIT_UPGRADES';
--==========================================================================================================================
-- Civilizations
--==========================================================================================================================
INSERT INTO Civilizations 	
			(Type, 						DerivativeCiv,			Description, 					ShortDescription, 					 Adjective, 							CivilopediaTag, 			DefaultPlayerColor,		 ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas,	AlphaIconAtlas, 		   PortraitIndex,	SoundtrackTag, 	MapImage, 								DawnOfManQuote, 					DawnOfManImage)
SELECT		('CIVILIZATION_WZJ_JIN'), 	('CIVILIZATION_CHINA'),	('TXT_KEY_CIV_WZJ_JIN_DESC'), 	('TXT_KEY_CIV_WZJ_JIN_SHORT_DESC'), ('TXT_KEY_CIV_WZJ_JIN_ADJECTIVE'), 	('TXT_KEY_CIV5_WZJ_JIN'), 	('PLAYERCOLOR_WZJ_JIN'),	 ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, ('WZJ_JIN_ATLAS'),  ('WZJ_JIN_ALPHA_ATLAS'),  0, 				('CHINA'),	 	('JFD_MapGreatJinShizong512.dds'), 		('TXT_KEY_CIV5_DOM_WZJ_JIN_TEXT'), ('WuZhu_DOM_GreatJin.dds')
FROM Civilizations WHERE Type = 'CIVILIZATION_CHINA';
--==========================================================================================================================	
-- Civilization_BuildingClassOverrides
--==========================================================================================================================
INSERT INTO	Civilization_BuildingClassOverrides
			(CivilizationType,			BuildingClassType,						BuildingType)
VALUES		('CIVILIZATION_WZJ_JIN',	'BUILDINGCLASS_CASTLE',					'BUILDING_WZJ_JIN_JIEHAO');-- UB,金界壕
--==========================================================================================================================	
-- BUILDINGS
--=======================================================================================================================		
------------------------------------------------------------------------------------------------------------------------ 	
-- Buildings
------------------------------------------------------------------------------------------------------------------------ 	
INSERT INTO Buildings 	
		(Type, 						BuildingClass,  PrereqTech, Cost, GoldMaintenance, MinAreaSize, ConquestProb, AllowsRangeStrike, Defense, ExtraCityHitPoints, HurryCostModifier, NeverCapture, 	Description, 						Help, 									Strategy,	Civilopedia, 							 ArtDefineTag, PortraitIndex, IconAtlas)
SELECT	'BUILDING_WZJ_JIN_JIEHAO',	BuildingClass,  PrereqTech, Cost, GoldMaintenance, MinAreaSize, ConquestProb, AllowsRangeStrike, Defense, ExtraCityHitPoints, HurryCostModifier, 1, 			'TXT_KEY_BUILDING_WZJ_JIN_JIEHAO', 	'TXT_KEY_BUILDING_WZJ_JIN_JIEHAO_HELP', Strategy,	'TXT_KEY_BUILDING_WZJ_JIN_JIEHAO_TEXT',  ArtDefineTag,	5, 			  'WZJ_JIN_ATLAS'
FROM Buildings WHERE Type = 'BUILDING_CASTLE';	

--UPDATE Buildings
--SET PrereqTech = 'TECH_MACHINERY'
--WHERE Type = 'BUILDING_WZJ_JIN_JIEHAO';
------------------------------------------------------------------------------------------------------------------------		
-- Building_ClassesNeededInCity
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_ClassesNeededInCity
		(BuildingType, 				BuildingClassType)
SELECT	'BUILDING_WZJ_JIN_JIEHAO',	BuildingClassType
FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_CASTLE';	
------------------------------------------------------------------------------------------------------------------------ 	
-- Building_Flavors
------------------------------------------------------------------------------------------------------------------------ 	
INSERT INTO Building_Flavors 	
		(BuildingType, 				FlavorType, Flavor)
SELECT	'BUILDING_WZJ_JIN_JIEHAO',	FlavorType, Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_CASTLE';

--==========================================================================================================================
-- Civilization_CityNames
--==========================================================================================================================		
INSERT INTO Civilization_CityNames 
			(CivilizationType, 				CityName)
VALUES		('CIVILIZATION_WZJ_JIN', 		'TXT_KEY_CITY_NAME_WZJ_JIN_01'),
			('CIVILIZATION_WZJ_JIN', 		'TXT_KEY_CITY_NAME_WZJ_JIN_02'),
			('CIVILIZATION_WZJ_JIN', 		'TXT_KEY_CITY_NAME_WZJ_JIN_03'),
			('CIVILIZATION_WZJ_JIN', 		'TXT_KEY_CITY_NAME_WZJ_JIN_04'),
			('CIVILIZATION_WZJ_JIN', 		'TXT_KEY_CITY_NAME_WZJ_JIN_05'),
			('CIVILIZATION_WZJ_JIN', 		'TXT_KEY_CITY_NAME_WZJ_JIN_06'),
			('CIVILIZATION_WZJ_JIN', 		'TXT_KEY_CITY_NAME_WZJ_JIN_07'),
			('CIVILIZATION_WZJ_JIN', 		'TXT_KEY_CITY_NAME_WZJ_JIN_08'),
			('CIVILIZATION_WZJ_JIN', 		'TXT_KEY_CITY_NAME_WZJ_JIN_09'),
			('CIVILIZATION_WZJ_JIN', 		'TXT_KEY_CITY_NAME_WZJ_JIN_10'),
			('CIVILIZATION_WZJ_JIN', 		'TXT_KEY_CITY_NAME_WZJ_JIN_11'),
			('CIVILIZATION_WZJ_JIN', 		'TXT_KEY_CITY_NAME_WZJ_JIN_12'),
			('CIVILIZATION_WZJ_JIN', 		'TXT_KEY_CITY_NAME_WZJ_JIN_13'),
			('CIVILIZATION_WZJ_JIN', 		'TXT_KEY_CITY_NAME_WZJ_JIN_14'),
			('CIVILIZATION_WZJ_JIN', 		'TXT_KEY_CITY_NAME_WZJ_JIN_15'),
			('CIVILIZATION_WZJ_JIN', 		'TXT_KEY_CITY_NAME_WZJ_JIN_16'),
			('CIVILIZATION_WZJ_JIN', 		'TXT_KEY_CITY_NAME_WZJ_JIN_17'),
			('CIVILIZATION_WZJ_JIN', 		'TXT_KEY_CITY_NAME_WZJ_JIN_18'),
			('CIVILIZATION_WZJ_JIN', 		'TXT_KEY_CITY_NAME_WZJ_JIN_19'),
			('CIVILIZATION_WZJ_JIN', 		'TXT_KEY_CITY_NAME_WZJ_JIN_20'),
			('CIVILIZATION_WZJ_JIN', 		'TXT_KEY_CITY_NAME_WZJ_JIN_21'),
			('CIVILIZATION_WZJ_JIN', 		'TXT_KEY_CITY_NAME_WZJ_JIN_22'),
			('CIVILIZATION_WZJ_JIN', 		'TXT_KEY_CITY_NAME_WZJ_JIN_23'),
			('CIVILIZATION_WZJ_JIN', 		'TXT_KEY_CITY_NAME_WZJ_JIN_24'),
			('CIVILIZATION_WZJ_JIN', 		'TXT_KEY_CITY_NAME_WZJ_JIN_25'),
			('CIVILIZATION_WZJ_JIN', 		'TXT_KEY_CITY_NAME_WZJ_JIN_26'),
			('CIVILIZATION_WZJ_JIN', 		'TXT_KEY_CITY_NAME_WZJ_JIN_27'),
			('CIVILIZATION_WZJ_JIN', 		'TXT_KEY_CITY_NAME_WZJ_JIN_28'),
			('CIVILIZATION_WZJ_JIN', 		'TXT_KEY_CITY_NAME_WZJ_JIN_29'),
			('CIVILIZATION_WZJ_JIN', 		'TXT_KEY_CITY_NAME_WZJ_JIN_30');
--==========================================================================================================================
-- Civilization_FreeBuildingClasses
--==========================================================================================================================		
INSERT INTO Civilization_FreeBuildingClasses 
			(CivilizationType, 				BuildingClassType)
VALUES		('CIVILIZATION_WZJ_JIN', 		'BUILDINGCLASS_PALACE');
--==========================================================================================================================
-- Civilization_FreeTechs
--==========================================================================================================================	
INSERT INTO Civilization_FreeTechs 
			(CivilizationType, 			TechType)
VALUES		('CIVILIZATION_WZJ_JIN',	'TECH_HUNTING'),
			('CIVILIZATION_WZJ_JIN',	'TECH_FISHERY');
--==========================================================================================================================
-- Civilization_FreeUnits
--==========================================================================================================================	
INSERT INTO Civilization_FreeUnits 
			(CivilizationType, 			UnitClassType, Count, UnitAIType)
SELECT		('CIVILIZATION_WZJ_JIN'), 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_CHINA';

UPDATE Civilization_FreeUnits
SET UnitClassType = 'UNITCLASS_EXPLORERX'
WHERE CivilizationType = 'CIVILIZATION_WZJ_JIN' AND UnitClassType = 'UNITCLASS_SCOUT';
--==========================================================================================================================
-- Civilization_Leaders
--==========================================================================================================================		
INSERT INTO Civilization_Leaders 
			(CivilizationType, 			LeaderheadType)
VALUES		('CIVILIZATION_WZJ_JIN', 	'LEADER_WZJ_WUZHU');
--==========================================================================================================================
-- Civilization_UnitClassOverrides 
--==========================================================================================================================	
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 			UnitClassType, 				UnitType)
VALUES		('CIVILIZATION_WZJ_JIN', 	'UNITCLASS_KNIGHT',			'UNIT_JIN_HEZHAMENGAN'),
			--('CIVILIZATION_WZJ_JIN', 	'UNITCLASS_SCOUT',			null),
			('CIVILIZATION_WZJ_JIN', 	'UNITCLASS_EXPLORERX',		'UNIT_JIN_HAIDONGQING'),
			('CIVILIZATION_WZJ_JIN', 	'UNITCLASS_LONGSWORDSMAN',	'UNIT_JIN_QIANJUN');
			--('CIVILIZATION_WZJ_JIN', 	'UNITCLASS_SPEARMAN',		null),
			--('CIVILIZATION_WZJ_JIN', 	'UNITCLASS_PIKEMAN',		null),
			--('CIVILIZATION_WZJ_JIN', 	'UNITCLASS_TERCIO',			null);
--==========================================================================================================================
-- Civilization_Religions
--==========================================================================================================================	
INSERT INTO Civilization_Religions 
			(CivilizationType, 			ReligionType)
VALUES		('CIVILIZATION_WZJ_JIN', 	'RELIGION_CONFUCIANISM');
--==========================================================================================================================
-- Civilization_SpyNames
--==========================================================================================================================	
INSERT INTO Civilization_SpyNames 
			(CivilizationType, 			SpyName)
VALUES		('CIVILIZATION_WZJ_JIN', 	'TXT_KEY_SPY_NAME_WZJ_JIN_0'),	
			('CIVILIZATION_WZJ_JIN', 	'TXT_KEY_SPY_NAME_WZJ_JIN_1'),
			('CIVILIZATION_WZJ_JIN', 	'TXT_KEY_SPY_NAME_WZJ_JIN_2'),
			('CIVILIZATION_WZJ_JIN', 	'TXT_KEY_SPY_NAME_WZJ_JIN_3'),
			('CIVILIZATION_WZJ_JIN', 	'TXT_KEY_SPY_NAME_WZJ_JIN_4'),
			('CIVILIZATION_WZJ_JIN', 	'TXT_KEY_SPY_NAME_WZJ_JIN_5'),
			('CIVILIZATION_WZJ_JIN', 	'TXT_KEY_SPY_NAME_WZJ_JIN_6'),
			('CIVILIZATION_WZJ_JIN', 	'TXT_KEY_SPY_NAME_WZJ_JIN_7'),
			('CIVILIZATION_WZJ_JIN', 	'TXT_KEY_SPY_NAME_WZJ_JIN_8'),
			('CIVILIZATION_WZJ_JIN', 	'TXT_KEY_SPY_NAME_WZJ_JIN_9');
--==========================================================================================================================
-- Civilization_Start_Region_Priority
--==========================================================================================================================	
INSERT INTO Civilization_Start_Along_River 
			(CivilizationType, 			StartAlongRiver)
VALUES		('CIVILIZATION_WZJ_JIN', 	1);	
INSERT INTO Civilization_Start_Along_Ocean
			(CivilizationType, 			StartAlongOcean)
VALUES		('CIVILIZATION_WZJ_JIN', 	1);
--==========================================================================================================================	
-- Colors
--==========================================================================================================================		
INSERT INTO Colors 
			(Type, 										Red, 	Green, 	Blue, 	Alpha)
VALUES		('COLOR_PLAYER_WZJ_JIN_ICON',				0.847, 	0.611, 	0.192, 	1),
			('COLOR_PLAYER_WZJ_JIN_BACKGROUND',			0.129, 	0.419, 	0.317, 	1);
--==========================================================================================================================	
-- PlayerColors
--==========================================================================================================================				
INSERT INTO PlayerColors 
			(Type, 								PrimaryColor, 						SecondaryColor, 								TextColor)
VALUES		('PLAYERCOLOR_WZJ_JIN',				'COLOR_PLAYER_WZJ_JIN_ICON', 		'COLOR_PLAYER_WZJ_JIN_BACKGROUND', 				'COLOR_PLAYER_WHITE_TEXT'); 
--==========================================================================================================================	
-- Leaders
--==========================================================================================================================			
INSERT INTO Leaders 
			(Type, 						Description, 						Civilopedia, 							 CivilopediaTag, 					ArtDefineTag, 				VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 			PortraitIndex)
VALUES		('LEADER_WZJ_WUZHU', 		'TXT_KEY_LEADER_WZJ_WUZHU', 		'TXT_KEY_LEADER_WZJ_WUZHU_PEDIA_TEXT',  'TXT_KEY_LEADER_WZJ_WUZHU_PEDIA',	'WuZhu_GreatJin_Scene.xml',	11, 					12, 					8, 							12, 			5, 			4, 				12, 					6, 				0, 			4, 			4, 				12, 		12, 		'WZJ_JIN_ATLAS', 	1);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MajorCivApproachBiases 
			(LeaderType, 			MajorCivApproachType, 				Bias)
VALUES		('LEADER_WZJ_WUZHU', 	'MAJOR_CIV_APPROACH_WAR', 			12),
			('LEADER_WZJ_WUZHU', 	'MAJOR_CIV_APPROACH_HOSTILE', 		6),
			('LEADER_WZJ_WUZHU', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	4),
			('LEADER_WZJ_WUZHU', 	'MAJOR_CIV_APPROACH_GUARDED', 		10),
			('LEADER_WZJ_WUZHU', 	'MAJOR_CIV_APPROACH_AFRAID', 		1),
			('LEADER_WZJ_WUZHU', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		7),
			('LEADER_WZJ_WUZHU', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		6);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MinorCivApproachBiases 
			(LeaderType, 			MinorCivApproachType, 				Bias)
VALUES		('LEADER_WZJ_WUZHU', 	'MINOR_CIV_APPROACH_IGNORE', 		4),
			('LEADER_WZJ_WUZHU', 	'MINOR_CIV_APPROACH_FRIENDLY', 		7),
			('LEADER_WZJ_WUZHU', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	6),
			('LEADER_WZJ_WUZHU', 	'MINOR_CIV_APPROACH_CONQUEST', 		5),
			('LEADER_WZJ_WUZHU', 	'MINOR_CIV_APPROACH_BULLY', 		3);
--==========================================================================================================================	
-- Leader_Flavors
--==========================================================================================================================						
INSERT INTO Leader_Flavors 
			(LeaderType, 			FlavorType, 						Flavor)
VALUES		('LEADER_WZJ_WUZHU', 	'FLAVOR_OFFENSE', 					12),
			('LEADER_WZJ_WUZHU', 	'FLAVOR_DEFENSE', 					10),
			('LEADER_WZJ_WUZHU', 	'FLAVOR_CITY_DEFENSE', 				12),
			('LEADER_WZJ_WUZHU', 	'FLAVOR_MILITARY_TRAINING', 		12),
			('LEADER_WZJ_WUZHU', 	'FLAVOR_RECON', 					12),
			('LEADER_WZJ_WUZHU', 	'FLAVOR_RANGED', 					5),
			('LEADER_WZJ_WUZHU', 	'FLAVOR_MOBILE', 					12),
			('LEADER_WZJ_WUZHU', 	'FLAVOR_NAVAL', 					12),
			('LEADER_WZJ_WUZHU', 	'FLAVOR_NAVAL_RECON', 				8),
			('LEADER_WZJ_WUZHU', 	'FLAVOR_NAVAL_GROWTH', 				8),
			('LEADER_WZJ_WUZHU', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	8),
			('LEADER_WZJ_WUZHU', 	'FLAVOR_AIR', 						8),
			('LEADER_WZJ_WUZHU', 	'FLAVOR_EXPANSION', 				12),
			('LEADER_WZJ_WUZHU', 	'FLAVOR_GROWTH', 					10),
			('LEADER_WZJ_WUZHU', 	'FLAVOR_TILE_IMPROVEMENT', 			8),
			('LEADER_WZJ_WUZHU', 	'FLAVOR_INFRASTRUCTURE', 			8),
			('LEADER_WZJ_WUZHU', 	'FLAVOR_PRODUCTION', 				12),
			('LEADER_WZJ_WUZHU', 	'FLAVOR_GOLD', 						5),
			('LEADER_WZJ_WUZHU', 	'FLAVOR_SCIENCE', 					9),
			('LEADER_WZJ_WUZHU', 	'FLAVOR_CULTURE', 					9),
			('LEADER_WZJ_WUZHU', 	'FLAVOR_HAPPINESS', 				9),
			('LEADER_WZJ_WUZHU', 	'FLAVOR_GREAT_PEOPLE', 				9),
			('LEADER_WZJ_WUZHU', 	'FLAVOR_WONDER', 					7),
			('LEADER_WZJ_WUZHU', 	'FLAVOR_RELIGION', 					5),
			('LEADER_WZJ_WUZHU', 	'FLAVOR_DIPLOMACY', 				6),
			('LEADER_WZJ_WUZHU', 	'FLAVOR_SPACESHIP', 				9),
			('LEADER_WZJ_WUZHU', 	'FLAVOR_WATER_CONNECTION', 			12),
			('LEADER_WZJ_WUZHU', 	'FLAVOR_NUKE', 						7),
			('LEADER_WZJ_WUZHU', 	'FLAVOR_USE_NUKE', 					2),
			('LEADER_WZJ_WUZHU', 	'FLAVOR_ESPIONAGE', 				7),
			('LEADER_WZJ_WUZHU', 	'FLAVOR_AIRLIFT', 					2),
			('LEADER_WZJ_WUZHU', 	'FLAVOR_I_TRADE_DESTINATION', 		12),
			('LEADER_WZJ_WUZHU', 	'FLAVOR_I_TRADE_ORIGIN', 			12),
			('LEADER_WZJ_WUZHU', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		12),
			('LEADER_WZJ_WUZHU', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		12),
			('LEADER_WZJ_WUZHU', 	'FLAVOR_ARCHAEOLOGY', 				5),
			('LEADER_WZJ_WUZHU', 	'FLAVOR_AIR_CARRIER', 				8);
--==========================================================================================================================	
-- Leader_Traits
--==========================================================================================================================	
INSERT INTO Leader_Traits 
			(LeaderType, 			TraitType)
VALUES		('LEADER_WZJ_WUZHU', 	'TRAIT_WZJ_JIN');
--==========================================================================================================================	
-- Traits
--==========================================================================================================================	
INSERT INTO Traits 
			(Type, 						Description, 						ShortDescription,							EmbarkedToLandFlatCost)
VALUES		('TRAIT_WZJ_JIN', 			'TXT_KEY_TRAIT_WZJ_JIN', 			'TXT_KEY_TRAIT_WZJ_JIN_SHORT',				1);
--==========================================================================================================================	
-- Trait_Promotions
--==========================================================================================================================	
INSERT INTO Trait_FreePromotionUnitCombats
			(TraitType,					UnitCombatType,				PromotionType) 	
VALUES		('TRAIT_WZJ_JIN',			'UNITCOMBAT_MOUNTED',		'PROMOTION_JIN_MOBILE'),	
			('TRAIT_WZJ_JIN',			'UNITCOMBAT_HELICOPTER',	'PROMOTION_JIN_HITARUN');
--==========================================================================================================================	
-- Trait_BuildingClasses
--==========================================================================================================================	
INSERT INTO BuildingClasses 	
			(Type, 						 				DefaultBuilding, 							Description)
VALUES		('BUILDINGCLASS_WZJ_JIN_PRODUCTION', 		'BUILDING_WZJ_JIN_PRODUCTION', 				'TXT_KEY_BUILDING_WZJ_JIN_PRODUCTION'),
			('BUILDINGCLASS_WZJ_JIN_SCIENCE', 			'BUILDING_WZJ_JIN_SCIENCE', 				'TXT_KEY_BUILDING_WZJ_JIN_SCIENCE'),
			('BUILDINGCLASS_WZJ_JIN_FOOD', 				'BUILDING_WZJ_JIN_FOOD', 					'TXT_KEY_BUILDING_WZJ_JIN_FOOD');
--==========================================================================================================================	
-- Trait_Buildings
--==========================================================================================================================	
INSERT INTO Buildings 		
		(Type, 								BuildingClass,						GreatWorkCount, Cost, FaithCost, PrereqTech,	NeverCapture,	Description,								Help)
VALUES	('BUILDING_WZJ_JIN_PRODUCTION',		'BUILDINGCLASS_WZJ_JIN_PRODUCTION',	-1, 			 -1,   -1, 		  null, 		1,				'TXT_KEY_BUILDING_WZJ_JIN_PRODUCTION',		'TXT_KEY_BUILDING_WZJ_JIN_PRODUCTION_HELP'),
		('BUILDING_WZJ_JIN_SCIENCE',		'BUILDINGCLASS_WZJ_JIN_SCIENCE',	-1, 			 -1,   -1, 		  null, 		1,				'TXT_KEY_BUILDING_WZJ_JIN_SCIENCE',			'TXT_KEY_BUILDING_WZJ_JIN_SCIENCE_HELP'),
		('BUILDING_WZJ_JIN_FOOD',			'BUILDINGCLASS_WZJ_JIN_FOOD',		-1, 			 -1,   -1, 		  null, 		1,				'TXT_KEY_BUILDING_WZJ_JIN_FOOD',			'TXT_KEY_BUILDING_WZJ_JIN_FOOD_HELP');
--==========================================================================================================================	
-- Building_YieldChanges
--==========================================================================================================================
INSERT INTO Building_YieldModifiers
		(BuildingType, 						YieldType,				Yield)
VALUES	('BUILDING_WZJ_JIN_PRODUCTION',		'YIELD_PRODUCTION',		1),
		('BUILDING_WZJ_JIN_SCIENCE',		'YIELD_SCIENCE',		1),
		('BUILDING_WZJ_JIN_FOOD',			'YIELD_FOOD',			1);
--==========================================================================================================================	
-- Trait_Promotions
--==========================================================================================================================	
-- INSERT INTO Trait_FreePromotionUnitCombats
-- 			(TraitType,					UnitCombatType,				PromotionType) 	
-- VALUES		('TRAIT_YFS_YUEFEI_SONG',	'UNITCOMBAT_MELEE',			'PROMOTION_NANSONG_LAND'),
-- 			('TRAIT_YFS_YUEFEI_SONG',	'UNITCOMBAT_MOUNTED',		'PROMOTION_NANSONG_LAND'),	
-- 			('TRAIT_YFS_YUEFEI_SONG',	'UNITCOMBAT_ARMOR',			'PROMOTION_NANSONG_LAND'),
-- 			('TRAIT_YFS_YUEFEI_SONG',	'UNITCOMBAT_HELICOPTER',	'PROMOTION_NANSONG_LAND'),
-- 			('TRAIT_YFS_YUEFEI_SONG',	'UNITCOMBAT_SIEGE',			'PROMOTION_NANSONG_LAND'),
-- 			('TRAIT_YFS_YUEFEI_SONG',	'UNITCOMBAT_BOMBER',		'PROMOTION_NANSONG_LAND'),
-- 			('TRAIT_YFS_YUEFEI_SONG',	'UNITCOMBAT_NAVALMELEE',	'PROMOTION_NANSONG_SEA'),
-- 			('TRAIT_YFS_YUEFEI_SONG',	'UNITCOMBAT_SUBMARINE',		'PROMOTION_NANSONG_SEA'),
-- 			('TRAIT_YFS_YUEFEI_SONG',	'UNITCOMBAT_NAVALRANGED',	'PROMOTION_NANSONG_SEA'),
-- 			('TRAIT_YFS_YUEFEI_SONG',	'UNITCOMBAT_CARRIER',		'PROMOTION_NANSONG_SEA');
--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
------------------------------	
INSERT INTO Audio_Sounds 
			(SoundID, 								Filename, 							LoadType)
VALUES		('SND_LEADER_MUSIC_WZJ_WUZHU_PEACE', 	'JFD_GreatJinShizong_Peace', 		'DynamicResident'),
			('SND_LEADER_MUSIC_WZJ_WUZHU_WAR',		'JFD_GreatJinShizong_War', 			'DynamicResident');	
------------------------------
-- Audio_2DSounds
------------------------------	
INSERT INTO Audio_2DSounds 
			(ScriptID, 										SoundID, 								SoundType, 		MinVolume, 	MaxVolume,	IsMusic,	Looping)
VALUES		('AS2D_LEADER_MUSIC_WZJ_WUZHU_PEACE', 			'SND_LEADER_MUSIC_WZJ_WUZHU_PEACE', 	'GAME_MUSIC', 	60, 		60, 		1, 			0),
			('AS2D_LEADER_MUSIC_WZJ_WUZHU_WAR', 			'SND_LEADER_MUSIC_WZJ_WUZHU_WAR', 		'GAME_MUSIC',	60, 		60, 		1,			0);	
--==========================================================================================================================	
-- Diplomacy_Responses
--==========================================================================================================================	
INSERT INTO Diplomacy_Responses (LeaderType, ResponseType, Response, Bias) VALUES ('LEADER_WZJ_WUZHU','RESPONSE_FIRST_GREETING','TXT_KEY_LEADER_WZJ_WUZHU_FIRST_GREETING_%','1');
INSERT INTO Diplomacy_Responses (LeaderType, ResponseType, Response, Bias) VALUES ('LEADER_WZJ_WUZHU','RESPONSE_DEFEATED',		'TXT_KEY_LEADER_WZJ_WUZHU_DEFEATED_%','1');
--==========================================================================================================================	
-- UNITS
--==========================================================================================================================
-- Units
--------------------------------
-- Elite Troops of the Jurchen Nobility	
INSERT INTO Units 	
		(Type, 						Class, PrereqTech,	RangedCombat,	Combat,	  Range, Special, Cost,		FaithCost, RequiresFaithPurchaseEnabled, Moves,   CombatClass, Domain, DefaultUnitAI, Description, 						Civilopedia, 						 Strategy, 		Help, 									Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AdvancedStartCost, RangedCombatLimit, CombatLimit, ObsoleteTech,		XPValueDefense, GoodyHutUpgradeUnitClass, UnitArtInfo, 								UnitFlagIconOffset, UnitFlagAtlas,					PortraitIndex, 	IconAtlas)
SELECT	'UNIT_JIN_HEZHAMENGAN', 	Class, PrereqTech,	RangedCombat,	Combat,	  Range, Special, Cost,		FaithCost, RequiresFaithPurchaseEnabled, Moves,   CombatClass, Domain, DefaultUnitAI, 'TXT_KEY_UNIT_JIN_HEZHAMENGAN',	'TXT_KEY_CIV5_JIN_HEZHAMENGAN_TEXT', Strategy, 		'TXT_KEY_JIN_HEZHAMENGAN_COMBAT_HELP',	Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AdvancedStartCost, RangedCombatLimit, CombatLimit, 'TECH_COMBUSTION',  XPValueDefense, GoodyHutUpgradeUnitClass, 'ART_DEF_UNIT_JIN_HEZHAMENGAN',			1,					'WZJ_UNIT_FLAG_ATLAS',			11, 			'WZJ_JIN_ATLAS'
FROM Units WHERE Type = 'UNIT_KNIGHT';

-- Forced Levies
INSERT INTO Units 	
		(Type, 						Class, PrereqTech,	RangedCombat,	Combat,	  Range, Special, Cost,		FaithCost, RequiresFaithPurchaseEnabled, Moves,   CombatClass, Domain, DefaultUnitAI, Description, 						Civilopedia, 						 Strategy, 		Help, 									Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AdvancedStartCost, RangedCombatLimit, CombatLimit, ObsoleteTech,		XPValueDefense, GoodyHutUpgradeUnitClass, UnitArtInfo, 								UnitFlagIconOffset, UnitFlagAtlas,					PortraitIndex, 	IconAtlas,			ExtraMaintenanceCost,	MoveAfterPurchase)
SELECT	'UNIT_JIN_QIANJUN', 		Class, PrereqTech,	RangedCombat,	20,		  Range, Special, Cost,		FaithCost, RequiresFaithPurchaseEnabled, Moves,   CombatClass, Domain, DefaultUnitAI, 'TXT_KEY_UNIT_JIN_QIANJUN',		'TXT_KEY_CIV5_JIN_QIANJUN_TEXT',	 Strategy, 		'TXT_KEY_JIN_QIANJUN_COMBAT_HELP',		Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AdvancedStartCost, RangedCombatLimit, CombatLimit, 'TECH_RIFLING',		XPValueDefense, GoodyHutUpgradeUnitClass, 'ART_DEF_UNIT_JIN_SWORDSMAN',				3,					'WZJ_UNIT_FLAG_ATLAS',			10, 			'WZJ_JIN_ATLAS',	0,						1
FROM Units WHERE Type = 'UNIT_LONGSWORDSMAN';

-- Xongkoro
INSERT INTO Units 	
		(Type, 						Class, PrereqTech,	RangedCombat,	Combat,	  Range, Special, Cost,		FaithCost, RequiresFaithPurchaseEnabled, Moves,   CombatClass, Domain, DefaultUnitAI, Description, 						Civilopedia, 							Strategy, 		Help, 									Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AdvancedStartCost, RangedCombatLimit, CombatLimit, ObsoleteTech,		XPValueDefense, GoodyHutUpgradeUnitClass, UnitArtInfo, 								UnitFlagIconOffset, UnitFlagAtlas,				PortraitIndex, 	IconAtlas)
SELECT	'UNIT_JIN_HAIDONGQING', 	Class, null,		RangedCombat,	Combat,	  Range, Special, 15,		FaithCost, RequiresFaithPurchaseEnabled, Moves,   CombatClass, Domain, DefaultUnitAI, 'TXT_KEY_UNIT_JIN_HAIDONGQING',	'TXT_KEY_CIV5_JIN_HAIDONGQING_TEXT',	Strategy, 		'TXT_KEY_JIN_HAIDONGQING_COMBAT_HELP',	Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AdvancedStartCost, RangedCombatLimit, CombatLimit, ObsoleteTech,		XPValueDefense, GoodyHutUpgradeUnitClass, 'ART_DEF_UNIT_JIN_HAIDONGQING',		0,					'WZJ_UNIT_FLAG_ATLAS',			9, 				'WZJ_JIN_ATLAS'
FROM Units WHERE Type = 'UNIT_EXPLORERX';
--------------------------------	
-- UnitGameplay2DScripts
--------------------------------		
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT	'UNIT_JIN_HEZHAMENGAN', SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_KNIGHT';

INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT	'UNIT_JIN_QIANJUN', 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_LONGSWORDSMAN';

INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT	'UNIT_JIN_HAIDONGQING', SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_EXPLORERX';
--------------------------------	
-- Unit_AITypes
--------------------------------		
INSERT INTO Unit_AITypes 	
		(UnitType, 					UnitAIType)
SELECT	'UNIT_JIN_HEZHAMENGAN', 	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_KNIGHT';
	
INSERT INTO Unit_AITypes 	
		(UnitType, 				UnitAIType)
SELECT	'UNIT_JIN_QIANJUN', 	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_LONGSWORDSMAN';
	
INSERT INTO Unit_AITypes 	
		(UnitType, 					UnitAIType)
SELECT	'UNIT_JIN_HAIDONGQING', 	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_EXPLORERX';		
--------------------------------	
-- Unit_ClassUpgrades
--------------------------------	
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 				UnitClassType)
SELECT	'UNIT_JIN_HEZHAMENGAN',	UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_KNIGHT';	
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 				UnitClassType)
SELECT	'UNIT_JIN_QIANJUN',		UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_LONGSWORDSMAN';	
--------------------------------	
-- Unit_Flavors
--------------------------------		
INSERT INTO Unit_Flavors 	
		(UnitType, 					FlavorType, Flavor)
SELECT	'UNIT_JIN_HEZHAMENGAN', 	FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_KNIGHT';	

INSERT INTO Unit_Flavors 	
		(UnitType, 				FlavorType, Flavor)
SELECT	'UNIT_JIN_QIANJUN', 	FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_LONGSWORDSMAN';
	
INSERT INTO Unit_Flavors 	
		(UnitType, 					FlavorType, Flavor)
SELECT	'UNIT_JIN_HAIDONGQING', 	FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_SCOUT';
--------------------------------
-- Unit_FreePromotions
--------------------------------
--INSERT INTO Unit_FreePromotions 	
--		(UnitType, 					PromotionType)
--SELECT	'UNIT_JIN_HEZHAMENGAN', 	PromotionType
--FROM Unit_FreePromotions WHERE UnitType = 'UNIT_KNIGHT';

--INSERT INTO Unit_FreePromotions 	
--		(UnitType, 				PromotionType)
--SELECT	'UNIT_JIN_QIANJUN', 	PromotionType
--FROM Unit_FreePromotions WHERE UnitType = 'UNIT_LONGSWORDSMAN';

--INSERT INTO Unit_FreePromotions 	
--		(UnitType, 					PromotionType)
--SELECT	'UNIT_JIN_HAIDONGQING', 	PromotionType
--FROM Unit_FreePromotions WHERE UnitType = 'UNIT_EXPLORERX';

INSERT INTO Unit_FreePromotions
		(UnitType, 					PromotionType)
VALUES	('UNIT_JIN_HEZHAMENGAN', 	'PROMOTION_KNIGHT_COMBAT'),
		('UNIT_JIN_HEZHAMENGAN', 	'PROMOTION_JIN_HEZHAMENGAN'),
		('UNIT_JIN_QIANJUN', 		'PROMOTION_INFANTRY_COMBAT'),
		('UNIT_JIN_QIANJUN', 		'PROMOTION_HALF_CASUALTIES'),
		('UNIT_JIN_HAIDONGQING', 	'PROMOTION_RECON_UNIT'),
		('UNIT_JIN_HAIDONGQING', 	'PROMOTION_IGNORE_TERRAIN_COST'),
		('UNIT_JIN_HAIDONGQING', 	'PROMOTION_RIVAL_TERRITORY'),
		('UNIT_JIN_HAIDONGQING', 	'PROMOTION_SELL_EXOTIC_GOODS'),
		('UNIT_JIN_HAIDONGQING', 	'PROMOTION_JIN_HAIDONGQING');
--------------------------------	
-- Unit_ResourceQuantityRequirements
--------------------------------	
INSERT INTO Unit_ResourceQuantityRequirements 	
		(UnitType, 					ResourceType, Cost)
SELECT	'UNIT_JIN_HEZHAMENGAN', 	ResourceType, Cost
FROM Unit_ResourceQuantityRequirements WHERE UnitType = 'UNIT_KNIGHT';
INSERT INTO Unit_ResourceQuantityRequirements 	
		(UnitType, 					ResourceType, Cost)
SELECT	'UNIT_JIN_QIANJUN', 		ResourceType, Cost
FROM Unit_ResourceQuantityRequirements WHERE UnitType = 'UNIT_LONGSWORDSMAN';
INSERT INTO Unit_ResourceQuantityRequirements 	
		(UnitType, 					ResourceType, Cost)
SELECT	'UNIT_JIN_HAIDONGQING', 	ResourceType, Cost
FROM Unit_ResourceQuantityRequirements WHERE UnitType = 'UNIT_SCOUT';
--------------------------------	
-- Unit_BuildingClassRequireds
--------------------------------
INSERT INTO Unit_BuildingClassRequireds 	
		(UnitType, 				 BuildingClassType)
SELECT	'UNIT_JIN_HEZHAMENGAN',  BuildingClassType
FROM Unit_BuildingClassRequireds WHERE UnitType = 'UNIT_KNIGHT';
INSERT INTO Unit_BuildingClassRequireds 	
		(UnitType, 				 BuildingClassType)
SELECT	'UNIT_JIN_QIANJUN',		 BuildingClassType
FROM Unit_BuildingClassRequireds WHERE UnitType = 'UNIT_LONGSWORDSMAN';
INSERT INTO Unit_BuildingClassRequireds 	
		(UnitType, 				 BuildingClassType)
SELECT	'UNIT_JIN_HAIDONGQING',  BuildingClassType
FROM Unit_BuildingClassRequireds WHERE UnitType = 'UNIT_SCOUT';
--=========================================================================================================================
-- Assign Staring Plots
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS TNL_World_Civilization_StartingPlots(CivilizationType text REFERENCES Civilizations(Type), X integer default -1, Y integer default -1);
INSERT INTO TNL_World_Civilization_StartingPlots
			(CivilizationType,										X,		Y)
VALUES		('CIVILIZATION_WZJ_JIN',			   					90,	   72);	
--=========================================================================================================================
-- Elite unit
--=========================================================================================================================
-- Projects
--==========================================================================================================================
INSERT INTO Projects
		(Type,						Description,						Help,									Civilopedia,								TechPrereq,	MaxGlobalInstances,	MaxTeamInstances,	Cost,	PortraitIndex,	IconAtlas)
SELECT	 'PROJECT_IRON_PAGODA',		'TXT_KEY_PROJECT_IRON_PAGODA',		'TXT_KEY_PROJECT_IRON_PAGODA_HELP',		'TXT_KEY_PROJECT_IRON_PAGODA_PEDIA',		TechPrereq,	MaxGlobalInstances,	MaxTeamInstances,	Cost,	PortraitIndex,	IconAtlas
FROM Projects WHERE Type = 'PROJECT_RIDER_TRAINING';

INSERT INTO Project_Flavors
		(ProjectType,				FlavorType,			Flavor)
SELECT	'PROJECT_IRON_PAGODA',		FlavorType,			Flavor
FROM Project_Flavors WHERE ProjectType = 'PROJECT_RIDER_TRAINING';
--==========================================================================================================================	
-- UnitClasses
--==========================================================================================================================
INSERT INTO UnitClasses
		(Type,							Description,					DefaultUnit,			MaxPlayerInstances)
VALUES	('UNITCLASS_IRON_PAGODA',		'TXT_KEY_UNIT_IRON_PAGODA',		'UNIT_IRON_PAGODA',		1);
--==========================================================================================================================	
-- Units
--==========================================================================================================================
INSERT INTO Units 	
		(Type, 						Class, PrereqTech, RangedCombat,	Combat,	  Range, Special, Cost, HurryCostModifier, FaithCost, RequiresFaithPurchaseEnabled, Moves,   CombatClass, Domain, DefaultUnitAI, Description,	Civilopedia,	Strategy,	Help,	Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AdvancedStartCost, RangedCombatLimit, CombatLimit, ObsoleteTech, XPValueDefense, GoodyHutUpgradeUnitClass, UnitArtInfo, UnitFlagIconOffset, UnitFlagAtlas,	PortraitIndex, 	IconAtlas,	ProjectPrereq)
SELECT	'UNIT_IRON_PAGODA', 		'UNITCLASS_IRON_PAGODA', PrereqTech, RangedCombat,	Combat,	  Range, Special, Cost, -1, FaithCost, RequiresFaithPurchaseEnabled, 3,   CombatClass, Domain, DefaultUnitAI, 'TXT_KEY_UNIT_IRON_PAGODA_NAME',	'TXT_KEY_CIV5_IRON_PAGODA_TEXT', 	Strategy, 	'TXT_KEY_UNIT_HELP_IRON_PAGODA',	Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AdvancedStartCost, RangedCombatLimit, CombatLimit, ObsoleteTech, XPValueDefense, GoodyHutUpgradeUnitClass, 'ART_DEF_UNIT_JIN_IRON_PAGODA',	2,	'WZJ_UNIT_FLAG_ATLAS',	4,	'WZJ_JIN_ATLAS', 'PROJECT_IRON_PAGODA'
FROM Units WHERE Type = 'UNIT_ELITE_RIDER';
--------------------------------	
-- UnitGameplay2DScripts
--------------------------------		
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT	'UNIT_IRON_PAGODA',		SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_ELITE_RIDER';
--------------------------------	
-- Unit_AITypes
--------------------------------		
INSERT INTO Unit_AITypes 	
		(UnitType, 			UnitAIType)
SELECT	'UNIT_IRON_PAGODA', UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_ELITE_RIDER';	
--------------------------------	
-- Unit_ClassUpgrades
--------------------------------	
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 				UnitClassType)
SELECT	'UNIT_IRON_PAGODA',		UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_ELITE_RIDER';	
--------------------------------	
-- Unit_Flavors
--------------------------------		
INSERT INTO Unit_Flavors 	
		(UnitType, 				FlavorType, Flavor)
SELECT	'UNIT_IRON_PAGODA',		FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_ELITE_RIDER';	
--------------------------------
-- Unit_FreePromotions
--------------------------------
INSERT INTO Unit_FreePromotions
		(UnitType, 				PromotionType)
VALUES	('UNIT_IRON_PAGODA', 	'PROMOTION_KNIGHT_COMBAT'),
		('UNIT_IRON_PAGODA', 	'PROMOTION_ANTI_DEBUFF'),
		('UNIT_IRON_PAGODA', 	'PROMOTION_IRON_PAGODA_HUMAN');
--------------------------------	
-- Unit_ResourceQuantityRequirements
--------------------------------	
INSERT INTO Unit_ResourceQuantityRequirements 	
		(UnitType, 				ResourceType, Cost)
SELECT	'UNIT_IRON_PAGODA',		ResourceType, Cost
FROM Unit_ResourceQuantityRequirements WHERE UnitType = 'UNIT_ELITE_RIDER';
--------------------------------	
-- Unit_BuildingClassRequireds
--------------------------------
INSERT INTO Unit_BuildingClassRequireds 	
		(UnitType, 				 BuildingClassType)
SELECT	'UNIT_IRON_PAGODA',		 BuildingClassType
FROM Unit_BuildingClassRequireds WHERE UnitType = 'UNIT_ELITE_RIDER';