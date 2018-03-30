baseline
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ 
			spec
				package: 'LibUsb';
				package: 'HumanInterfaceDevice';
				package: 'HumanInterfaceDevice-Tests' with: [ spec requires: 'HumanInterfaceDevice' ];
				package: 'HumanInterfaceDevice-GT' with: [ spec requires: 'HumanInterfaceDevice' ];
				package: 'HumanInterfaceDevice-SimulatedBackends' with: [ spec requires: 'HumanInterfaceDevice' ];
				package: 'HumanInterfaceDevice-Libusb' with: [ 
					spec
						requires: 'HumanInterfaceDevice';
						requires: 'LibUsb' ].
			spec
				group: 'core' with: #('HumanInterfaceDevice' 'HumanInterfaceDevice-GT');
				group: 'simulated-backend' with: #('core' 'HumanInterfaceDevice-SimulatedBackends');
				group: 'libusb-backend' with: #('core' 'HumanInterfaceDevice-Libusb') ]