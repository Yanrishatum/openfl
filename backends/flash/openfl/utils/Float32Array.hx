package openfl.utils;


import openfl.geom.Matrix3D;


class Float32Array extends ArrayBufferView implements ArrayAccess<Float> {
	
	
	static public inline var SBYTES_PER_ELEMENT = 4;
	
	public var BYTES_PER_ELEMENT (default, null):Int;
	public var length (default, null):Int;
	
	
	public function new (bufferOrArray:Dynamic, start:Int = 0, length:Null<Int> = null) {
		
		BYTES_PER_ELEMENT = 4;
		
		if (Std.is (bufferOrArray, Int)) {
			
			super (Std.int (bufferOrArray) * BYTES_PER_ELEMENT);
			this.length = Std.int(bufferOrArray);
			
		} else if (Std.is (bufferOrArray, Array)) {
			
			var floats:Array<Float> = bufferOrArray;
			
			if (length != null) {
				
				this.length = length;
				
			} else {
				
				this.length = floats.length - start;
				
			}
			
			super (this.length << 2);
			
			buffer.position = 0;
			
			for (i in 0...this.length) {
				
				buffer.writeFloat (floats[i + start]);
				
			}
			
		} else {
			
			super (bufferOrArray, start, length);
			
			if ((byteLength & 0x03) > 0) {
				
				throw("Invalid array size");
				
			}
			
			this.length = byteLength >> 2;
			
			if ((this.length << 2) != byteLength) {
				
				throw "Invalid length multiple";
				
			}
			
		}
		
	}
	
	
	public static function fromMatrix (matrix:Matrix3D):Float32Array {
		
		return new Float32Array (matrix.rawData);
		
	}
	
	
	@:noCompletion @:keep inline public function __get (index:Int):Float { return getFloat32 (index << 2); }
	@:noCompletion @:keep inline public function __set (index:Int, value:Float):Void { setFloat32 (index << 2, value); }
	
	
}
