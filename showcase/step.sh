#!/usr/bin/env bash
# Applies one step of the walkthrough in README.md: switches to the branch of the step,
# copies showcase/steps/<step>/ over the repository and commits. Pushing is left to you.
set -euo pipefail

fail() {
  echo "$1" >&2
  exit 1
}

root=$(cd "$(dirname "$0")/.." && pwd -P)
cd "$root"

step=${1:-}
move=''
case "$step" in
  1)
    branch=add-waiting-list
    message='propose a waiting list for taken rooms'
    ;;
  2)
    branch=add-waiting-list
    message='use the published name of the cancel requirement'
    ;;
  3)
    branch=archive-recurring-bookings
    message='archive recurring bookings'
    move='openspec/changes/add-recurring-bookings openspec/changes/archive/2026-10-03-add-recurring-bookings'
    ;;
  4)
    branch=show-room-equipment
    message='propose showing room equipment'
    ;;
  *) fail 'Usage: showcase/step.sh <1|2|3|4>' ;;
esac

[ "$(git rev-parse --show-toplevel 2>/dev/null)" = "$root" ] ||
  fail 'This folder is not a git repository yet. Commit it on main first, see README.md.'
[ -z "$(git status --porcelain)" ] || fail 'The working tree has changes. Commit or remove them first.'

exists() {
  git show-ref --verify --quiet "refs/heads/$1"
}
if [ "$step" = 2 ]; then
  # Step 2 is a second commit on the branch of step 1.
  exists "$branch" || fail 'Run step 1 first.'
  git switch "$branch"
else
  exists main || fail 'There is no branch "main".'
  ! exists "$branch" || fail "The branch $branch exists already. Delete it to run this step again."
  git switch -c "$branch" main
fi

# shellcheck disable=SC2086 # two paths, split on purpose
[ -z "$move" ] || git mv $move
cp -R "showcase/steps/$step/." .
git add -A openspec
! git diff --cached --quiet || fail 'Nothing changed: this step is on the branch already.'
git commit -m "$message"

echo
echo "Next: git push -u origin $branch"
