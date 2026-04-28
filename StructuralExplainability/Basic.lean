import NeutralSubstrate
import IdentityRegimes

/-!
File: StructuralExplainability/Basic.lean

Purpose:
Basic vocabulary for structural explainability integration.
-/

namespace StructuralExplainability

/-- A composed system: a substrate with a regime profile. -/
structure SEContext where
  substrate : NeutralSubstrate.Substrate
  profile   : IdentityRegimes.RegimeProfile

end StructuralExplainability
