package;

import data.AssetPaths;
import data.music.*;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxGradient;
import flixel.util.FlxTimer;

class TitleState extends BeatHandler
{
	var logo:FlxSprite;

	var gradientBar:FlxSprite = new FlxSprite(0, 0).makeGraphic(FlxG.width, 1, 0xFFFF0000);

	override public function create()
	{
		gradientBar = FlxGradient.createGradientFlxSprite(Math.round(FlxG.width), 512, [
			0x00FF0000,
			0x1AFF0000,
			0x48FF0000,
			0x77FF0000,
			0xBDFF0000,
			0xECFF0000,
			0xFFFF0000
		], 1, 90, true);
		gradientBar.y = FlxG.height - gradientBar.height;
		gradientBar.scale.y = 1.3;
		gradientBar.scrollFactor.set();
		gradientBar.updateHitbox();
		add(gradientBar);

		logo = new FlxSprite().loadGraphic(AssetPaths.image('CHUPLOGO'));
		logo.scale.set(0.8, 0.8);
		logo.screenCenter();
		logo.antialiasing = true;
		add(logo);

		FlxG.sound.playMusic(AssetPaths.menuMusic('chupTitle'));

		super.create();
	}

	override public function update(elapsed:Float)
	{
		if (FlxG.keys.justPressed.ENTER)
		{
			FlxG.sound.play(AssetPaths.menuMusic('chupStart'));
			FlxG.sound.music.stop();

			FlxG.camera.flash(FlxColor.WHITE, 2, function()
			{
				FlxG.switchState(new PlayState());
			});
		}

		super.update(elapsed);
	}
}
