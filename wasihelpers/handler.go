package wasihelpers

var handlerFunction func(param []byte) ([]byte, error)

func SetHandler(function func(param []byte) ([]byte, error)) {
	handlerFunction = function
}

//export callHandler
func callHandler(subjectPosition *uint32, length int) uint64 {
	subjectBytes := Read(subjectPosition, length)
	retValue, err := handlerFunction(subjectBytes)

	if err != nil {
		// first byte == 69
		return Pack([]byte("E" + err.Error()))
	} else {
		// first byte == 82
		return Pack(append([]byte("R"), retValue...))
	}
}
