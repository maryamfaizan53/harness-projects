#!/bin/sh
# Fake linter for Project 2. Fails (exit 1) if a marker file "BROKEN" exists,
# so we can control pass/fail on demand instead of installing a real linter.
if [ -f "BROKEN" ]; then
  echo "lint: unused variable 'x' in app.js — remove it or use it" >&2
  exit 1
else
  echo "lint: clean"
  exit 0
fi
