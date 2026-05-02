# Changelog

<!-- markdownlint-disable MD024 -->

All notable changes to this project will be documented in this file.

The format is based on **[Keep a Changelog](https://keepachangelog.com/en/1.1.0/)**
and this project adheres to **[Semantic Versioning](https://semver.org/spec/v2.0.0.html)**.

---

## [Unreleased]

---

## [0.2.0] - 2026-05-02

### Added

- `reference/se-theorems.toml` entries for `composable_of_neutral` and
  `integrated_of_composable` (previously absent; source in `Theorems.lean`).
- `reference/se-theorems.toml` entries for `emptyOntology_neutral`,
  `oblContext_composable`, and `oblContext_integrated` (moved from witnesses;
  Lean `theorem` declarations, not `def` witness objects).
- `cite_id` fields for all SE reference artifacts:
  `SE.TYPE.*`, `SE.PRED.*`, `SE.WIT.*`, `SE.THM.*` naming scheme.

### Changed

- `lean_surface.py`: moved `emptyOntology_neutral`, `oblContext_composable`,
  and `oblContext_integrated` from `SURFACE_WITNESSES` to `SURFACE_THEOREMS`.
  `SURFACE_WITNESSES` now contains only Lean `def` declarations.
  Added witness-vs-theorem convention note to module docstring.
- `reference/se-witnesses.toml`: removed `emptyOntology_neutral`
  (Lean `theorem`, not `def`; registered in `se-theorems.toml`).
- `reference.py`: extended `all_lean_by_name` scan to cover all `.lean` files
  under the namespace root recursively. Previously only declared `source_modules`
  were scanned, causing false orphan warnings for symbols defined in `Witness.lean`.
  Symbols in `Witness.lean` are now correctly identified as kind-mismatches
  rather than orphans when registered under the wrong artifact section.

---

## [0.1.0] - 2026-5-01

### Added

- Added `reference.py` for checking and scaffolding. Runs; needs a bit of tuning.
- Added `reference/` artifacts for the public theory surface.
- Added `reference/index.toml` to declare machine-readable reference artifacts.
- Added reference validation for:
  - `reference/index.toml` structure.
  - declared artifact paths.
  - declared artifact formats.
  - Lean public surface coverage.
- Added `lean_surface.py` to mirror the exported symbols from `Surface.lean`.
- Added `paths.py` for repository path helpers used by reference validation.
- Added `proof-registry.json` as the planned Lean-generated proof metadata artifact.

### Changed

- Extended repository validation to include the `reference/` artifact surface.
- Updated validation output to show each reference validation step explicitly.

---

### Notes

- Establishes formal contract as the root dependency for the SE ecosystem.
- Lean definitions are the authoritative source of contract structure.
- Exported artifacts are generated and must not be manually edited.
- Proof surface is partial; theorem statuses are initially marked as pending.

---

## Notes on versioning and releases

- We use **SemVer**:
  - **MAJOR** – breaking changes to artifact structure or validation semantics
  - **MINOR** – backward-compatible additions to schema or validation rules
  - **PATCH** – fixes, documentation, tooling
- Versions are driven by git tags. Tag `vX.Y.Z` to release.
- Docs are deployed per version tag and aliased to **latest**.

## Release Procedure (Required)

Follow these steps exactly when creating a new release.

### Task 1. Update release metadata (manual edits)

1.1. CITATION.cff: update version and date-released
1.2. lakefile.toml: update version
1.3. CHANGELOG.md: add section, move unreleased entries, update links

### Task 2. Sync and Validate

Sync reads `CITATION.cff` version and `date-released`
and updates `pyproject.toml` fallback-version.

```shell
uv run se-manifest-version-sync
uv sync --extra dev --extra docs --upgrade
uv run se-validate --strict
git add -A
uvx pre-commit run --all-files
uv run python -m pyright
uv run python -m pytest
uv run python -m zensical build
```

### Task 3. Commit, tag, push

```shell
git add -A
git commit -m "Prep X.Y.Z"
git push -u origin main
```

Verify actions run on GitHub. After success:

```shell
git tag vX.Y.Z -m "X.Y.Z"
git push origin vX.Y.Z
```

### Task 4. Verify tag consistency

```shell
uv run se-validate --require-tag
```

Confirms CITATION.cff version matches the pushed git tag.
Run this after `git push origin vX.Y.Z`; it will fail before that point.

## Only As Needed (delete a tag)

```shell
git tag -d vX.Z.Y
git push origin :refs/tags/vX.Z.Y
```

## Links

[Unreleased]: https://github.com/structural-explainability/se-theory-structural-explainability/compare/v0.2.0...HEAD
[0.2.0]: https://github.com/structural-explainability/se-theory-structural-explainability/releases/tag/v0.2.0
[0.1.0]: https://github.com/structural-explainability/se-theory-structural-explainability/releases/tag/v0.1.0
