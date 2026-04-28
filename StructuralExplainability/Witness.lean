import StructuralExplainability.Theorems

/-!
File: StructuralExplainability/Witness.lean

Purpose:
Canonical witness for integration layer.
-/

namespace StructuralExplainability

/-- Canonical context: unit substrate + OBL profile. -/
def unitContext : SEContext :=
  {
    substrate := NeutralSubstrate.unitSubstrate,
    profile := { regime := IdentityRegimes.Regime.OBL }
  }

/-- The canonical context is integrated. -/
theorem unitContext_integrated : Integrated unitContext := by
  apply integrated_of_composable
  apply composable_of_neutral

end StructuralExplainability
