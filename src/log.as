package
{
	import flash.external.ExternalInterface;

	public function log(...args:*) : void 
	{
		for (var i:uint = 0; i < args.length; i++)
		{
			ExternalInterface.call("console.log", args[i]);
			trace(args[i]);
		}
	}
}