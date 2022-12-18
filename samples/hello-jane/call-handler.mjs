"use strict";

import {WasmHelper, WasmModule} from '../../src/main.mjs'

(async () => {
  const wasm = await WasmHelper.compile("./wasm/hello-jane.wasm")

  let wasmModule = new WasmModule(wasm)

  let success = await wasmModule.initialize()

  if(success) {

    const bytes = new TextEncoder("utf8").encode("Jane")
    let result1 = wasmModule.callHandlerWithBytes(bytes)

    if(result1.isError) {
      console.log("😡", result1.toString())
    } else {
      console.log("🙂", result1.toString())
    }

    let result2 = wasmModule.callHandlerWithString("John")
    if(result2.isError) {
      console.log("😡", result2.toString())
    } else {
      console.log("🙂", result2.toString())
    }

    let result3 = wasmModule.callHandlerWithJson({name:"Jane"})
    if(result3.isError) {
      console.log("😡", result3.toString())
    } else {
      console.log("🙂", result3.toString())
    }
  }

})();

