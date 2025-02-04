#include "Hitters.as";
#include "CommonGun.as";

void onInit(CBlob@ this)
{
	GunInitProjectile(
		this,
		true,				//If true, gun will be fully automatic and players will be able to just hold the fire button
		"firegas",			//Projectile to fire
		12.0f,				//Projectile speed
		2,					//Weapon fire delay, in ticks
		50,					//Weapon clip size
		1.00f,				//Ammo usage factor, completely ignore for now
		60,					//Weapon reload time
		false,				//If true, gun will be reloaded like a shotgun
		0,					//For shotguns: Additional delay to reload end
		"mat_fuel",			//Ammo item blob name
		true,				//If true, firing sound will be looped until player stops firing
		SoundInfo("FlamethrowerFire",1,1.0f,0.60f),		//Sound to play when firing
		SoundInfo("FlamethrowerReload",1,1.0f,0.65f),	//Sound to play when reloading
		SoundInfo(),									//Sound to play some time after firing
		0,					//Delay for the delayed sound, in ticks
		Vec2f(8.0f,-4.0f)	//Offset for projectiles
	);
}
void onTick(CBlob@ this)
{
	GunTick(this);
}

f32 onHit(CBlob@ this, Vec2f worldPoint, Vec2f velocity, f32 damage, CBlob@ hitterBlob, u8 customData)
{
	if (customData == Hitters::burn || customData == Hitters::fire) return 0;
	return damage;
}
/*
// for (int i = 1; i < 5; i++) MakeParticle(this, -dir * i, "SmallExplosion");
void MakeParticle(CBlob@ this, const Vec2f vel, const string filename = "SmallSteam")
{
	if (!isClient()) return;

	Vec2f offset = Vec2f(8, 0).RotateBy(this.getAngleDegrees());
	ParticleAnimated(CFileMatcher(filename).getFirst(), this.getPosition() + offset, vel, float(XORRandom(360)), 1.0f, 2 + XORRandom(3), -0.1f, false);
}*/