#!/bin/bash
wasmer wasm/hello.wasm "Jane"
wasmtime wasm/hello.wasm "Jane"
wasmedge wasm/hello.wasm "Jane"

