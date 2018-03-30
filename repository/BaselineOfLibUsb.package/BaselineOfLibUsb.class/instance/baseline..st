baseline
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ 
			spec
				package: 'LibUsb';
				package: 'LibUsb-GT' with: [ spec requires: 'LibUsb' ];
				package: 'LibUsb-UFFI' with: [ spec requires: 'LibUsb' ] ]