/*ALL DEFINES RELATED TO COMBAT GO HERE*/

//Damage and status effect defines

//Damage defines //TODO: merge these down to reduce on defines
/// Physical fracturing and warping of the material.
#define BRUTE "brute"
/// Scorching and charring of the material.
#define BURN "burn"
/// Poisoning. Mostly caused by reagents.
#define TOX "toxin"
/// Suffocation.
#define OXY "oxygen"
/// Exhaustion and nonlethal damage.
#define STAMINA "stamina"
/// Brain damage. Should probably be decommissioned and replaced with proper organ damage.
#define BRAIN "brain"

//Damage flag defines //

/// Involves corrosive substances.
#define ACID "acid"
/// Involved in checking whether a disease can infect or spread. Also involved in xeno neurotoxin.
#define BIO "bio"
/// Involves a shockwave, usually from an explosion.
#define BOMB "bomb"
/// Involves a solid projectile.
#define BULLET "bullet"
/// Involves being eaten
#define CONSUME "consume"
/// Involves an EMP or energy-based projectile.
#define ENERGY "energy"
/// Involves fire or temperature extremes.
#define FIRE "fire"
/// Involves a laser.
#define LASER "laser"
/// Involves a melee attack or a thrown object.
#define MELEE "melee"
/// Involved in checking the likelihood of applying a wound to a mob.
#define WOUND "wound"

#define ARMOR_ALL "all_damage_types"

/// Armor values that are used for damage
#define ARMOR_LIST_DAMAGE(...) list(BIO, BOMB, BULLET, ENERGY, LASER, MELEE, WOUND)

/// Armor values that are used for durability
#define ARMOR_LIST_DURABILITY(...) list(ACID, FIRE)

/// All armors, preferable in the order as seen above
#define ARMOR_LIST_ALL(...) list(ACID, BIO, BOMB, BULLET, CONSUME, ENERGY, FIRE, LASER, MELEE, WOUND)

//bitflag damage defines used for suicide_act
#define BRUTELOSS (1<<0)
#define FIRELOSS (1<<1)
#define TOXLOSS (1<<2)
#define OXYLOSS (1<<3)
#define STAMINALOSS (1<<4)
#define SHAME (1<<5)
#define MANUAL_SUICIDE (1<<6) //suicide_act will do the actual killing.
#define MANUAL_SUICIDE_NONLETHAL (1<<7) //when the suicide is conditionally lethal

#define EFFECT_STUN "stun"
#define EFFECT_KNOCKDOWN "knockdown"
#define EFFECT_UNCONSCIOUS "unconscious"
#define EFFECT_PARALYZE "paralyze"
#define EFFECT_IMMOBILIZE "immobilize"
//Bitflags defining which status effects could be or are inflicted on a mob
/// If set, this mob can be stunned.
#define CANSTUN (1<<0)
/// If set, this mob can be knocked down (or stamcrit)
#define CANKNOCKDOWN (1<<1)
/// If set, this mob can be knocked unconscious via status effect.
/// NOTE, does not mean immune to sleep. Unconscious and sleep are two different things.
/// NOTE, does not relate to the unconscious stat either. Only the status effect.
#define CANUNCONSCIOUS (1<<2)
/// If set, this mob can be grabbed or pushed when bumped into
#define CANPUSH (1<<3)

DEFINE_BITFIELD(status_flags, list(
	"CAN STUN" = CANSTUN,
	"CAN KNOCKDOWN" = CANKNOCKDOWN,
	"CAN UNCONSCIOUS" = CANUNCONSCIOUS,
	"CAN PUSH" = CANPUSH,
))

//Health Defines
#define HEALTH_THRESHOLD_CRIT 0
#define HEALTH_THRESHOLD_FULLCRIT -30
#define HEALTH_THRESHOLD_DEAD -100

#define HEALTH_THRESHOLD_NEARDEATH -90 //Not used mechanically, but to determine if someone is so close to death they hear the other side

//Actual combat defines

