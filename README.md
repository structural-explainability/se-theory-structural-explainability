# SE Theory: Structural Explainability

[![Docs Site](https://img.shields.io/badge/docs-site-blue?logo=github)](https://structural-explainability.github.io/se-theory-structural-explainability/)
[![Repo](https://img.shields.io/badge/repo-GitHub-black?logo=github)](https://github.com/structural-explainability/se-theory-structural-explainability)
[![Tooling](https://img.shields.io/badge/python-3.15%2B-blue?logo=python)](./pyproject.toml)
[![License](https://img.shields.io/badge/license-MIT-yellow.svg)](./LICENSE)

[![CI-Lean](https://github.com/structural-explainability/se-theory-structural-explainability/actions/workflows/ci-lean.yml/badge.svg?branch=main)](https://github.com/structural-explainability/se-theory-structural-explainability/actions/workflows/ci-lean.yml)
[![CI](https://github.com/structural-explainability/se-theory-structural-explainability/actions/workflows/ci-python-zensical.yml/badge.svg?branch=main)](https://github.com/structural-explainability/se-theory-structural-explainability/actions/workflows/ci-python-zensical.yml)
[![Docs](https://github.com/structural-explainability/se-theory-structural-explainability/actions/workflows/deploy-zensical.yml/badge.svg?branch=main)](https://github.com/structural-explainability/se-theory-structural-explainability/actions/workflows/deploy-zensical.yml)
[![Links](https://github.com/structural-explainability/se-theory-structural-explainability/actions/workflows/links.yml/badge.svg?branch=main)](https://github.com/structural-explainability/se-theory-structural-explainability/actions/workflows/links.yml)

> Lean 4 formalization of Structural Explainability integration.

Composes the neutral structural substrate and identity regimes into cross-cutting
theorems, traceability relationships, and system-level structural invariants.

## Theory Repositories: Context

- NeutralSubstrate defines admissible structure
- IdentityRegimes defines identity mechanisms
- StructuralExplainability composes them into system-level theorems

## Scope

Repository scope is defined in `SE_MANIFEST.toml`.

## Exclusions

Repository exclusions are defined in `SE_MANIFEST.toml`.

## Design Constraints

Lean source files are authoritative for formal semantics and proofs.

Reference registries describe the registered public surface and
must correspond to that Lean surface.

Python and generated data may mirror, validate, export, or document the Lean surface.
They must not define theory semantics independently of Lean.

## Authority

Lean source files are authoritative for formal definitions, predicates, axioms,
theorems, proof obligations, and reference rules.

Reference artifacts under `reference/` and generated artifacts under
`data/` mirror the Lean public surface.
They do not define theory semantics independently of Lean.

The CI-Lean workflow builds the declared public Lean surface with
`lake build --wfail`,
failing on reported warnings, including `sorry`.
Successful compilation verifies formal declarations against their
stated assumptions; it does not establish the scientific adequacy
of those assumptions or interpretations.

## Import

Single import surface:

```lean
import StructuralExplainability
```

## Build

Use VS Code Menu:
View / Command Palette / `Developer: Reload Window` to refresh.

```shell
elan self update
lake update
lake build
lake build TestImport
lake build TestExport
```

## Command Reference

<details>
<summary>Show command reference</summary>

### In a machine terminal

Open a machine terminal where you want the project:

```shell
git clone https://github.com/structural-explainability/se-theory-neutral-substrate

cd se-theory-neutral-substrate
code .
```

### In a VS Code terminal

Use VS Code Menu:
View / Command Palette / `Developer: Reload Window` to refresh.

```shell
elan self update
lake update

# build Lean source of truth
lake build
lake test

# inspect shared theory-reference command surface
uv run se-theory-reference --help
uv run se-theory-reference validate --help
uv run se-theory-reference scaffold --help
uv run se-theory-reference export --help
uv run se-theory-reference catalog --help
uv run se-theory-reference inspect --help

# validate reference artifacts against the declared Lean public surface
uv run se-theory-reference validate
uv run se-theory-reference validate --strict

# scaffold reference artifacts from Lean public declarations
uv run se-theory-reference scaffold
uv run se-theory-reference scaffold --dry-run
uv run se-theory-reference scaffold --overwrite

# regenerate or check generated JSON artifacts from reference TOML
uv run se-theory-reference export
uv run se-theory-reference export --check

# build or verify the generated reference catalog
uv run se-theory-reference catalog
uv run se-theory-reference catalog --check

# inspect resolved repository configuration and reference declarations
uv run se-theory-reference inspect

# validate SE manifest file
uvx se-manifest-schema validate-manifest --path SE_MANIFEST.toml --strict

# fix issues
git add -A
uvx pre-commit run --all-files
# repeat if changes were made
uvx pre-commit run --all-files

# type checks, tests, docs
uv run python -m pyright
uv run python -m pytest
uv run python -m zensical build

# save progress
git add -A
git commit -m "update"
git push -u origin main
```

</details>

## Authority Manifest

[.accountability/surfaces.toml](./.accountability/surfaces.toml)

## Citation

[CITATION.cff](./CITATION.cff)

## License

[MIT](./LICENSE)

## Repository Manifest

[SE_MANIFEST.toml](./SE_MANIFEST.toml)
