Config = {}


Config.PercentDrunkForVomit = 80
Config.PercentForVomit = 5
Config.HowMuchDownAfterVomit = 20

Config.CheckMetaTime = 1--Every 1 second checking meta and count down
Config.CheckHealthDown = 5--Every 5 second you get 1 hp down if you dont have thirst or hunger (if you dont have both you get 2 down)


--Calculation is easy. If you are in kanada you have temp like -5
--If you with this location sprinting. Automaticaly calculation is for hunger
-- 0.005+0.002 (value is added up)
Config.CountDownStandart = 0.005

Config.TempBiggerDown = 0.002--Thirst down if temp is bigger 30
Config.TempLowwerDown = 0.002--Hunger down if temp is smaller -2

Config.CountDownIfWalk = 0.005--Thirst down (if player walk)
Config.CountDownIfRun = 0.010--Thirst down (if player run)
Config.CountDownIfSprint = 0.015--Thirst down (if player sprint)

Config.AlcoholCountDown = 0.10--Every tick with stats


--eat = eat
--drink = drink
--Berry = berry
--Syringe = syringe

Config.Metabolism = {
    {
        idItem = "Bread",
        animation = "eat",
        propName = "p_bread_14_ab_s_a",

        hunger = 50,
        thirst = 1,

        innerCoreStamina = 2,
        innerCoreStaminaGold = 0.0,
        outerCoreStaminaGold = 0.0,

        innerCoreHealth = 1,
        innerCoreHealthGold = 0.0,
        OuterCoreHealthGold = 0.0,

        alcoholGive = 0,
	},
    {
        idItem = "Clean_Water_Bottle",
        animation = "drink",
        propName = "p_bottlebeer01a",

        hunger = 1,
        thirst = 50,

        innerCoreStamina = 2,
        innerCoreStaminaGold = 0.0,
        outerCoreStaminaGold = 0.0,

        innerCoreHealth = 1,
        innerCoreHealthGold = 0.0,
        OuterCoreHealthGold = 0.0,

        alcoholGive = 5,
	},
    {
        idItem = "Black_Berry",
        animation = "berry",
        propName = "",

        hunger = 1,
        thirst = 50,

        innerCoreStamina = 2,
        innerCoreStaminaGold = 0.0,
        outerCoreStaminaGold = 0.0,

        innerCoreHealth = 1,
        innerCoreHealthGold = 0.0,
        OuterCoreHealthGold = 0.0,

        alcoholGive = 0,
	},
    {
        idItem = "Coca_Injection",
        animation = "syringe",
        propName = "",

        hunger = 1,
        thirst = 50,

        innerCoreStamina = 2,
        innerCoreStaminaGold = 0.0,
        outerCoreStaminaGold = 0.0,

        innerCoreHealth = 1,
        innerCoreHealthGold = 0.0,
        OuterCoreHealthGold = 0.0,

        alcoholGive = 0,
	},
}