package data.music;

import flixel.addons.ui.FlxUIState;

class BeatHandler extends FlxUIState
{
	private var beat:Int = 0;
	private var step:Int = 0;

	override public function create()
	{
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
