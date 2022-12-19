//import {WasmHelper, WasmModule} from 'wasi-tinygo-js'
import {WasmHelper, WasmModule} from '../../src/main.mjs'


(async () => {
  const wasm = await WasmHelper.compile("./wasm/hello.wasm")

  let wasmModule = new WasmModule(wasm)

  let success = await wasmModule.initialize()

  if(success) {

    const stringParameter = "Jane Doe";
    const bytes =
      new TextEncoder("utf8").encode(stringParameter)

    let result = wasmModule.callHandlerWithBytes(bytes)
    const strResult = new TextDecoder("utf8").decode(result.buffer)

    if(result.isError) {
      console.log("😡", strResult)
    } else {
      console.log("🙂", strResult)
    }
  }

})()
