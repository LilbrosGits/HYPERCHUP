package data;

import flixel.graphics.frames.FlxAtlasFrames;

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

	inline public static function music(music:String)
	{
		return setPath('music/${music.toLowerCase()}/$music.ogg');
	}

	inline public static function song(song:String)
	{
		return setPath('data/songs/$song.song');
	}

	inline public static function sparrow(sparrow:String)
	{
		return FlxAtlasFrames.fromSparrow(image('sparrow'), 'assets/images/$sparrow.xml');
	}
}
