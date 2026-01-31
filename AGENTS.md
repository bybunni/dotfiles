# AGENTS.md

## Environment — uv

All Python dependencies and tools are managed with `uv`.

- Run any tool with `uv run <tool>`. Never call black/ruff/isort directly.
- Install dependencies with `uv sync`.
- Add a dependency with `uv add <pkg>`.
- Add a dev dependency with `uv add --dev <pkg>`.

## Code style

Before committing, run these in order:

```
uv run isort .
uv run black .
uv run ruff check --fix .
```

- Line length: 88.
- isort profile: black.
- Fix all ruff violations before committing. If `--fix` cannot resolve one, fix it manually.
- Do not commit code that fails `uv run ruff check .` or `uv run black --check .`.

## Task tracking — todowrite / todoread

Follow these rules exactly:

- **Before starting any multi-step task**: call `todowrite` to create a task list.
- **Before each step**: mark it `in_progress` via `todowrite`.
- **After each step**: mark it `completed` via `todowrite`.
- **Only one task may be `in_progress` at a time.**
- **When resuming work**: call `todoread` first to check existing state.
- **In plan mode**: use `todowrite` to outline all steps before switching to code mode.
- Never skip task tracking. Update status after every meaningful action.
