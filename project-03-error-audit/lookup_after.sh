#!/bin/sh
# The connector AFTER the AX audit: each error says what to do next.
case "$1" in
  noauth)    echo "403 Forbidden: this API key is missing the 'customers:read' scope. Request that scope and retry." >&2; exit 1 ;;
  badquery)  echo "Invalid request: query was not in the expected format. Use an email or a numeric customer id, and retry." >&2; exit 1 ;;
  ratelimit) echo "Rate limited: wait 30 seconds before retrying (max 5 retries)." >&2; exit 1 ;;
  *)         echo "customer: John Doe, id=42" ;;
esac
