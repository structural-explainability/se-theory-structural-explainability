# SE Theory: Structural Explainability

> Lean 4 formalization of Structural Explainability integration.

This repository composes the neutral structural substrate and identity regimes
into cross-cutting theorems, traceability relationships, and system-level
structural invariants.

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

## Design Principles

### Composition

This layer composes independently defined structures:

- admissible substrates
- identity regimes

without redefining either.

### Traceability

Structural relationships must remain traceable across:

- substrate constraints
- regime requirements
- integrated system behavior

### Non-duplication

This repository must not duplicate:

- substrate definitions
- regime definitions

It only composes them.

### System-Level Invariance

New invariants arise from composition and must be:

- explicitly defined
- provable in Lean
- independent of domain semantics

### Lean as Authority

All correctness is expressed and verified in Lean.

No external system defines or validates theory semantics.

## Relationship to Other Theory Repositories

### se-theory-neutral-substrate

Defines admissible structural conditions.

This repository imports it.

### se-theory-identity-regimes

Defines identity regime structure.

This repository imports it.

## Build

```shell
elan self update
lake update
lake build
```

## Tooling

Python tooling is used for:

- documentation generation (Zensical)
- repository hygiene (pre-commit, ruff)

Python tooling must not:

- define correctness
- validate theory semantics
- replace Lean proofs
