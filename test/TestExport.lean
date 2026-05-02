import StructuralExplainability

open StructuralExplainability

-- Public surface exposes the witness context.
#check oblContext

-- Public surface exposes witness theorems.
#check oblContext_composable
#check oblContext_integrated

-- Public surface exposes integration predicates.
#check Traceable
#check Composable
#check Integrated

-- Public surface exposes theorem layer.
#check composable_of_neutral
#check integrated_of_composable

example : Composable oblContext :=
  oblContext_composable

example : Integrated oblContext :=
  oblContext_integrated
