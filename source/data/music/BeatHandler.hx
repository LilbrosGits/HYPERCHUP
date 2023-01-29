package data.music;

import flixel.FlxG;
import flixel.addons.transition.FlxTransitionSprite.GraphicTransTileDiamond;
import flixel.addons.transition.FlxTransitionSprite.GraphicTransTileSquare;
import flixel.addons.transition.FlxTransitionableState;
import flixel.addons.transition.TransitionData;
import flixel.addons.ui.FlxUIState;
import flixel.graphics.FlxGraphic;
import flixel.math.FlxPoint;
import flixel.math.FlxRect;
import flixel.util.FlxColor;

class BeatHandler extends FlxUIState
{
	private var beat:Int = 0;
	private var step:Int = 0;

	override public function create()
	{
		var diamond:FlxGraphic = FlxGraphic.fromClass(GraphicTransTileSquare);
		diamond.persist = true;
		diamond.destroyOnNoUse = false;

		FlxTransitionableState.defaultTransIn = new TransitionData(TILES, 0x690000, 1, new FlxPoint(0, -1), {asset: diamond, width: 32, height: 32},
			new FlxRect(-200, -200, FlxG.width * 1.4, FlxG.height * 1.4));
		FlxTransitionableState.defaultTransOut = new TransitionData(TILES, 0x690000, 0.7, new FlxPoint(0, 1), {asset: diamond, width: 32, height: 32},
			new FlxRect(-200, -200, FlxG.width * 1.4, FlxG.height * 1.4));

		transIn = FlxTransitionableState.defaultTransIn;
		transOut = FlxTransitionableState.defaultTransOut;

		super.create();
	}

	override public function update(elapsed:Float)
	{
		var safeSteps = step; // baby stepss
		updateStep();
		updateBeat();
		if (safeSteps != step && step > 0)
		{
			onStep();
		}
		super.update(elapsed);
	}

	public function updateStep()
	{
		step = Math.floor(Conductor.time / Conductor.stepCrochet);
	}

	public function updateBeat()
	{
		beat = Math.floor(step / 4);
	}

	public function onStep()
	{
		if (step % 4 == 0)
			onBeat();
	}

	public function onBeat()
	{
		// handled in game
	}
}
