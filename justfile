default:
    just --list

install:
    uv sync --all-packages

test *forward: install
    pytest {{forward}}
