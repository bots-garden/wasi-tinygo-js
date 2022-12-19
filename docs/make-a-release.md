# Create a release

- Increment version in `package.json` (ex: `0.0.1`)
- Increment version in `update-modules-for-release.sh` (ex: `v0.0.1`)
- Run `update-modules-for-release.sh`
- Run `npm publish --access public`
