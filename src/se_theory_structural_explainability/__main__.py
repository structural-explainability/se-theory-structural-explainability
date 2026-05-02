"""Module entry point for se-theory-structural-explainability.

Enables `uv run python -m se_theory_structural_explainability`.
Delegates immediately to the CLI entry point.
All logic lives in cli.py, validate.py, sync.py, and load.py.
"""

from se_theory_structural_explainability.cli import main

if __name__ == "__main__":
    raise SystemExit(main())
