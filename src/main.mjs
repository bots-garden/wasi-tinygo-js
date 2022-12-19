const wasi_tinygo_js = "0.0.0"

import {WASI} from 'wasi'
import fs from 'node:fs'

import process from 'node:process'

const wasi = new WASI({
  args: process.argv, env: process.env
});
const importObject = { wasi_snapshot_preview1: wasi.wasiImport };
const MASK = (2n**32n)-1n;

export function version() {
  return wasi_tinygo_js
}

/** Class representing a WasmHelper. */
export class WasmHelper {
  /**
   * Compiles WebAssembly binary code into a WebAssembly.Module object.
   * @param {string} wasmFilePath - The string containing the path to the wasm file.
   * @return {Promise<Module>} A Promise of a WebAssembly.Module.
   */
  static compile(wasmFilePath) {
    return WebAssembly.compile(
      fs.readFileSync(wasmFilePath)
    );
  }
}

class BufferResult {
  /**
   * @member {Uint8Array}
   */
  buffer = null
  /**
   * @member {boolean}
   */
  isError = false

  /**
   * Create a Buffer Result.
   * @param {Uint8Array} buffer - the payload.
   * @param {boolean} isError - is the result an error
   */
  constructor(buffer, isError) {
    this.buffer = buffer
    this.isError = isError
  }

  /**
   * Convert buffer to string.
   * @return {string} The string result.
   */
  toString() {
    return new TextDecoder("utf8").decode(this.buffer)
  }

  /**
   * Convert buffer to Json object.
   * @return {object} The JSON object result.
   */
  toJson() {
    return JSON.parse(new TextDecoder("utf8").decode(this.buffer))
  }
}



export class WasmModule {
  /**
   * @member {Module}
   */
  wasmModule = null
  /**
   * @member {Instance}
   */
  wasmModuleInstance = null

  /**
   * Create a WasmModule.
   * @param {Module} wasm - The compiled wasm module.
   */
  constructor(wasm) {
    //super(props);
    this.wasmModule = wasm

  }

  /**
   * Instantiate and start WebAssembly code.
   * @return {Promise<boolean>} A Promise of an Instance of the WebAssembly module.
   */
  initialize() {
    return WebAssembly.instantiate(this.wasmModule, importObject)
      .then(instance => {
        wasi.start(instance)
        this.wasmModuleInstance = instance
        return true
      })
      .catch(error => error)
  }

  /**
   * Call the `callHandler` TinyGo exported function.
   * @param {string}  payload - The string payload.
   * @return {BufferResult} result - The bytes array result (and isError).
   * {Uint8Array} result.buffer
   * {boolean} result.isError
   */
  callHandlerWithString(payload) {
    const bytes = new TextEncoder("utf8").encode(payload)
    return this.callHandlerWithBytes(bytes)
  }

  /**
   * Call the `callHandler` TinyGo exported function.
   * @param {object} payload - The JSON object payload.
   * @return {BufferResult} result - The bytes array result (and isError).
   * {Uint8Array} result.buffer
   * {boolean} result.isError
   */
  callHandlerWithJson(payload) {
    const bytes = new TextEncoder("utf8").encode(JSON.stringify(payload))
    return this.callHandlerWithBytes(bytes)
  }

  /**
   * Call the `callHandler` TinyGo exported function.
   * @param {Uint8Array} bytes - The bytes array payload.
   * @return {BufferResult} result - The bytes array result (and isError).
   * {Uint8Array} result.buffer
   * {boolean} result.isError
   */
  callHandlerWithBytes(bytes) {
    // Copy the contents of bytes payload into the module's memory
    const ptr = this.wasmModuleInstance.exports.alloc(bytes.length)
    const mem = new Uint8Array(
      this.wasmModuleInstance.exports.memory["buffer"], ptr, bytes.length
    )
    mem.set(new Uint8Array(bytes))

    // Call `callHandler` and get a kind of pair of value
    const pointerAndSize = this.wasmModuleInstance.exports.callHandler(ptr, bytes.length)

    const memory = this.wasmModuleInstance.exports.memory
    const completeBufferFromMemory = new Uint8Array(memory.buffer)

    // Extract the values of the pair
    const ptrPosition = Number(pointerAndSize >> BigInt(32))
    const stringSize = Number(pointerAndSize & MASK)

    let extractedBuffer = completeBufferFromMemory.slice(
      ptrPosition, ptrPosition + stringSize
    )

    return new BufferResult(extractedBuffer.slice(1, stringSize), extractedBuffer[0] === 69)
  }
}
