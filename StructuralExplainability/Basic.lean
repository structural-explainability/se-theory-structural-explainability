import NeutralSubstrate
import IdentityRegimes

open SE.NeutralSubstrate

/-!
File: StructuralExplainability/Basic.lean

Purpose:
Basic vocabulary for structural explainability integration.
-/

namespace StructuralExplainability

/-- A composed system: a substrate with a regime profile. -/
structure SEContext where
  substrate : Ontology
  profile   : IdentityRegimes.RegimeProfile

end StructuralExplainability
