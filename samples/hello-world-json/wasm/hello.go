package main

import (
	"fmt"
	"github.com/bots-garden/wasi-tinygo-js/wasihelpers"
	"github.com/valyala/fastjson"
)

func main() {
	wasihelpers.SetHandler(Handler)
}

func Handler(param []byte) ([]byte, error) {

	parser := fastjson.Parser{}
	jsonValue, err := parser.Parse(string(param))

	if err != nil {
		return nil, err
	} else {
		firstName := string(jsonValue.GetStringBytes("firstName"))
		lastName := string(jsonValue.GetStringBytes("lastName"))
		jsonMessage := fmt.Sprintf(`{"message":"👋 Hello World 🌎 %s %s"}`, firstName, lastName)

		return []byte(jsonMessage), nil
	}

}
