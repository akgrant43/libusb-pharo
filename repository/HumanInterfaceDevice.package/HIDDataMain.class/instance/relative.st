accessing
relative
	self item
		dataAt: 1
		put: (self data first bitOr: self thirdBitMask)