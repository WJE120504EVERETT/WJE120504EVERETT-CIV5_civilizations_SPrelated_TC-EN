--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
------------------------------------------------------------------------------------------------------------------------
include("FLuaVector.lua")
include("PlotIterators.lua")
include("UtilityFunctions.lua");
--==========================================================================================================================
-- GLOBALS
--==========================================================================================================================
------------------------------------------------------------------------------------------------------------------------
local g_ConvertTextKey  = Locale.ConvertTextKey
local g_MapGetPlot		= Map.GetPlot
local g_MathCeil		= math.ceil
local g_MathFloor		= math.floor
local g_MathMax			= math.max
local g_MathMin			= math.min
				
local Players 			= Players
local HexToWorld 		= HexToWorld
local ToHexFromGrid 	= ToHexFromGrid
local Teams 			= Teams
--==========================================================================================================================
-- GAME DEFINES
--==========================================================================================================================
------------------------------------------------------------------------------------------------------------------------
local defineMaxMajorCivs = GameDefines["MAX_MAJOR_CIVS"]
local defineMaxMinorCivs = GameDefines["MAX_MINOR_CIVS"]
--==========================================================================================================================
-- UNIQUE FUNCTIONS
--==========================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- GLOBALS
------------------------------------------------------------------------------------------------------------------------
local buildingJinJiehaoID = GameInfoTypes["BUILDING_WZJ_JIN_JIEHAO"]
local traitGreatJinID = GameInfoTypes["TRAIT_WZJ_JIN"]

------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONS
------------------------------------------------------------------------------------------------------------------------
--	here (x,y) = (0,0) is bottom left of map in Worldbuilder.
function GetPlot (x,y)                          ------从XY获取地块
	local plot = Map:GetPlotXY(y,x)
	return plot
end

--JFD_GreatJinShizong_PlayerDoTurn
local playerBarbarian = Players[63]
function JFD_GreatJinShizong_PlayerDoTurn(playerID)
	local player = Players[playerID]
	if player == nil or not player:IsAlive() or not player:IsMajorCiv() then return end
	
	local playerCapital = player:GetCapitalCity()
	if not playerCapital then return end

	--UNIQUE BUILDING
	if player:CountNumBuildings(buildingJinJiehaoID) > 0 then
		local playerCapitalX = playerCapital:GetX()
		local playerCapitalY = playerCapital:GetY()

		for pID, iPlayer in pairs(Players) do
			if pID ~= playerID and iPlayer and iPlayer:IsAlive() 
			and iPlayer:IsAtWarWith(playerID)
			then
				for unit in iPlayer:Units() do
					local plot = unit:GetPlot()
					if plot and plot:GetOwner() == playerID then
						local plotCity = plot:GetWorkingCity()
						
						if plotCity:IsHasBuilding(buildingJinJiehaoID)
						and Map.PlotDistance(plot:GetX(), plot:GetY(), plotCity:GetX(), plotCity:GetY()) < 3
						then
							unit:ChangeDamage(g_MathMin(Map.PlotDistance(plotCity:GetX(), plotCity:GetY(), playerCapitalX, playerCapitalY), 24) + 1, playerID)
						end
					end
				end
			end
		end
	end

	--UNIQUE BUILDING
	for city in player:Cities() do
		if city:GetProductionBuilding() == buildingJinJiehaoID 
		and city:IsOccupied() or city:IsPuppet() 
		then
			city:ChangeBuildingProduction(buildingJinJiehaoID, city:GetCurrentProductionDifferenceTimes100(false, false)/100)
		end
	end	
