package data;

import flixel.FlxG;
import flixel.graphics.frames.FlxAtlasFrames;
import lime.utils.Assets;

class AssetPaths
{
	inline public static function setPath(file:String)
	{
		return 'assets/$file';
	}

	inline public static function image(img:String)
	{
		return setPath('images/$img.png');
	}

	inline public static function audio(audio:String)
	{
		return setPath('sounds/$audio.ogg');
	}

	inline public static function menuMusic(music:String)
	{
		return setPath('menus/music/$music.ogg');
	}

	inline public static function music(music:String)
	{
		return setPath('music/${music.toLowerCase()}/$music.ogg');
	}

	inline public static function randomSound(sound:String, min:Int, max:Int)
	{
		return setPath('sounds/${sound + FlxG.random.int(min, max)}.ogg');
	}

	inline public static function json(json:String)
	{
		return Assets.getText('assets/data/songs/${json.toLowerCase()}.json');
	}

	inline public static function sparrow(sparrow:String)
	{
		return FlxAtlasFrames.fromSparrow(image('sparrow'), 'assets/images/$sparrow.xml');
	}
}
