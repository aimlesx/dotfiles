# Python Pro Mode Rules

## 1. Core Philosophy

Your primary goal is to produce Python code that is **correct, maintainable, readable, and performant**. You must adhere to modern Python development standards and tooling.

## 2. Project Structure

When creating a new project, use a standard, scalable structure.

```
project_name/
├── src/
│   └── project_name/
│       ├── __init__.py
│       ├── main.py
│       └── ... (other modules)
├── tests/
│   ├── __init__.py
│   └── test_...py
├── .gitignore
├── pyproject.toml
└── README.md
```

- **`src/` layout**: All application source code resides within the `src/project_name` directory. This prevents common import issues.
- **`tests/`**: All tests are located in a separate `tests` directory.
- **`pyproject.toml`**: This is the single source of truth for project metadata and dependencies.
- **`.gitignore`**: Always include a comprehensive Python `.gitignore` file.

## 3. Dependency Management with `uv`

- **Tooling**: You must use `uv` for all package management tasks (installing, updating, locking dependencies). It's a single binary that replaces `pip` and `venv`.
- **Configuration**: All project dependencies (main and development) must be declared in `pyproject.toml`. Do not use `requirements.txt` files unless explicitly required for compatibility with a specific tool.
- **Virtual Environments**: Always assume the code runs within a virtual environment managed by `uv`. For example:
  - `uv venv` to create the environment.
  - `uv pip install -e .[dev]` to install the project in editable mode with dev dependencies.

**Example `pyproject.toml`:**

```toml
[project]
name = "my-awesome-project"
version = "0.1.0"
description = "A short description of the project."
requires-python = ">=3.10"
dependencies = [
    "fastapi>=0.110.0",
    "pydantic>=2.6.0",
]

[project.optional-dependencies]
dev = [
    "pytest",
    "mypy",
    "ruff",
]
```

## 4. Linting and Formatting with `ruff`

- **Mandatory**: All Python code you generate or modify **must** be formatted with `ruff format` and pass `ruff check` without errors.
- **Configuration**: Configure `ruff` within `pyproject.toml`. Start with a sensible default set of rules.
- **Example `ruff` config in `pyproject.toml`:**

```toml
[tool.ruff]
line-length = 88
target-version = "py311"

[tool.ruff.lint]
select = [
    "E",  # pycodestyle errors
    "W",  # pycodestyle warnings
    "F",  # pyflakes
    "I",  # isort
    "C",  # flake8-comprehensions
    "B",  # flake8-bugbear
]
ignore = []

[tool.ruff.format]
quote-style = "double"
```

## 5. Static Type Checking with `mypy`

- **Type Hints are Required**: All function signatures (arguments and return values) and variable declarations **must** include type hints (`PEP 484`).
- **Strict Mode**: Strive for `mypy --strict` compliance. All code you write should pass strict type checking.
- **Configuration**: Configure `mypy` in `pyproject.toml`.
- **Example `mypy` config in `pyproject.toml`:**

```toml
[tool.mypy]
python_version = "3.11"
warn_return_any = true
warn_unused_configs = true
disallow_untyped_defs = true
check_untyped_defs = true
```

## 6. Testing with `pytest`

- **Framework**: Use `pytest` as the default testing framework.
- **Test Coverage**: Write comprehensive tests for all business logic. Aim for high test coverage.
- **Test Structure**: Tests should be clear, concise, and follow the Arrange-Act-Assert pattern.
- **Fixtures**: Use `pytest` fixtures for setting up and tearing down test state.

## 7. Documentation and Comments

- **Docstrings**: All modules, classes, functions, and methods must have docstrings. Use the **Google Python Style Guide** for formatting docstrings.
- **Comments**: Use inline comments (`#`) to explain complex or non-obvious logic. Avoid redundant comments that restate the code.
- **README**: A project's `README.md` should be comprehensive, explaining what the project is, how to install it, and how to run it.

## 8. General Code Quality

- **Idiomatic Python**: Write code that is "Pythonic". Use list comprehensions, generators, and context managers where appropriate.
- **Error Handling**: Use specific exception types. Avoid catching generic `Exception`.
- **Security**: Be mindful of common security vulnerabilities (e.g., injection attacks, insecure deserialization).
- **Modern Syntax**: Use modern Python features where they improve clarity and performance (e.g., walrus operator `:=`, f-strings, `pathlib` for paths).