end
GameEvents.PlayerDoTurn.Add(JFD_GreatJinShizong_PlayerDoTurn)
------------------------------------------------------------------------------------------------------------------------
--=======================================================================================================================
--=========================================================================================================================
-- Unit combat
--==========================================================================================================================
local g_DoNewAttackEffect = nil;
function NewAttackEffectStarted(iType, iPlotX, iPlotY)
	if (PreGame.GetGameOption("GAMEOPTION_SP_NEWATTACK_OFF") == 1) then
		print("SP Attack Effect - OFF!");
		return;
	end
	
	if iType == GameInfoTypes["BATTLETYPE_MELEE"]
	or iType == GameInfoTypes["BATTLETYPE_RANGED"]
	or iType == GameInfoTypes["BATTLETYPE_AIR"]
	or iType == GameInfoTypes["BATTLETYPE_SWEEP"]
	then
		g_DoNewAttackEffect = {
			attPlayerID = -1,
			attUnitID   = -1,
			defPlayerID = -1,
			defUnitID   = -1,
			attODamage  = 0,
			defODamage  = 0,
			PlotX = iPlotX,
			PlotY = iPlotY,
			bIsCity = false,
			defCityID = -1,
			battleType = iType,
		};
	end
end
GameEvents.BattleStarted.Add(NewAttackEffectStarted);
local tCaptureSPUnits = {};
function NewAttackEffectJoined(iPlayer, iUnitOrCity, iRole, bIsCity)
	if g_DoNewAttackEffect == nil
	or Players[ iPlayer ] == nil or not Players[ iPlayer ]:IsAlive()
	or (not bIsCity and Players[ iPlayer ]:GetUnitByID(iUnitOrCity) == nil)
	or (bIsCity and (Players[ iPlayer ]:GetCityByID(iUnitOrCity) == nil or iRole == GameInfoTypes["BATTLEROLE_ATTACKER"]))
	or iRole == GameInfoTypes["BATTLEROLE_BYSTANDER"]
	then
		return;
	end
	if bIsCity then
		g_DoNewAttackEffect.defPlayerID = iPlayer;
		g_DoNewAttackEffect.defCityID = iUnitOrCity;
		g_DoNewAttackEffect.bIsCity = bIsCity;
	elseif iRole == GameInfoTypes["BATTLEROLE_ATTACKER"] then
		g_DoNewAttackEffect.attPlayerID = iPlayer;
		g_DoNewAttackEffect.attUnitID = iUnitOrCity;
		g_DoNewAttackEffect.attODamage = Players[ iPlayer ]:GetUnitByID(iUnitOrCity):GetDamage();
	elseif iRole == GameInfoTypes["BATTLEROLE_DEFENDER"] or iRole == GameInfoTypes["BATTLEROLE_INTERCEPTOR"] then
		g_DoNewAttackEffect.defPlayerID = iPlayer;
		g_DoNewAttackEffect.defUnitID = iUnitOrCity;
		g_DoNewAttackEffect.defODamage = Players[ iPlayer ]:GetUnitByID(iUnitOrCity):GetDamage();
	end