//click cooldowns, in tenths of a second, used for various combat actions
#define CLICK_CD_MELEE 8
#define CLICK_CD_RAPID 2
#define CLICK_CD_HYPER_RAPID 1
#define CLICK_CD_SLOW 10
#define CLICK_CD_ACTIVATE_ABILITY 1

#define CLICK_CD_THROW 8
#define CLICK_CD_RANGE 4
#define CLICK_CD_CLICK_ABILITY 6
#define CLICK_CD_BREAKOUT 100
#define CLICK_CD_HANDCUFFED 10
#define CLICK_CD_RESIST 20
#define CLICK_CD_GRABBING 10
#define CLICK_CD_LOOK_UP 5

//Cuff resist speeds
#define FAST_CUFFBREAK 1
#define INSTANT_CUFFBREAK 2

//Grab levels
#define GRAB_PASSIVE 0
#define GRAB_AGGRESSIVE 1
#define GRAB_NECK 2
#define GRAB_KILL 3

//Grab breakout odds
#define BASE_GRAB_RESIST_CHANCE 60 //base chance for whether or not you can escape from a grab

//slowdown when in softcrit. Note that crawling slowdown will also apply at the same time!
#define SOFTCRIT_ADD_SLOWDOWN 2
//slowdown when crawling
#define CRAWLING_ADD_SLOWDOWN 4

//Attack types for checking block reactions
/// Attack was made with a melee weapon
#define MELEE_ATTACK 1
/// Attack is a punch or kick.
/// Mob attacks are not classified as unarmed (currently).
#define UNARMED_ATTACK 2
/// A projectile is hitting us.
#define PROJECTILE_ATTACK 3
/// A thrown item is hitting us.
#define THROWN_PROJECTILE_ATTACK 4
/// We're being tackled or leaped at.
#define LEAP_ATTACK 5

/// Used in check block to get what mob is attacking the blocker.
#define GET_ASSAILANT(weapon) (get(weapon, /mob/living))

//attack visual effects
#define ATTACK_EFFECT_PUNCH "punch"
#define ATTACK_EFFECT_KICK "kick"
#define ATTACK_EFFECT_SMASH "smash"
#define ATTACK_EFFECT_CLAW "claw"
#define ATTACK_EFFECT_SLASH "slash"
#define ATTACK_EFFECT_DISARM "disarm"
#define ATTACK_EFFECT_BITE "bite"
#define ATTACK_EFFECT_MECHFIRE "mech_fire"
#define ATTACK_EFFECT_MECHTOXIN "mech_toxin"
#define ATTACK_EFFECT_BOOP "boop" //Honk

/// Attack animation for sharp items
#define ATTACK_ANIMATION_SLASH "slash"
/// Attack animation for pointy items
#define ATTACK_ANIMATION_PIERCE "pierce"
/// Animation for blunt attacks
#define ATTACK_ANIMATION_BLUNT "blunt"

//the define for visible message range in combat
#define SAMETILE_MESSAGE_RANGE 1
#define COMBAT_MESSAGE_RANGE 3
#define DEFAULT_MESSAGE_RANGE 7

//Shove knockdown lengths (deciseconds)
#define SHOVE_KNOCKDOWN_SOLID 2 SECONDS
#define SHOVE_KNOCKDOWN_HUMAN 2 SECONDS
#define SHOVE_KNOCKDOWN_TABLE 2 SECONDS
#define SHOVE_KNOCKDOWN_COLLATERAL 1
#define SHOVE_CHAIN_PARALYZE 3 SECONDS
//Staggered slowdown, an effect caused by shoving and a few other features, such as tackling
#define STAGGERED_SLOWDOWN_LENGTH 3 SECONDS
#define STAGGERED_SLOWDOWN_STRENGTH 0.85 //multiplier
//Shove disarming item list
GLOBAL_LIST_INIT(shove_disarming_types, typecacheof(list(
	/obj/item/gun)))

