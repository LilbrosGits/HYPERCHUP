package;

import data.AssetPaths;
import data.music.*;
import data.music.Song;
import editors.ZomMapper;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import haxe.Json;
import obj.*;

class PlayState extends BeatHandler
{
	var bbz:FlxTypedGroup<Zomboyz>;

	var killLine:FlxSprite;

	var song:Song;

	var daZombss:Array<Zomboyz> = [];

	var badTime:Float = 0;

	var rankTxt:FlxText;

	override public function create()
	{
		persistentDraw = true;
		persistentUpdate = true;

		song = new Song('SliceNDice');

		FlxG.sound.playMusic(AssetPaths.music(song.songData.song));
		Conductor.setBPM(song.songData.bpm);

		bbz = new FlxTypedGroup<Zomboyz>();
		add(bbz);

		for (i in 0...song.songData.zombies.length)
		{
			var zomb:Zomboyz = new Zomboyz(FlxG.width - song.songData.zombies[i].y /** Conductor.bpm / 100*/, 0);
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

			// FlxG.sound.play(AssetPaths.randomSound('chupNoises/chupgrunt_', 1, 14), 1);
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
