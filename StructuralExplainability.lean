import StructuralExplainability.Basic
import StructuralExplainability.Traceability
import StructuralExplainability.Composition
import StructuralExplainability.Integration
import StructuralExplainability.Theorems
import StructuralExplainability.Witness
import StructuralExplainability.Surface

/-!
# Structural Explainability (SE)

Lean 4 formalization of the Structural Explainability integration layer.

This library composes the public Neutral Substrate and Identity Regimes
surfaces into structural-explainability contexts, traceability predicates,
composition predicates, integration predicates, and witness theorems.

## 1.  Scope (Informative)

Applies to formal integration claims over neutral substrates and identity
regime profiles.

This library does not encode neutral substrate primitives, identity-regime
classification matrices, domain mappings, operational validation, runtime
systems, or path-grammar expressive adequacy.

## 2.  Public Surface (Normative)

The following names constitute the normative public surface of this library.
They are stable across patch versions.
Breaking changes require a minor version increment.
Names in internal `StructuralExplainability.*` modules not listed here are
internal and may change without notice.

### 2.1.  Types

- `SEContext`  a structural-explainability context pairing a neutral substrate
               with an identity-regime profile

### 2.2.  Predicates

- `Traceable`   context has traceability support
- `Composable`  context satisfies the composition condition
- `Integrated`  context satisfies traceability and composition

### 2.3.  Witnesses

- `emptyOntology`          empty neutral ontology witness
- `emptyOntology_neutral`  proof that the empty ontology is neutral
- `oblProfile`            canonical OBL regime-profile witness
- `oblContext`            structural-explainability context witness

### 2.4.  Theorems

- `composable_of_neutral`    neutral substrates yield composable contexts
- `integrated_of_composable` composable contexts are integrated when traceability holds
- `oblContext_composable`    OBL witness context is composable
- `oblContext_integrated`    OBL witness context is integrated

## 3.  Usage (Informative)

```lean
import StructuralExplainability
open StructuralExplainability
```

When using Neutral Substrate or Identity Regimes names directly, downstream
users should also open the corresponding public namespaces:

```lean
open SE.NeutralSubstrate
open IdentityRegimes
```

## 4.  Metadata (Informative)

Version, authorship, and release date: see `CITATION.cff`.
Scope, layer, and governance: see `SE_MANIFEST.toml`.

## 5.  File Notes (Informative)

- This file must remain thin: imports only, no logic.
- Downstream libraries depend on this file as their sole SE import.
- Internal structure is not part of the public contract.
-/
