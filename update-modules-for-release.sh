#!/bin/bash

TAG="v0.0.1"
echo "👋 change version number in package.json"
cd wasihelpers
go mod edit -replace github.com/bots-garden/wasi-tinygo-js@${TAG}=../

cd ..
git add .
git commit -m "📦 updates modules for ${TAG}"

git tag ${TAG}
git tag wasihelpers/${TAG}

git push origin main ${TAG} wasihelpers/${TAG}