//The define for base unarmed miss chance
#define UNARMED_MISS_CHANCE_BASE 20
#define UNARMED_MISS_CHANCE_MAX 80

//Combat object defines
/// The minimum value of an item's throw_speed for it to embed (Unless it has embedded_ignore_throwspeed_threshold set to 1)
#define EMBED_THROWSPEED_THRESHOLD 4
/// For thrown embedding weapons, every extra speed it's thrown at above its normal throwspeed will add this to the embed chance
#define EMBED_CHANCE_SPEED_BONUS 10

//Gun weapon weight
/// Default normal ol' gun. Akimboable, one handed.
#define WEAPON_LIGHT 1
/// Can't be used akimbo, but only needs one hand to fire
#define WEAPON_MEDIUM 2
/// Can't be used akimbo, and needs two hands to fire
#define WEAPON_HEAVY 3
//Gun trigger guards
#define TRIGGER_GUARD_ALLOW_ALL -1
#define TRIGGER_GUARD_NONE 0
#define TRIGGER_GUARD_NORMAL 1
//Gun bolt types
///Gun has a bolt, it stays closed while not cycling. The gun must be racked to have a bullet chambered when a mag is inserted.
///  Example: c20, shotguns, m90
#define BOLT_TYPE_STANDARD 1
///Gun has a bolt, it is open when ready to fire. The gun can never have a chambered bullet with no magazine, but the bolt stays ready when a mag is removed.
///  Example: Tomson, Uzi, the L6 SAW
#define BOLT_TYPE_OPEN 2
///Gun has no moving bolt mechanism, it cannot be racked. Also dumps the entire contents when emptied instead of a magazine.
///  Example: Break action shotguns, revolvers
#define BOLT_TYPE_NO_BOLT 3
///Gun has a bolt, it locks back when empty. It can be released to chamber a round if a magazine is in.
///  Example: Pistols with a slide lock, some SMGs
#define BOLT_TYPE_LOCKING 4
///Gun has an HK-style locking charging handle, so you can slap it. Only use this for flavor, otherwise modern-style automatics should use BOLT_TYPE_LOCKING.
/// Example: everything made by lanchester
#define BOLT_TYPE_CLIP 5
//Sawn off nerfs
///accuracy penalty of sawn off guns
#define SAWN_OFF_ACC_PENALTY 25
///added recoil of sawn off guns
#define SAWN_OFF_RECOIL 1

#define SUPPRESSED_NONE 0
#define SUPPRESSED_QUIET 1 ///standard suppressed
#define SUPPRESSED_VERY 2 /// no message

#define DUALWIELD_PENALTY_EXTRA_MULTIPLIER 1.6

#define MANUFACTURER_NONE null
#define MANUFACTURER_SHARPLITE "the Sharplite Defense logo"
#define MANUFACTURER_SHARPLITE_NEW "the Nanotrasen-Sharplite logo"
#define MANUFACTURER_HUNTERSPRIDE "the Hunter's Pride Arms and Ammunition logo"
#define MANUFACTURER_SOLARARMORIES "the Solarbundswaffenkammer emblem"
#define MANUFACTURER_SCARBOROUGH "the Scarborough Arms logo"
#define MANUFACTURER_EOEHOMA "the Eoehoma Firearms emblem"
#define MANUFACTURER_NANOTRASEN_OLD "an outdated Nanotrasen logo"
#define MANUFACTURER_NANOTRASEN "the Nanotrasen logo"
#define MANUFACTURER_VIGILITAS "the Vigilitas Interstellar logo"
#define MANUFACTURER_BRAZIL "a green flag with a blue circle and a yellow diamond around it"
#define MANUFACTURER_INTEQ "an orange crest with the letters 'IRMG'"
#define MANUFACTURER_MINUTEMAN "the Lanchester City Firearms Plant logo"
#define MANUFACTURER_MINUTEMAN_LASER "the Clover Photonics logo"
#define MANUFACTURER_DONKCO "the Donk! Co. logo"
#define MANUFACTURER_PGF "the Etherbor Industries emblem"
#define MANUFACTURER_IMPORT "Lanchester Import Co."
#define MANUFACTURER_SERENE "the Serene Outdoors logo"

