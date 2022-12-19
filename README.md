# WASI TinyGo JS Helpers

Build [TinyGo]() functions for [Node.js]() thanks to WebAssembly and the Node.js [WASI]() support.

> - `wasi-tinygo-js` is both a npm package and a Golang library.
> - Why TinyGo? It's the only Go compiler that can build WASI compliant wasm modules

## Install

> Node.js
```bash
npm install wasi-tinygo-js@0.0.0
```

> Go
```go
import (
"github.com/bots-garden/wasi-tinygo-js/wasihelpers"
)
```

## Create and build a wasm module (with TinyGo)

```go
package main

import (
	"github.com/bots-garden/wasi-tinygo-js/wasihelpers"
)

func main() {
	wasihelpers.SetHandler(Handler)
}

func Handler(param []byte) ([]byte, error) {

	message := "👋 Hello World 🌎" + string(param)
	return []byte(message), nil
}
```

> Build
```bash
tinygo build -o hello.wasm -target wasi ./hello.go
```

## Call the TinyGo Wasm function from Node.js

```javascript
import {WasmHelper, WasmModule} from 'wasi-tinygo-js'

(async () => {
  const wasm = await WasmHelper.compile("./hello.wasm")

  let wasmModule = new WasmModule(wasm)

  let success = await wasmModule.initialize()

  if(success) {

    let result = wasmModule.callHandlerWithString("John Doe")
    if(result.isError) {
      console.log("😡", result.toString())
    } else {
      console.log("🙂", result.toString())
    }
  }

})()
```
> You can call the Go handler with 3 types:
> - Bytes: `wasmModule.callHandlerWithBytes(new TextEncoder("utf8").encode("John Doe"))`
> - String: `wasmModule.callHandlerWithString("John Doe")`
> - JSON: `wasmModule.callHandlerWithJson({firstName: "John", lastName: "Doe"})`
>
> The 3 `callHandler` methods return a `BufferResult` type:
> ```mermaid
> classDiagram
>   class BufferResult {
>     +Uint8Array buffer
>     +boolean isError
>     +BufferResult constructor(Uint8Array, boolean)
>     +string toString()
>     +object toJson()
>   }
> ```

