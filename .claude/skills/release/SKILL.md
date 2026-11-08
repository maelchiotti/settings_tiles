---
name: release
description: Prepare a new version of the settings_tiles package for pub.dev (version, CHANGELOG, README, example, dry run). Use when asked to release or prepare a version.
---

# Prepare a version

1. **Version**: bump `version` in `pubspec.yaml` with semantic versioning. A change of a public signature, a removed member or a visible change of the default appearance is a major version.
2. **CHANGELOG.md**: a `## X.Y.Z` section at the top, in the format of the previous sections (with breaking changes listed first for a major version). One line per change, written for the users of the package.
3. **README.md**: update the usage of every changed or added API.
4. **Example**: show every new option in `example/lib/main.dart`.
5. Run the `check` skill.
6. `dart pub publish --dry-run`: it must end without warnings.

Never run `dart pub publish`: the maintainer publishes. Then Material Notes (`maelchiotti/LocalMaterialNotes`) can bump its dependency.
