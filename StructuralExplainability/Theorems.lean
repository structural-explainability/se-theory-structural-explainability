import NeutralSubstrate
import StructuralExplainability.Integration

open SE.NeutralSubstrate

/-!
File: StructuralExplainability/Theorems.lean

Purpose:
Export-facing integration theorems.
-/

namespace StructuralExplainability

/-- Neutral substrates yield composable contexts. -/
theorem composable_of_neutral
    (S : Ontology)
    (h : Neutral S)
    (p : IdentityRegimes.RegimeProfile) :
    Composable { substrate := S, profile := p } := by
  exact IdentityRegimes.regime_application_admissible_of_neutral S h p

/-- Composable contexts are integrable given traceability. -/
theorem integrated_of_composable
    (ctx : SEContext)
    (h : Composable ctx) :
    Integrated ctx := by
  exact And.intro trivial h

end StructuralExplainability
