package data.music;

class Conductor
{
	public static var bpm:Float = 100;
	public static var crochet:Float = ((60 / bpm) * 1000);
	public static var stepCrochet:Float = crochet / 4;
	public static var time:Float = 0;

	public function new() {} // do abs nothing hahahahh

	public static function setBPM(daBPM:Float)
	{
		bpm = daBPM;

		crochet = ((60 / bpm) * 1000);

		stepCrochet = crochet / 4;
	}
}