// Misfire chances if the gun's safety is off
#define GUN_NO_SAFETY_MALFUNCTION_CHANCE_LOW 5
#define GUN_NO_SAFETY_MALFUNCTION_CHANCE_MEDIUM 10
#define GUN_NO_SAFETY_MALFUNCTION_CHANCE_HIGH 15

//aiming down sights values
#define PISTOL_ZOOM 2
#define SHOTGUN_ZOOM 2
#define SMG_ZOOM 2
#define RIFLE_ZOOM 2
#define DMR_ZOOM 6

//ads slowdown
#define PISTOL_AIM_SLOWDOWN 0.1
#define SHOTGUN_AIM_SLOWDOWN 0.3
#define SMG_AIM_SLOWDOWN 0.2
#define RIFLE_AIM_SLOWDOWN 0.3
#define LONG_RIFLE_AIM_SLOWDOWN 0.4
#define HEAVY_AIM_SLOWDOWN 0.6

//slowdown defines
#define NO_SLOWDOWN 0.0
#define LIGHT_PISTOL_SLOWDOWN 0.05
#define PISTOL_SLOWDOWN 0.1
#define REVOLVER_SLOWDOWN 0.15
#define HEAVY_REVOLVER_SLOWDOWN 0.2
#define PDW_SLOWDOWN 0.25
#define SMG_SLOWDOWN 0.3
#define SHOTGUN_SLOWDOWN 0.4
#define HEAVY_SHOTGUN_SLOWDOWN 0.45
#define LIGHT_RIFLE_SLOWDOWN 0.45
#define RIFLE_SLOWDOWN 0.55
#define HEAVY_RIFLE_SLOWDOWN 0.6
#define DMR_SLOWDOWN 0.6
#define SAW_SLOWDOWN 0.7
#define SNIPER_SLOWDOWN 0.9
#define HMG_SLOWDOWN 1
#define AMR_SLOWDOWN 1


//laser slowdown
#define LASER_PISTOL_SLOWDOWN 0.05
#define LASER_SMG_SLOWDOWN 0.2
#define LASER_RIFLE_SLOWDOWN 0.35
#define HEAVY_LASER_RIFLE_SLOWDOWN 0.45
#define LASER_SNIPER_SLOWDOWN 0.6


/////////////////
// ATTACHMENTS //
/////////////////

#define TRAIT_ATTACHABLE "attachable"

#define COMSIG_ATTACHMENT_ATTACH "attach-attach"
#define COMSIG_ATTACHMENT_DETACH "attach-detach"
#define COMSIG_ATTACHMENT_EXAMINE "attach-examine"
#define COMSIG_ATTACHMENT_EXAMINE_MORE "attach-examine-more"
#define COMSIG_ATTACHMENT_PRE_ATTACK "attach-pre-attack"
#define COMSIG_ATTACHMENT_AFTER_ATTACK "attach-after-attack"
#define COMSIG_ATTACHMENT_ATTACK "attach-attacked"
#define COMSIG_ATTACHMENT_WIELD "attach-wield"
#define COMSIG_ATTACHMENT_UNWIELD "attach-unwield"
#define COMSIG_ATTACHMENT_UPDATE_OVERLAY "attach-overlay"
#define COMSIG_ATTACHMENT_UNIQUE_ACTION "attach-unique-action"
#define COMSIG_ATTACHMENT_CTRL_CLICK "attach-ctrl-click"
#define COMSIG_ATTACHMENT_ALT_CLICK "attach-alt-click"
#define COMSIG_ATTACHMENT_ATTACK_HAND "attach-attack-hand"

#define COMSIG_ATTACHMENT_TOGGLE "attach-toggle"

