# Project instructions

Instructions for coding agents working in this repo. Rename the package and
tailor the Conventions/Signs sections to the project — but keep the Testing
convention.

## Build / Test / Lint

Poetry, `src/` layout, Python 3.12. Feedback loops:

- **Install:** `poetry install`
- **Test:** `poetry run pytest -v`
- **Lint:** `poetry run ruff check .`
- **Format check:** `poetry run ruff format --check .`
- **Type check:** `poetry run mypy`

All four run in CI on push/PR and must pass before work is considered done.

## Conventions

- **Write tests test-first (red → green → refactor).** Whenever work involves
  adding tests: first write the failing test that encodes the behaviour, run
  `poetry run pytest` and confirm it fails for the expected reason (the
  behaviour is missing, not an unrelated error); then write the minimum
  implementation to make it pass; then refactor with the suite green. Prefer
  driving behaviour through pure functions, where test-first pays off most.
  Only skip test-first for work that is genuinely untestable in isolation, and
  say so in the commit message.
- Follow the existing patterns (`tests/test_main.py`, `src`-layout imports).

## Signs

Guardrails learned through observation. Add here as mistakes are seen.
