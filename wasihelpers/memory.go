package wasihelpers

import "unsafe"

/*
Allocate the in-Wasm memory region and returns its pointer to hosts.
The region is supposed to store strings generated in hosts.
*/

//export alloc
func alloc(size uint32) *byte {
	buf := make([]byte, size)
	return &buf[0]
}

func Pack(buffer []byte) uint64 {
	bufferPtr := &buffer[0]
	unsafePtr := uintptr(unsafe.Pointer(bufferPtr))

	ptr := uint32(unsafePtr)
	size := uint32(len(buffer))

	return (uint64(ptr) << uint64(32)) | uint64(size)
}

func Read(subjectPosition *uint32, length int) []byte {
	subjectBuffer := make([]byte, length)
	pointer := uintptr(unsafe.Pointer(subjectPosition))
	for i := 0; i < length; i++ {
		s := *(*int32)(unsafe.Pointer(pointer + uintptr(i)))
		subjectBuffer[i] = byte(s)
	}
	return subjectBuffer
}