#define COMSIG_ATTACHMENT_GET_SLOT "attach-slot-who"
#define ATTACHMENT_SLOT_MUZZLE "muzzle"
#define ATTACHMENT_SLOT_SCOPE "scope"
#define ATTACHMENT_SLOT_GRIP "grip"
#define ATTACHMENT_SLOT_RAIL "rail"
#define ATTACHMENT_SLOT_STOCK "stock"

/proc/attachment_slot_to_bflag(slot)
	switch(slot)
		if(ATTACHMENT_SLOT_MUZZLE)
			return (1<<0)
		if(ATTACHMENT_SLOT_SCOPE)
			return (1<<1)
		if(ATTACHMENT_SLOT_GRIP)
			return (1<<2)
		if(ATTACHMENT_SLOT_RAIL)
			return (1<<3)
		if(ATTACHMENT_SLOT_STOCK)
			return (1<<4)

/proc/attachment_slot_from_bflag(slot)
	switch(slot)
		if(1<<0)
			return ATTACHMENT_SLOT_MUZZLE
		if(1<<1)
			return ATTACHMENT_SLOT_SCOPE
		if(1<<2)
			return ATTACHMENT_SLOT_GRIP
		if(1<<3)
			return ATTACHMENT_SLOT_RAIL
		if(1<<4)
			return ATTACHMENT_SLOT_STOCK

#define ATTACHMENT_DEFAULT_SLOT_AVAILABLE list( \
	ATTACHMENT_SLOT_MUZZLE = 1, \
	ATTACHMENT_SLOT_SCOPE = 1, \
	ATTACHMENT_SLOT_GRIP = 1, \
	ATTACHMENT_SLOT_RAIL = 1, \
	ATTACHMENT_SLOT_STOCK = 1, \
)

//attach_features_flags
/// Removable by hand
#define ATTACH_REMOVABLE_HAND (1<<0)
/// Removable via crowbar
#define ATTACH_REMOVABLE_TOOL (1<<1)
#define ATTACH_TOGGLE (1<<2)
#define ATTACH_NO_SPRITE (1<<3)


/////////////////
// PROJECTILES //
/////////////////

//bullet_act() return values
#define BULLET_ACT_HIT "HIT" //It's a successful hit, whatever that means in the context of the thing it's hitting.
#define BULLET_ACT_BLOCK "BLOCK" //It's a blocked hit, whatever that means in the context of the thing it's hitting.
#define BULLET_ACT_FORCE_PIERCE "PIERCE" //It pierces through the object regardless of the bullet being piercing by default.

#define NICE_SHOT_RICOCHET_BONUS 10 //if the shooter has the NICE_SHOT trait and they fire a ricocheting projectile, add this to the ricochet chance and auto aim angle

//ammo box sprite defines
///ammo box will always use provided icon state
#define AMMO_BOX_ONE_SPRITE 0
///ammo box will have a different state for each bullet; <icon_state>-<bullets left>
#define AMMO_BOX_PER_BULLET 1
/// Ammo box will have a different sprite for any ammo at all, and no ammo, <icon_state>-full <icon_state>-empty
#define AMMO_BOX_FULL_EMPTY 2

//Projectile Reflect
#define REFLECT_NORMAL (1<<0)
#define REFLECT_FAKEPROJECTILE (1<<1)

#define MOVES_HITSCAN -1		//Not actually hitscan but close as we get without actual hitscan.
#define MUZZLE_EFFECT_PIXEL_INCREMENT 17	//How many pixels to move the muzzle flash up so your character doesn't look like they're shitting out lasers.

#define FIREMODE_SEMIAUTO "single"
#define FIREMODE_BURST "burst"
#define FIREMODE_FULLAUTO "auto"
#define FIREMODE_OTHER "other"
#define FIREMODE_OTHER_TWO "other2"
#define FIREMODE_UNDERBARREL "underbarrel"

#define GUN_LEFTHAND_ICON 'icons/mob/inhands/weapons/guns_lefthand.dmi'
#define GUN_RIGHTHAND_ICON 'icons/mob/inhands/weapons/guns_righthand.dmi'


