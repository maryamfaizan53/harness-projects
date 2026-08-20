#!/bin/sh
# The connector BEFORE the audit: real-world, human-written error text.
case "$1" in
  noauth)    echo "Error 403" >&2; exit 1 ;;
  badquery)  echo "Invalid request" >&2; exit 1 ;;
  ratelimit) echo "Error: too many requests" >&2; exit 1 ;;
  *)         echo "customer: John Doe, id=42" ;;
esac
