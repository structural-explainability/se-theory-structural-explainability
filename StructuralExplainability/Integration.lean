import StructuralExplainability.Composition

/-!
File: StructuralExplainability/Integration.lean

Purpose:
Integration layer combining traceability and composition.
-/

namespace StructuralExplainability

/-- Fully integrated structural explainability context. -/
def Integrated (ctx : SEContext) : Prop :=
  Traceable ctx ∧ Composable ctx

end StructuralExplainability
