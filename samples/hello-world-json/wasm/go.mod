module hello-world-json

go 1.19

replace github.com/bots-garden/wasi-tinygo-js/wasihelpers => ../../../wasihelpers

require (
	github.com/bots-garden/wasi-tinygo-js/wasihelpers v0.0.0-00010101000000-000000000000
	github.com/valyala/fastjson v1.6.3
)
