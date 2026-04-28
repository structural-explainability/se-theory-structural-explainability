import StructuralExplainability.Traceability

/-!
File: StructuralExplainability/Composition.lean

Purpose:
Composition of admissibility and regime application.
-/

namespace StructuralExplainability

/-- Composition is valid when substrate admits regime application. -/
def Composable (ctx : SEContext) : Prop :=
  IdentityRegimes.RegimeApplicationAdmissible ctx.substrate ctx.profile

end StructuralExplainability
