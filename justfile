default:
    just --list

install:
    uv sync --all-packages

install-tools:
    uv tool install ruff

[positional-arguments]
test *args: install
    pytest $@

[positional-arguments]
test-watch *args: install
    pytest-watcher . --now $@

lint: install-tools
    ruff check --diff packages/**/*

lint-fix: install-tools
    ruff check packages/**/*

format: install-tools
    ruff format --check --diff packages/**/*

format-fix: install-tools
    ruff format packages/**/*
