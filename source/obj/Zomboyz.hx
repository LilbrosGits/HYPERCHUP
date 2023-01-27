package obj;

import data.AssetPaths;
import flixel.FlxSprite;

class Zomboyz extends FlxSprite
{
	public function new(x:Float, y:Float)
	{
		super(x, y);
		loadGraphic(AssetPaths.image('ZOMBOO'));
	}

	public function move(speed:Int)
	{
		x += speed;
	}
}