end
GameEvents.BattleJoined.Add(NewAttackEffectJoined);
function NewAttackEffect()
	 --Defines and status checks
	if g_DoNewAttackEffect == nil or Players[ g_DoNewAttackEffect.defPlayerID ] == nil
	or Players[ g_DoNewAttackEffect.attPlayerID ] == nil or not Players[ g_DoNewAttackEffect.attPlayerID ]:IsAlive()
	or Players[ g_DoNewAttackEffect.attPlayerID ]:GetUnitByID(g_DoNewAttackEffect.attUnitID) == nil
	-- or Players[ g_DoNewAttackEffect.attPlayerID ]:GetUnitByID(g_DoNewAttackEffect.attUnitID):IsDead()
	or Map.GetPlot(g_DoNewAttackEffect.PlotX, g_DoNewAttackEffect.PlotY) == nil
	then
		return;
	end
	
	local attPlayerID = g_DoNewAttackEffect.attPlayerID;
	local attPlayer = Players[ attPlayerID ];
	local defPlayerID = g_DoNewAttackEffect.defPlayerID;
	local defPlayer = Players[ defPlayerID ];
	
	local attUnit = attPlayer:GetUnitByID(g_DoNewAttackEffect.attUnitID);
	local attPlot = attUnit:GetPlot();
	
	local plotX = g_DoNewAttackEffect.PlotX;
	local plotY = g_DoNewAttackEffect.PlotY;
	local batPlot = Map.GetPlot(plotX, plotY);
	local batType = g_DoNewAttackEffect.battleType;
	
	local bIsCity = g_DoNewAttackEffect.bIsCity;
	local defUnit = nil;
	local defPlot = nil;
	local defCity = nil;
	
	local attFinalUnitDamage = attUnit:GetDamage();
	local defFinalUnitDamage = 0;
	local attUnitDamage = attFinalUnitDamage - g_DoNewAttackEffect.attODamage;
	local defUnitDamage = 0;
	
	if not bIsCity and defPlayer:GetUnitByID(g_DoNewAttackEffect.defUnitID) then
		defUnit = defPlayer:GetUnitByID(g_DoNewAttackEffect.defUnitID);
		defPlot = defUnit:GetPlot();
		defFinalUnitDamage = defUnit:GetDamage();
		defUnitDamage = defFinalUnitDamage - g_DoNewAttackEffect.defODamage;
	elseif bIsCity and defPlayer:GetCityByID(g_DoNewAttackEffect.defCityID) then
		defCity = defPlayer:GetCityByID(g_DoNewAttackEffect.defCityID);
	end
	
	g_DoNewAttackEffect = nil;
	
	-- Not for Barbarins
	if attPlayer:IsBarbarian() then
		return;
	end

	------------------------------------------------------------------------
	-- AI                                                                  : Attack restores a bit of [ICON_MOVES]
	------------------------------------------------------------------------
	if attUnit and attUnit:IsHasPromotion(GameInfo.UnitPromotions["PROMOTION_IRON_PAGODA"].ID)
	then

		attUnit:SetMoves(attUnit:MovesLeft()+GameDefines["MOVE_DENOMINATOR"]);

 	end
	------------------------------------------------------------------------
	----- Kill probability capital gains bonus, +10% for all units of production progress
	------------------------------------------------------------------------
	if defUnit and attPlayer:GetCivilizationType() == GameInfoTypes["CIVILIZATION_WZJ_JIN"]
	then
		if defFinalUnitDamage >= 100 then
			local playerCapital = attPlayer:GetCapitalCity()
			if (not playerCapital) then return end

			local inumResult = Game.Rand(100, "At GreatJin_Script.lua NewAttackEffect()") + 1
			local NewBuildingType = GameInfoTypes["BUILDING_WZJ_JIN_PRODUCTION"]
			if inumResult <= 34 then
				NewBuildingType = GameInfoTypes["BUILDING_WZJ_JIN_PRODUCTION"]
			elseif inumResult <= 67 then
				NewBuildingType = GameInfoTypes["BUILDING_WZJ_JIN_SCIENCE"]
			elseif inumResult <= 100 then
				NewBuildingType = GameInfoTypes["BUILDING_WZJ_JIN_FOOD"]
			end
			-- Capital gets a random bonus
			playerCapital:SetNumRealBuilding(NewBuildingType, playerCapital:GetNumRealBuilding(NewBuildingType) + 1)
			-- Production accelerated in all urban units
			for city in attPlayer:Cities() do
				if city:IsProductionUnit() then
					city:ChangeUnitProduction(city:GetProductionUnit(), 0.1 * city:GetProductionNeeded())
				end
			end

		end
	end
	
end--function END
GameEvents.BattleFinished.Add(NewAttackEffect)


-----------------------------------------------------------------------

-----------------------------------------------------------------------
local ChiXinCavalryID = GameInfo.UnitPromotions["PROMOTION_JIN_HAIDONGQING"].ID
local ChiXinEffectID = GameInfo.UnitPromotions["PROMOTION_JIN_HAIDONGQING_EFFECT"].ID

