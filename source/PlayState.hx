package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;

class PlayState extends FlxState
{
	private var _beeArray:Array<Int> =
	[
		
		0,	// Normal
		0	// queen
	];
	
	private var _beeTimer:Float = 0;
	private var _bps:Float = 0;
	
	private var _txtBeeCount:FlxText;
	private var _txtBPS:FlxText;
	
	private var _btnBee:FlxButton;
	
	override public function create():Void
	{
		_btnBee = new FlxButton(20, 20, "MORE BEES", function(){ _beeArray[0] += 1; });
		add(_btnBee);
		
		var _btnQueen:FlxButton = new FlxButton(20, 300, "Buy a queen", function(){ _beeArray[1] += 1; });
		add(_btnQueen);
		
		_txtBeeCount = new FlxText(20, 50, 0, "Bees: " + _beeArray[0], 25);
		add(_txtBeeCount);
		
		_txtBPS = new FlxText(120, 80, 0, "Bees per second: " + _bps, 25);
		add(_txtBPS);
		
		
		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		_txtBeeCount.text = "Bees: " + _beeArray[0] + " Queen Bees: " + _beeArray[1];
		
		_txtBPS.text = "BPS: " + _bps + "\nBee timer: " + _beeTimer + "\nTime needed " + 1 / _bps + "\n";
		
		if (_beeArray[1] > 0)
		{
			
			_bps = _beeArray[1] * 0.15;
			
			if (_beeTimer < 1 / _bps)
			{
				_beeTimer += FlxG.elapsed;
			}
			else
			{
				_beeArray[0] += FlxG.random.int(1, 4);
				_beeTimer = 0;
			}
			
		}
		
		
		
	}
}
