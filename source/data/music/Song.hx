package data.music;

import haxe.Json;
import lime.utils.Assets;
import obj.Zomboyz;

typedef SongData =
{
	song:String,
	bpm:Float,
	zombies:Array<Zomboyz>
}

class Song
{
	public var songData:SongData;

	public function new(song:String)
	{
		songData = Json.parse(AssetPaths.json(song));
	}
}
