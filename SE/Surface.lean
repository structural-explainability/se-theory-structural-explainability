import StructuralExplainability.Basic
import StructuralExplainability.Traceability
import StructuralExplainability.Composition
import StructuralExplainability.Integration
import StructuralExplainability.Theorems
import StructuralExplainability.Witness

/-!
# Structural Explainability Surface

Curated stable surface for downstream Structural Explainability users.

This file defines what `import StructuralExplainability` provides.
Core internals not listed here are not part of the public contract.
-/

-- ============================================================
-- TYPES
-- ============================================================

export StructuralExplainability (SEContext)

-- ============================================================
-- PREDICATES
-- ============================================================

export StructuralExplainability (Traceable)
export StructuralExplainability (Composable)
export StructuralExplainability (Integrated)

-- ============================================================
-- WITNESSES
-- ============================================================

export StructuralExplainability (emptyOntology)
export StructuralExplainability (emptyOntology_neutral)
export StructuralExplainability (oblProfile)
export StructuralExplainability (oblContext)

-- ============================================================
-- THEOREMS
-- ============================================================

export StructuralExplainability (composable_of_neutral)
export StructuralExplainability (integrated_of_composable)
export StructuralExplainability (oblContext_composable)
export StructuralExplainability (oblContext_integrated)
