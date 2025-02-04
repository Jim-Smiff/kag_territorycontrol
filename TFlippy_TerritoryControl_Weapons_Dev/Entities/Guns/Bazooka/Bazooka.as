#include "Hitters.as";
#include "CommonGun.as";

void onInit(CBlob@ this)
{
	GunInitProjectile(
		this,
		false,				//If true, gun will be fully automatic and players will be able to just hold the fire button
		"smallrocket",		//Projectile to fire
		0.0f,				//Projectile speed
		40,					//Weapon fire delay, in ticks
		1,					//Weapon clip size
		1.00f,				//Ammo usage factor, completely ignore for now
		50,					//Weapon reload time
		false,				//If true, gun will be reloaded like a shotgun
		0,					//For shotguns: Additional delay to reload end
		"mat_smallrocket",	//Ammo item blob name
		false,				//If true, firing sound will be looped until player stops firing
		SoundInfo("BazookaFire",1,1.0f,1.00f),	//Sound to play when firing
		SoundInfo("BazookaReload",1,1.0f,0.63f),//Sound to play when reloading
		SoundInfo("BazookaCycle",1,1.0f,1.0f),	//Sound to play some time after firing
		25,					//Delay for the delayed sound, in ticks
		Vec2f(8.0f,-3.0f)	//Offset for projectiles
	);
	this.getShape().SetOffset(Vec2f(-2, -2));
}
void onTick(CBlob@ this)
{
	GunTick(this);
}