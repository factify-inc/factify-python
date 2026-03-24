#!/usr/bin/env bash

uv run python scripts/prepare_readme.py

uv build
uv publish --trusted-publishing always
