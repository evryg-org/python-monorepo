default:
    just --list

[doc('Install all workspace dependencies in a virtual environment [uv]')]
install:
    uv sync --all-packages

[doc('Install all development tools [uv]')]
install-tools:
    uv tool install ruff

[doc('Run all tests [pytest]')]
[positional-arguments]
test *args: install
    pytest $@

[doc('Run and watch all tests [pytest]')]
[positional-arguments]
test-watch *args: install
    pytest-watcher . --now $@

[doc('Check for linting issues [ruff]')]
lint: install-tools
    ruff check --diff packages/**/*

[doc('Fix linting issues [ruff]')]
lint-fix: install-tools
    ruff check packages/**/*

[doc('Check for formatting issues [ruff]')]
format: install-tools
    ruff format --check --diff packages/**/*

[doc('Fix formatting issues [ruff]')]
format-fix: install-tools
    ruff format packages/**/*

[doc('Check for type-level errors [pyright]')]
type-check: install
    pyright