package main

import (
	"fmt"
	"github.com/bots-garden/wasi-tinygo-js/wasihelpers"
	"os"
	"path/filepath"
)

func main() {
	if filepath.Ext(os.Args[0]) == ".wasm" {
		value, _ := Handler([]byte(os.Args[1]))
		fmt.Println(string(value))
	} else {
		wasihelpers.SetHandler(Handler)
	}
}

func Handler(param []byte) ([]byte, error) {

	message := "👋 Hello World 🌎" + string(param)
	return []byte(message), nil
}