function ChiXinCavalryOther(playerID)
	local pPlayer = Players[playerID]
	if pPlayer:GetUnitCountFromHasPromotion(ChiXinCavalryID) > 0 then
		local checkDistance = 1 
		if not pPlayer:IsHuman() then
			checkDistance = 2 
		end
		for pUnit in pPlayer:Units() do
			local Patronage = 0;
			if pUnit:GetDomainType() == DomainTypes.DOMAIN_LAND 
			and (pUnit:GetBaseRangedCombatStrength() > 0)
			and not pUnit:IsEmbarked() 
			and not pUnit:IsHasPromotion(ChiXinCavalryID) 
			then 
				for sUnit in pPlayer:Units() do
					if sUnit:IsHasPromotion(ChiXinCavalryID)
					and Map.PlotDistance(pUnit:GetX(), pUnit:GetY(), sUnit:GetX(), sUnit:GetY()) < checkDistance
					then
						Patronage = 1;
						pUnit:SetHasPromotion(ChiXinEffectID, true)
						break;
					end
				end
				if Patronage == 0 then
					pUnit:SetHasPromotion(ChiXinEffectID, false)
				end
			else
				pUnit:SetHasPromotion(ChiXinEffectID, false)
			end
		end
	end
end
GameEvents.UnitSetXY.Add(ChiXinCavalryOther) 
Events.SerialEventUnitCreated.Add(ChiXinCavalryOther)

--==========================================================================================================================

--==========================================================================================================================

function SetEliteUnitsAI( iPlayerID, iUnitID )
	if Players[ iPlayerID ] == nil or not Players[ iPlayerID ]:IsAlive()
	or Players[ iPlayerID ]:GetUnitByID( iUnitID ) == nil
	or Players[ iPlayerID ]:GetUnitByID( iUnitID ):IsDead()
	or Players[ iPlayerID ]:GetUnitByID( iUnitID ):IsDelayedDeath()
	or Players[ iPlayerID ]:GetUnitByID( iUnitID ):HasName()
	then
		return;
	end
	local pUnit = Players[ iPlayerID ]:GetUnitByID( iUnitID );
	if     pUnit:IsHasPromotion(GameInfo.UnitPromotions["PROMOTION_IRON_PAGODA_HUMAN"].ID) 
	and not Players[ iPlayerID ]:IsHuman()
	then
		pUnit:SetHasPromotion(GameInfo.UnitPromotions["PROMOTION_IRON_PAGODA_HUMAN"].ID, false);		-- Locale.ConvertTextKey("TXT_KEY_UNIT_IMPERIAL_GUARD_CAVALRY_ELITE_NAME")
		pUnit:SetHasPromotion(GameInfo.UnitPromotions["PROMOTION_IRON_PAGODA"].ID, true);		-- Locale.ConvertTextKey("TXT_KEY_UNIT_IMPERIAL_GUARD_CAVALRY_ELITE_NAME")
	end

end
Events.SerialEventUnitCreated.Add(SetEliteUnitsAI)


function SetPolicyUnitsName( iPlayer, iOldUnit,  iNewUnit)
	if Players[ iPlayer ] == nil or not Players[ iPlayer ]:IsAlive()
	or Players[ iPlayer ]:GetUnitByID( iOldUnit ) == nil
	or Players[ iPlayer ]:GetUnitByID( iOldUnit ):IsDead()
	or Players[ iPlayer ]:GetUnitByID( iOldUnit ):IsDelayedDeath()
	or Players[ iPlayer ]:GetUnitByID( iOldUnit ):HasName() 
	then
		return;
	end
	local pUnit = Players[ iPlayer ]:GetUnitByID( iOldUnit );
	if     pUnit:IsHasPromotion(GameInfo.UnitPromotions["PROMOTION_IRON_PAGODA"].ID) 
	or 	   pUnit:IsHasPromotion(GameInfo.UnitPromotions["PROMOTION_IRON_PAGODA_HUMAN"].ID) 
	then
		pUnit:SetName("TXT_KEY_UNIT_IRON_PAGODA_NAME");	
	end
end
GameEvents.UnitUpgraded.Add(SetPolicyUnitsName)

local IronPagodaHumanID = GameInfo.UnitPromotions["PROMOTION_IRON_PAGODA_HUMAN"].ID
local IronPagodaChargeArray = {}

local IronPagodaChargeArrayDirection = {}
for i = 0, 5 do
	IronPagodaChargeArrayDirection[i] = {}
 end


local IronPagodaCharge = 0

