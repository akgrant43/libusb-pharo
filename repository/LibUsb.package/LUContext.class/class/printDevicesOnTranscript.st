examples
printDevicesOnTranscript
	<script>

	LUContext
		withAllDevicesDo: [ :context :devices | 
			context logLevelDebug.
			devices
				do: [ :device | 
					Transcript
						show: 'Bus ';
						show: (device busNumber printPaddedWith: $0 to: 3 base: 10);
						show: ' Device ';
						show: (device address printPaddedWith: $0 to: 3 base: 10);
						show: ': ID ';
						show: (device idVendor printPaddedWith: $0 to: 4 base: 16);
						show: ':';
						show: (device idProduct printPaddedWith: $0 to: 4 base: 16);
						space.
					[ Transcript
						show: device manufacturerDescription;
						space;
        				show: device productDescription ]
							on: Error 
							do: [ ].
					Transcript
						cr ] ]