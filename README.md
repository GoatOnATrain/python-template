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

## Common commands

```sh
poetry run ruff check .          # lint
poetry run ruff format --check . # format check
poetry run mypy                  # type check
poetry run pytest -v             # tests
```

CI runs all four on every push and pull request to `main`.
