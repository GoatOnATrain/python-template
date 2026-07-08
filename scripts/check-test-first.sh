#!/usr/bin/env bash
# Warn-only nudge toward the test-first convention (see CLAUDE.md): flag when
# production code under src/ is staged with no accompanying change under tests/.
#
# This is a heuristic, not a proof — it cannot show a test was written *first*
# (red before green), and it deliberately does not block: pure refactors and
# non-behavioural edits legitimately touch src/ without tests. It only reminds.
set -euo pipefail

staged=$(git diff --cached --name-only --diff-filter=ACM)

src_changed=$(printf '%s\n' "$staged" | grep -E '^src/.*\.py$' | grep -vE '__init__\.py$' || true)
tests_changed=$(printf '%s\n' "$staged" | grep -E '^tests/.*\.py$' || true)

if [ -n "$src_changed" ] && [ -z "$tests_changed" ]; then
  echo "⚠  test-first reminder: src/ code staged with no tests/ change."
  echo "   Convention (CLAUDE.md): write the failing test first, then implement."
  echo "   If this is a pure refactor / non-behavioural change, carry on."
  printf '%s\n' "$src_changed" | sed 's/^/     - /'
fi

exit 0
