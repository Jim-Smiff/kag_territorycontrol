#include "Hitters.as";
#include "CommonGun.as";

void onInit(CBlob@ this)
{
	GunInitProjectile
	(
		this,
		false,				//If true, gun will be fully automatic and players will be able to just hold the fire button
		"grenade",			//Projectile to fire
		12.0f,				//Projectile speed
		20,					//Weapon fire delay, in ticks
		6,					//Weapon clip size
		1.00f,				//Ammo usage factor, completely ignore for now
		10,					//Weapon reload time
		true,				//If true, gun will be reloaded like a shotgun
		0,					//For shotguns: Additional delay to reload end
		"mat_grenade",	    //Ammo item blob name
		false,				//If true, firing sound will be looped until player stops firing
		SoundInfo("GrenadeLauncherFire",1,1.2f,0.75f),	//Sound to play when firing
		SoundInfo("GrenadeLauncherCycle",1,1.0f,1.00f),//Sound to play when reloading
		SoundInfo("",1,1.0f,0.0f),	//Sound to play some time after firing
		25,					//Delay for the delayed sound, in ticks
		Vec2f(0.0f,-2.0f)	//Offset for projectiles
	);
}
void onTick(CBlob@ this)
{
	GunTick(this);
}