function GetPlotKey ( plot )                   
	-- set the key string used in cultureMap
	-- structure : g_CultureMap[plotKey] = { { ID = CIV_CULTURAL_ID, Value = cultureForThisCiv }, }
	local x = plot:GetX()
	local y = plot:GetY()
	local plotKey = x..","..y
	return plotKey
end

-- return the plot refered by the key string
function GetPlotFromKey ( plotKey )            
	local pos = string.find(plotKey, ",")
	local x = string.sub(plotKey, 1 , pos -1)
	local y = string.sub(plotKey, pos +1)
	local plot = Map:GetPlotXY(y,x)
	return plot
end

function GetPlotXYFromKey ( plotKey )     
	local pos = string.find(plotKey, ",")
	local x = string.sub(plotKey, 1 , pos -1)
	local y = string.sub(plotKey, pos +1)
	return x, y
end

function isInArray(t, val)
	for _, v in pairs(t) do
		if v == val then
			return true
		end
	end
	return false
end


local IronPagodaChargeButton = {
	Name = "IRON PAGODA CHARGE",
	Title = "TXT_KEY_TITLE_IRON_PAGODA_CHARGE",
	OrderPriority = 200,
	IconAtlas = "WZJ_IGC_ATLAS",
	PortraitIndex = 0,
	ToolTip = function(action, unit)
		local sTooltip;
		local pPlayer = Players[Game:GetActivePlayer()];
		sTooltip = Locale.ConvertTextKey( "TXT_KEY_COND_IRON_PAGODA_CHARGE");
		return sTooltip
	end, -- or a TXT_KEY_ or a function
	Condition = function(action, unit)
		if unit:IsHasPromotion(IronPagodaHumanID) and unit:GetMoves() <= 0 then
			return false
		end
		local pPlayer = Players[Game:GetActivePlayer()];
		if unit:CanMove() and unit:IsHasPromotion(IronPagodaHumanID)
		and unit:GetCurrHitPoints() > 150
		then
			return true
		end
	end, -- or nil or a boolean, default is true
	Disabled = function(action, unit)
		return false
	end, -- or nil or a boolean, default is false
	Action = function(action, unit, eClick)
	if eClick == Mouse.eRClick then
		return
	end
	local pPlayer = Players[Game:GetActivePlayer()];
	local ii = 0
	if pPlayer:IsHuman() then
		-- local unithex = ToHexFromGrid({unit:GetX(), unit:GetY()})
		-- local unitx, unity = unithex.x, unithex.y
		
		for i = 0, 5 do
			-- The cell where the cell is located is the center and extends to all sides with a radius of 5
			local uniqueRange = 5
			-- Make sure there are no mountains, cities, or water blocks on the charge route
			local oPlotX, oPlotY = unit:GetX(), unit:GetY()
			while (uniqueRange > 0) do
				local iPlot = Map.PlotDirection(oPlotX, oPlotY, i)
				if iPlot
				and (not iPlot:IsMountain())
				and (not iPlot:IsWater()) 
				and (not iPlot:IsCity())
				and uniqueRange > 0
				then
					Events.SerialEventHexHighlight(ToHexFromGrid(Vector2(iPlot:GetX(), iPlot:GetY())), true, Vector4(0.847, 0.611, 	0.192, 	1))
					uniqueRange = uniqueRange - 1
					-- print("IronPagodaChargePlot + "..i.."rr"..uniqueRange)
					oPlotX, oPlotY = iPlot:GetX(), iPlot:GetY()
					table.insert(IronPagodaChargeArray, GetPlotKey(iPlot))
					table.insert(IronPagodaChargeArrayDirection[i], GetPlotKey(iPlot))
					ii = ii + 1	
				else
					break
				end
			end
		end

	end
	IronPagodaCharge = 1
end
}
LuaEvents.UnitPanelActionAddin(IronPagodaChargeButton)