//His Grace.
#define HIS_GRACE_SATIATED 0 //He hungers not. If bloodthirst is set to this, His Grace is asleep.
#define HIS_GRACE_PECKISH 20 //Slightly hungry.
#define HIS_GRACE_HUNGRY 60 //Getting closer. Increases damage up to a minimum of 20.
#define HIS_GRACE_FAMISHED 100 //Dangerous. Increases damage up to a minimum of 25 and cannot be dropped.
#define HIS_GRACE_STARVING 120 //Incredibly close to breaking loose. Increases damage up to a minimum of 30.
#define HIS_GRACE_CONSUME_OWNER 140 //His Grace consumes His owner at this point and becomes aggressive.
#define HIS_GRACE_FALL_ASLEEP 160 //If it reaches this point, He falls asleep and resets.

#define HIS_GRACE_FORCE_BONUS 4 //How much force is gained per kill.

/// ex_act() with EXPLODE_DEVASTATE severity will gib mobs with less than this much bomb armor
#define EXPLODE_GIB_THRESHOLD 50

#define EMP_LIGHT 2
#define EMP_HEAVY 1

#define GRENADE_CLUMSY_FUMBLE 1
#define GRENADE_NONCLUMSY_FUMBLE 2

#define BODY_ZONE_HEAD "head"
#define BODY_ZONE_CHEST "chest"
#define BODY_ZONE_L_ARM "l_arm"
#define BODY_ZONE_R_ARM "r_arm"
#define BODY_ZONE_L_LEG "l_leg"
#define BODY_ZONE_R_LEG "r_leg"

GLOBAL_LIST_INIT(all_body_zones, list(BODY_ZONE_HEAD, BODY_ZONE_CHEST, BODY_ZONE_R_ARM, BODY_ZONE_L_ARM, BODY_ZONE_R_LEG, BODY_ZONE_L_LEG))
GLOBAL_LIST_INIT(limb_zones, list(BODY_ZONE_R_ARM, BODY_ZONE_L_ARM, BODY_ZONE_R_LEG, BODY_ZONE_L_LEG))
GLOBAL_LIST_INIT(arm_zones, list(BODY_ZONE_L_ARM, BODY_ZONE_R_ARM))
GLOBAL_LIST_INIT(leg_zones, list(BODY_ZONE_R_LEG, BODY_ZONE_L_LEG))

#define BODY_ZONE_PRECISE_EYES "eyes"
#define BODY_ZONE_PRECISE_MOUTH "mouth"
#define BODY_ZONE_PRECISE_GROIN "groin"
#define BODY_ZONE_PRECISE_L_HAND "l_hand"
#define BODY_ZONE_PRECISE_R_HAND "r_hand"
#define BODY_ZONE_PRECISE_L_FOOT "l_foot"
#define BODY_ZONE_PRECISE_R_FOOT "r_foot"

//We will round to this value in damage calculations.
#define DAMAGE_PRECISION 0.1

/// If a carbon is thrown at a speed faster than normal and impacts something solid, they take extra damage for every extra speed up to this number (see [/mob/living/carbon/proc/throw_impact])
#define CARBON_MAX_IMPACT_SPEED_BONUS 5

/// Alternate attack defines. Return these at the end of procs like afterattack_secondary.
/// Calls the normal attack proc. For example, if returned in afterattack_secondary, will call afterattack.
/// Will continue the chain depending on the return value of the non-alternate proc, like with normal attacks.
#define SECONDARY_ATTACK_CALL_NORMAL 1

/// Cancels the attack chain entirely.
#define SECONDARY_ATTACK_CANCEL_ATTACK_CHAIN 2

/// Proceed with the attack chain, but don't call the normal methods.
#define SECONDARY_ATTACK_CONTINUE_CHAIN 3

