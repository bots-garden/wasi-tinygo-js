package main

import (
	"github.com/bots-garden/wasi-tinygo-js/wasihelpers"
	"os"
)

func main() {
	wasihelpers.SetHandler(Handler)
}

func Handler(param []byte) ([]byte, error) {

	message := "👋 Hello World 🌎" + string(param)

	// This will map the `/sandbox` directory on the guest, to  the current directory (`./`) on the host
	err := os.WriteFile("/sandbox/output.txt", []byte(message), 0644)

	return []byte(message), err
}
