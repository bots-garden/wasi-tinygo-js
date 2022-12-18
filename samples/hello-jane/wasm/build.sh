#!/bin/bash
go mod tidy
tinygo build -o hello-jane.wasm -target wasi ./hello-jane.go

ls -lh *.wasm
