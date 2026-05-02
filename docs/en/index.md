# SE Theory: Structural Explainability

> Lean 4 formalization of Structural Explainability integration.

This repository composes the neutral structural substrate and identity regimes
into cross-cutting theorems, traceability relationships, and
system-level structural invariants.

It does not define substrate primitives or identity regimes.

## Boundary

This documentation is non-authoritative.
All formal definitions, invariants, and theorems are defined exclusively
in Lean source files under `StructuralExplainability/`.

If documentation and Lean diverge, **Lean is correct**.

## Purpose

Structural Explainability establishes the **integration layer** of the theory.

It answers:

- How do admissible structures and identity regimes compose?
- What guarantees hold across both layers?
- How can identity, structure, and explanation remain coherent together?
- What system-level invariants follow from composition?

It does not define the components it composes.

## Scope

### Includes

- Integration of neutral substrate and identity regimes
- Cross-cutting Structural Explainability theorems
- Traceability across substrate and regime layers
- Composition of admissibility and regime application
- System-level structural invariants
- Machine-checked Lean theorems

### Excludes

- Neutral substrate primitives
- Identity regime definitions
- Regime requirement structure
- Regime-profile derivation
- Persistence behavior
- Mapping semantics
- Domain-specific data or examples
- Operational validation logic
- Runtime systems

## Structure

The root file provides a single import surface:

```lean
import StructuralExplainability
```

Internal modules:

| File                | Role                                                                   |
| ------------------- | ---------------------------------------------------------------------- |
| `Basic.lean`        | Core types for the integration layer (`SEContext`)                     |
| `Composition.lean`  | Composability predicate and neutral-substrate composition              |
| `Integration.lean`  | Integration predicate combining traceability and composability         |
| `Theorems.lean`     | Export-facing integration theorems                                     |
| `Traceability.lean` | Traceability predicate for substrate and regime layers                 |
| `Witness.lean`      | Concrete witness objects confirming the integration layer is inhabited |

## Basic

`StructuralExplainability/Basic.lean`

Defines `SEContext`: the integration context pairing a neutral substrate
with an identity regime profile. This is the primary object the rest of
the layer operates on.

## Composition

`StructuralExplainability/Composition.lean`

Defines `Composable`: the predicate asserting that an `SEContext` satisfies
the admissibility conditions required for regime application over its substrate.

Key theorem: `composable_of_neutral` - a neutral substrate yields a composable
context for any regime profile.

## Integration

`StructuralExplainability/Integration.lean`

Defines `Integrated`: the predicate asserting that an `SEContext` satisfies
both traceability and composability conditions.

Key theorem: `integrated_of_composable` - a composable context is integrated.

## Theorems

`StructuralExplainability/Theorems.lean`

Export-facing integration theorems. Assembles results from `Composition.lean`
and `Integration.lean` into the public theorem surface.

Exported theorems:

- `composable_of_neutral`
- `integrated_of_composable`

## Traceability

`StructuralExplainability/Traceability.lean`

Defines `Traceable`: the predicate asserting that an `SEContext` can be
traced to its formal substrate and regime sources.

## Witness

`StructuralExplainability/Witness.lean`

Concrete witness objects confirming the integration layer is inhabited:

| Symbol                  | Kind      | Role                                                  |
| ----------------------- | --------- | ----------------------------------------------------- |
| `emptyOntology`         | `def`     | Minimal neutral substrate witness                     |
| `oblProfile`            | `def`     | OBL regime profile witness                            |
| `oblContext`            | `def`     | `SEContext` pairing `emptyOntology` with `oblProfile` |
| `emptyOntology_neutral` | `theorem` | `emptyOntology` satisfies `Neutral`                   |
| `oblContext_composable` | `theorem` | `oblContext` satisfies `Composable`                   |
| `oblContext_integrated` | `theorem` | `oblContext` satisfies `Integrated`                   |

## Design Principles

### Design: Composition

This layer composes independently defined structures - admissible substrates
and identity regimes - without redefining either.

### Design: Traceability

Structural relationships must remain traceable across substrate constraints,
regime requirements, and integrated system behavior.

### Non-duplication

This repository must not duplicate substrate or regime definitions.
It only composes them.

### System-Level Invariance

New invariants arise from composition and must be explicitly defined,
provable in Lean, and independent of domain semantics.

### Lean as Authority

All correctness is expressed and verified in Lean.
No external system defines or validates theory semantics.

## Relationship to Other Theory Repositories

### se-theory-neutral-substrate

Defines admissible structural conditions. This repository imports it.

### se-theory-identity-regimes

Defines identity regime structure. This repository imports it.

## Build

```shell
elan self update
lake update
lake build
```

## Tooling

Python tooling is used for documentation generation (Zensical) and
repository hygiene (pre-commit, ruff).
Python tooling must not define correctness,
validate theory semantics, or replace Lean proofs.