//Autofire component
/// Compatible firemode is in the gun. Wait until it's held in the user hands.
#define AUTOFIRE_STAT_IDLE (1<<0)
/// Gun is active and in the user hands. Wait until user does a valid click.
#define AUTOFIRE_STAT_ALERT	(1<<1)
/// Gun is shooting.
#define AUTOFIRE_STAT_FIRING (1<<2)

#define COMSIG_AUTOFIRE_ONMOUSEDOWN "autofire_onmousedown"
	#define COMPONENT_AUTOFIRE_ONMOUSEDOWN_BYPASS (1<<0)
#define COMSIG_AUTOFIRE_SHOT "autofire_shot"
	#define COMPONENT_AUTOFIRE_SHOT_SUCCESS (1<<0)

/// Martial arts attack requested but is not available, allow a check for a regular attack.
#define MARTIAL_ATTACK_INVALID NONE

/// Martial arts attack happened but failed, do not allow a check for a regular attack.
#define MARTIAL_ATTACK_FAIL COMPONENT_SKIP_ATTACK

/// Martial arts attack happened and succeeded, do not allow a check for a regular attack.
#define MARTIAL_ATTACK_SUCCESS COMPONENT_CANCEL_ATTACK_CHAIN

/// IF an object is weak against armor, this is the value that any present armor is multiplied by
#define ARMOR_WEAKENED_MULTIPLIER 2
/// Armor can't block more than this as a percentage
#define ARMOR_MAX_BLOCK 90
/// Calculates the new armour value after armour penetration. Can return negative values, and those must be caught.
#define PENETRATE_ARMOUR(armour, penetration) (penetration == 100 ? 0 : 100 * (armour - penetration) / (100 - penetration))

/// Return values used in item/melee/baton/baton_attack.
/// Does a normal item attack.
#define BATON_DO_NORMAL_ATTACK 1
/// The attack has been stopped. Either because the user was clumsy or the attack was blocked.
#define BATON_ATTACK_DONE 2
/// The baton attack is still going. baton_effect() is called.
#define BATON_ATTACKING 3

// Defines for combo attack component
/// LMB Attack
#define LEFT_ATTACK "Left Attack"
/// RMB Attack
#define RIGHT_ATTACK "Right Attack"
/// Steps for the combo
#define COMBO_STEPS "steps"
/// The proc the combo calls
#define COMBO_PROC "proc"

///Checks If the target can be moved at all by shoving them
#define SHOVE_CAN_MOVE (1<<0)
///If the target can be shoved into something something with perhaps special interactions.
#define SHOVE_CAN_HIT_SOMETHING (1<<1)
///Keeps knockdowns at bay for the target
#define SHOVE_KNOCKDOWN_BLOCKED (1<<2)
///If the target can be briefly paralized by shoving them once again after knocking them down.
#define SHOVE_CAN_KICK_SIDE (1<<3)
///Whether the staggered status effect can be applied on the target
#define SHOVE_CAN_STAGGER (1<<4)
///If the target could move, but didn't because there's an obstacle in the path.
#define SHOVE_BLOCKED (1<<5)
///If the obstacle is an object at the border of the turf (so no signal from being sent to the other turf)
#define SHOVE_DIRECTIONAL_BLOCKED (1<<6)

///Bitfield returned by listeners for COMSIG_LIVING_ENTER_STAMCRIT when they perform some action that prevents a mob going into stamcrit.
#define STAMCRIT_CANCELLED (1<<0)

///Deathmatch lobby current status
#define DEATHMATCH_NOT_PLAYING 0
#define DEATHMATCH_PRE_PLAYING 1
#define DEATHMATCH_PLAYING 2

/// The amount of energy needed to increase the burn force by 1 damage during electrocution.
#define JOULES_PER_DAMAGE (25 KILO JOULES)
/// Calculates the amount of burn force when applying this much energy to a mob via electrocution from an energy source.
#define ELECTROCUTE_DAMAGE(energy) (energy >= 1 KILO JOULES ? clamp(20 + round(energy / JOULES_PER_DAMAGE), 20, 195) + rand(-5,5) : 0)
