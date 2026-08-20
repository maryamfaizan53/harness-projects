#!/bin/sh
# Project 5: typed reviewer validator.
# Reads a reviewer's JSON verdict on stdin, validates every field against its
# allowed VALUES (not just presence), and escalates to a human on any break.
review=$(cat)

echo "$review" | jq -e '
  (.verdict == "PASS" or .verdict == "FAIL") and
  (.risk == "low" or .risk == "high") and
  (.reasons | type == "array") and all(.reasons[]; type == "string")
' >/dev/null 2>&1

if [ $? -ne 0 ]; then
  echo "reviewer broke protocol — escalating to a human" >&2
  echo "- reviewer output unparseable: needs a human" >> progress.md
  exit 1
fi

verdict=$(echo "$review" | jq -r '.verdict')
echo "accepted: verdict=$verdict"
