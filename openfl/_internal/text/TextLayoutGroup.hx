package openfl._internal.text;


import openfl.text.TextFormat;


class TextLayoutGroup {
	
	
	public var advances:Array<Float>;
	public var ascent:Float;
	public var descent:Float;
	public var format:TextFormat;
	public var height:Float;
	public var leading:Int;
	public var lineIndex:Int;
	public var offsetX:Float;
	public var offsetY:Float;
	public var width:Float;
	public var startIndex:Int;
	public var endIndex:Int;
  public var startIndexUtf:Int;
  public var endIndexUtf:Int;
	
	
	public function new (format:TextFormat, startIndex:Int, endIndex:Int, startIndexUtf:Int, endIndexUtf:Int) {
		
		this.format = format;
		this.startIndex = startIndex;
		this.endIndex = endIndex;
    this.startIndexUtf = startIndexUtf;
    this.endIndexUtf = endIndexUtf;
	}
	
	
}