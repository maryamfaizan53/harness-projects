#!/bin/sh
# GOOD: coupled to the contract (values), not to any model's phrasing habit.
# Same validator as Project 5 — nothing model-specific in it at all.
review=$(cat)

echo "$review" | jq -e '
  (.verdict == "PASS" or .verdict == "FAIL") and
  (.risk == "low" or .risk == "high") and
  (.reasons | type == "array") and all(.reasons[]; type == "string")
' >/dev/null 2>&1

if [ $? -ne 0 ]; then
  echo "rejected: protocol broken" >&2
  exit 1
fi
echo "accepted: verdict=$(echo "$review" | jq -r '.verdict')"
