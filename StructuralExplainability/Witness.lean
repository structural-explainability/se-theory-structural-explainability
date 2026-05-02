import NeutralSubstrate
import StructuralExplainability.Theorems

open SE.NeutralSubstrate

/-!
File: StructuralExplainability/Witness.lean

Purpose:
Concrete witness objects for the structural-explainability integration layer.
-/

namespace StructuralExplainability

/-- Empty ontology witness. -/
def emptyOntology : Ontology :=
  []

/-- Empty ontology is neutral. -/
theorem emptyOntology_neutral : Neutral emptyOntology := by
  apply neutral_if_only_neutral
  rfl

/-- Canonical OBL profile witness. -/
def oblProfile : IdentityRegimes.RegimeProfile :=
  { kind := .OBL }

/-- Concrete structural-explainability context witness. -/
def oblContext : SEContext :=
  { substrate := emptyOntology, profile := oblProfile }

/-- The OBL witness context is composable. -/
theorem oblContext_composable : Composable oblContext := by
  exact composable_of_neutral emptyOntology emptyOntology_neutral oblProfile

/-- The OBL witness context is integrated. -/
theorem oblContext_integrated : Integrated oblContext := by
  exact integrated_of_composable oblContext oblContext_composable

end StructuralExplainability
