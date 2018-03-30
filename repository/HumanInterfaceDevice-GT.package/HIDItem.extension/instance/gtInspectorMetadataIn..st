*HumanInterfaceDevice-GT
gtInspectorMetadataIn: composite
	<gtInspectorPresentationOrder: 0>  
	^ composite table
		title: 'Metadata';
		display: [ { 
			'Size' -> self size.
			'Type' -> self type.
			'Tag' -> self tag } ];
		column: 'Metadata name' evaluated: [ :assoc | assoc key ];
		column: 'Value' evaluated: [ :assoc | assoc value ];
		yourself