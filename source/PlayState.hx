package;

import data.AssetPaths;
import data.music.*;
import editors.ZomMapper;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import obj.*;

class PlayState extends BeatHandler
{
	var bbz:FlxTypedGroup<Zomboyz>;

	var killLine:FlxSprite;

	var daZombss:Array<Zomboyz> = [];

	var badTime:Float = 0;

	var rankTxt:FlxText;

	override public function create()
	{
		persistentDraw = true;
		persistentUpdate = true;

		FlxG.sound.playMusic(AssetPaths.music('Test'));
		Conductor.setBPM(180);

		bbz = new FlxTypedGroup<Zomboyz>();
		add(bbz);

		daZombss = ZomMapper.zombieArr;

		for (i in 0...daZombss.length)
		{
			var zomb:Zomboyz = new Zomboyz(FlxG.width + daZombss[i].y * Conductor.bpm / 100, 0);
			bbz.add(zomb);
		}

		killLine = new FlxSprite(50, 0).makeGraphic(10, FlxG.height);
		add(killLine);

		rankTxt = new FlxText(0, 0, 0, '', 32);
		add(rankTxt);

		super.create();
	}

	override public function update(elapsed:Float)
	{
		Conductor.time = FlxG.sound.music.time;

		if (step % 4 == 0)
		{
			bbz.forEach(function(zomb:Zomboyz)
			{
				zomb.move(-60);

				if (zomb.overlaps(killLine))
					badTime += 0.01;
				else
					badTime = 0;
			});
		}

		rankTxt.text = Std.string(badTime);

		if (FlxG.keys.justPressed.R)
		{
			FlxG.switchState(new PlayState());
		}

		if (FlxG.keys.justPressed.ENTER)
		{
			FlxG.switchState(new ZomMapper());
		}
		super.update(elapsed);
	}
}
