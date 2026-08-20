#!/bin/sh
# BAD: coupled to model A's wordiness habit, not to the actual contract.
review=$(cat)
reason=$(echo "$review" | jq -r '.reasons[0]')
words=$(echo "$reason" | wc -w)

if [ "$words" -gt 10 ]; then
  echo "REJECTED: reason is $words words, over the 10-word threshold" >&2
  exit 1
fi
echo "accepted (word count: $words)"
