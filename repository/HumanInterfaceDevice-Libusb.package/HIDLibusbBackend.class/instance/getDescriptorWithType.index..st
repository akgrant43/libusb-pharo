standard requests
getDescriptorWithType: descriptorType index: descriptorIndex
	| data byteSent bytes |
	"According to http://www.usb.org/developers/hidpage/HID1_11.pdf section 5.3
	the generic item can be up to 259 bytes long.  Add 1 for safety (and make it a round number)"
	data := self externalCharArrayOfSize: 260.
	data autoRelease.
	byteSent:= libusbDeviceHandle
					controlTransferWithRequestType: (LUEndpointDirectionEnumeration LIBUSB_ENDPOINT_IN value
																	| LURequestTypeEnumeration LIBUSB_REQUEST_TYPE_STANDARD value
																	| LURequestRecipientEnumeration LIBUSB_RECIPIENT_INTERFACE value)
					request: LUStandardRequestEnumeration LIBUSB_REQUEST_GET_DESCRIPTOR value
					setupPacketValueField: (descriptorType << 8) | descriptorIndex
					setupPacketIndexField: self hidInterfaceForRequests
					data: data getHandle
					setupPacketFieldLength: data size
					timeout: self requestsTimeout.
	
	bytes := ByteArray new: byteSent.
	1 to: byteSent do: [ :i |
		bytes at: i put: (data at: i) ].
	^ bytes