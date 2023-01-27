package editors;

import data.AssetPaths;
import data.music.*;
import flixel.FlxCamera.FlxCameraFollowStyle;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import obj.*;

class ZomMapper extends BeatHandler
{
	var snapGrid:Int = 40;

	var zomGrid:FlxSprite;

	public static var zombieArr:Array<Zomboyz> = [];

	var zombies:FlxTypedGroup<Zomboyz>;

	var timeLine:FlxSprite;

	override public function create()
	{
		FlxG.sound.playMusic(AssetPaths.music('Test'));
		FlxG.sound.music.pause();

		zomGrid = new FlxSprite().makeGraphic(40, 40 * 16, FlxColor.BLUE);
		add(zomGrid);

		zomGrid.scale.y = Std.int(FlxG.sound.music.length);

		zombies = new FlxTypedGroup<Zomboyz>();
		add(zombies);

		timeLine = new FlxSprite(0, 0).makeGraphic(FlxG.width, 10);
		add(timeLine);

		FlxG.camera.follow(timeLine);

		super.create();
	}

	function addZom()
	{
		var zoom:Zomboyz = new Zomboyz(Math.floor(FlxG.mouse.x / 40) * 40, Math.floor(FlxG.mouse.y / 40) * 40);
		zoom.setGraphicSize(40, 40);
		zoom.updateHitbox();
		zombies.add(zoom);
		zombieArr.push(zoom);
	}

	override public function update(elapsed:Float)
	{
		Conductor.time = FlxG.sound.music.time;
		Conductor.setBPM(180);

		if (FlxG.mouse.overlaps(zomGrid))
		{
			if (FlxG.mouse.justPressed)
			{
				addZom();
			}
		}

		if (FlxG.keys.justPressed.SPACE && FlxG.sound.music.playing)
			FlxG.sound.music.pause();

		if (FlxG.keys.justPressed.SPACE && !FlxG.sound.music.playing)
			FlxG.sound.music.play();

		if (beat % 4 == 0 && FlxG.sound.music.playing)
		{
			timeLine.y += Conductor.bpm / 2;
		}

		if (FlxG.keys.justPressed.ENTER)
		{
			FlxG.switchState(new PlayState());
		}
		super.update(elapsed);
	}
}
