//import {WasmHelper, WasmModule} from 'wasi-tinygo-js'
import {WasmHelper, WasmModule} from '../../src/main.mjs'


(async () => {
  const wasm = await WasmHelper.compile("./wasm/hello.wasm")

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
