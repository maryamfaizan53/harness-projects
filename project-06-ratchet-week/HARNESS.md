# HARNESS.md — the ratchet log

One line per caught mistake: date, class, the fix, and where it lives.

- 2026-08-20 | **Context failure** | Bash's working directory persists between tool calls; a `mkdir` right after a `cd` landed inside the wrong folder because the prior command's directory carried over. Fix: always `cd` with an absolute path in the same command that uses it, never rely on carried-over state. Lives in: rules file (a project CLAUDE.md note).
- 2026-08-20 | **Context failure** | A `.claude/settings.json` deny rule was written into a nested folder, but the already-running session never loaded it (settings load only at session start, from that session's own project root) — so `.env` was read anyway. Looked like a Constraint failure on the surface, but the actual fix ("always test new permission/hook configs from a fresh session rooted at that exact folder") is a fact to remember, not a stronger rule — so it lives in: rules file, not the permission surface.
