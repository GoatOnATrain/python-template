# python-template

Template repo for Python projects. Standardises on the tooling shared across
`frontend-audio-cache-docker`, `uk-audio-services-envoy-ext-proc-redirector`,
and `TVandAnimeAutoRipper`:

- **Poetry** for dependency management (`pyproject.toml` + `poetry.lock`)
- **Ruff** for linting and formatting
- **pytest** for tests
- **mypy** for type checking

## Getting started

1. Rename `src/example_package` to your package name and update the
   `[tool.poetry] packages` entry and `known-first-party` in `pyproject.toml`.
2. Update `[project] name`, `description`, and `authors`.
3. Install dependencies:

   ```sh
   poetry install
   ```

4. Install the git hooks (optional but recommended):

   ```sh
   poetry run pre-commit install
   ```

   Fast checks (ruff, format, mypy, file hygiene) then run on every commit and
   pytest on every push, via the same `poetry run` versions as CI. A warn-only
   test-first reminder nudges when `src/` changes without a matching test. CI
   remains the real gate — never bypass hooks with `--no-verify`.

## Common commands

```sh
poetry run ruff check .          # lint
poetry run ruff format --check . # format check
poetry run mypy                  # type check
poetry run pytest -v             # tests
```

CI runs all four on every push and pull request to `main`.

## Conventions

Write tests **test-first** — red → green → refactor. Add the failing test that
encodes the behaviour, confirm it fails for the right reason, implement the
minimum to make it pass, then refactor with the suite green. See `CLAUDE.md`
for the full convention (it also instructs coding agents working in the repo).