function IronPagodaChargeInputHandler( uiMsg, wParam, lParam )
	
	if IronPagodaCharge == 1 then
		if uiMsg == MouseEvents.LButtonDown then
			lButtonDown = true
			local uniqueRange = 5
			local pPlot = Map.GetPlot(UI.GetMouseOverHex())
			local pPlayer = Players[Game:GetActivePlayer()]
			local num = 0
			local pSelUnit = UI.GetHeadSelectedUnit()
			local selUnitPlot = pSelUnit:GetPlot()

			if pSelUnit:IsHasPromotion(IronPagodaHumanID)
			and isInArray(IronPagodaChargeArray, GetPlotKey(pPlot))
			then 
				for i = 0, 5 do
					if isInArray(IronPagodaChargeArrayDirection[i], GetPlotKey(pPlot)) then
						
						-- Losing blood and losing mobility
						for _, v in pairs(IronPagodaChargeArrayDirection[i]) do
							local plotkey = v
							local plotX, plotY = GetPlotXYFromKey(plotkey)
							local plot = GetPlotFromKey(plotkey)
						
							local unitCount = plot:GetNumUnits();
							if unitCount > 0 then
								for i = 0, unitCount-1, 1 do
    					            local pFoundUnit = plot:GetUnit(i);
    					            if pFoundUnit then 
										local iPlayer = Players[pFoundUnit:GetOwner()];
										-- if pPlayer == player and pFoundUnit:GetBaseCombatStrength() > 0 then
										-- 	pFoundUnit:ChangeDamage(-15)	--Change the value to 30
										if not (iPlayer == pPlayer) and PlayersAtWar(iPlayer, pPlayer) then
											local SplashDamageFinal = 15
											if pFoundUnit:GetCurrHitPoints() > 0 then
												pFoundUnit:ChangeDamage(pFoundUnit:GetCurrHitPoints() * 0.4, Game:GetActivePlayer()) -- Enemy units lose blood
											end
										end
									end
								end
							end	
						end
						-- Losing blood and losing mobility
						pSelUnit:SetXY(pPlot:GetX(), pPlot:GetY())
						pSelUnit:SetMoves(0)
						pSelUnit:ChangeDamage(pSelUnit:GetCurrHitPoints() * 0.2)
						-- pSelUnit:PushMission(MissionTypes.MISSION_MOVE_TO, pPlot:GetX(), pPlot:GetY())
						local hex = ToHexFromGrid(Vector2(pPlot:GetX(), pPlot:GetY()))		
						Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("TXT_KEY_TITLE_IRON_PAGODA_CHARGE"))
						Events.GameplayFX(hex.x, hex.y, -1)
						break
					end
				end
			end
			IronPagodaChargeArray = {}

			IronPagodaChargeArrayDirection = {}
			for i = 0, 5 do
				IronPagodaChargeArrayDirection[i] = {}
			end

			Events.ClearHexHighlights()
			IronPagodaCharge = 0
		elseif uiMsg == MouseEvents.LButtonUp then
			if lButtonDown then
				lButtonDown = false
			end
		elseif uiMsg == MouseEvents.RButtonDown then
			rButtonDown = true
		elseif uiMsg == MouseEvents.RButtonUp then
			if rButtonDown and IronPagodaCharge == 1 then
				rButtonDown = false
				IronPagodaCharge = 0
				Events.ClearHexHighlights()
			end
		end
	end
	return false;
end
ContextPtr:SetInputHandler( IronPagodaChargeInputHandler )

--- Transfer Raid Cooldown  3 rounds
-- GameEvents.PlayerDoTurn.Add(
-- function(playerID)
-- 	local player = Players[playerID] 

-- 	if player == nil or player:IsBarbarian() then
-- 		return
-- 	end

-- 	for unit in player:Units() do
-- 		if unit:IsHasPromotion(ScarletEWID) then
-- 			local iScarletEW = load( player, "IronPagodaCharge", iScarletEW) or -1;
-- 			if iScarletEW < 2 and iScarletEW >= 0 then
-- 				iScarletEW = iScarletEW + 1
-- 				save( player, "IronPagodaCharge", iScarletEW)
-- 			elseif iScarletEW == 2 then
-- 				iScarletEW = -1
-- 				save( player, "IronPagodaCharge", iScarletEW)
-- 			end
-- 		end
-- 	end

-- end)