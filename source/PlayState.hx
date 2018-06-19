package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;

class PlayState extends FlxState
{
	private var _beeAmount:Int = 0;
	private var _beeTimer:Float = 0;
	private var _bps:Float = 0;
	
	private var _txtBeeCount:FlxText;
	private var _txtBPS:FlxText;
	
	private var _btnBee:FlxButton;
	
	override public function create():Void
	{
		_btnBee = new FlxButton(20, 20, "MORE BEES", function(){ _beeAmount += 1; });
		add(_btnBee);
		
		_txtBeeCount = new FlxText(20, 50, 0, "Bees: " + _beeAmount, 25);
		add(_txtBeeCount);
		
		_txtBPS = new FlxText(120, 80, 0, "Bees per second: " + _bps, 25);
		add(_txtBPS);
		
		
		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		_txtBeeCount.text = "Bees: " + _beeAmount;
		
		_txtBPS.text = "BPS: " + _bps + "\nBee timer: " + _beeTimer + "\nTime needed " + _bps / 60 + "\n";
		
		if (_beeAmount > 0)
		{
			
			_bps = _beeAmount * 0.1;
			
			if (_beeTimer < _bps / 60)
			{
				_beeTimer += FlxG.elapsed;
			}
			else
			{
				_beeAmount += FlxG.random.int(1, 4);
				_beeTimer = 0;
			}
			
		}
		
		
		
	}
}
