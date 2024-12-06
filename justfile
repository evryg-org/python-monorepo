default:
    just --list

install:
    uv sync --all-packages

install-tools:
    uv tool install ruff

test *forward: install
    pytest {{forward}}

test-watch *forward: install
    pytest-watcher . --now {{forward}}

lint: install-tools
    ruff check --diff packages/**/*

lint-fix: install-tools
    ruff check packages/**/*

format: install-tools
    ruff format --check --diff packages/**/*

format-fix: install-tools
    ruff format packages/**/*
