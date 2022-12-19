#!/bin/bash
go mod tidy
tinygo build -o hello.wasm -target wasi ./hello.go

ls -lh *.wasm
