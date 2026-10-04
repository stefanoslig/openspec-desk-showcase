# OpenSpec Desk showcase

The specs of Huddle, a fictional service for booking meeting rooms, published as a website by [OpenSpec Desk](https://github.com/stefanoslig/openspec-dashboard) from GitHub Actions.

The repository exists to show what the dashboard does in CI. It publishes the specs of `main`, the changes that open pull requests still have in review, and the review threads on them. Huddle has no code, and everything about it is made up.

## Contents

| Path                                  | Contents                                                                                  |
| ------------------------------------- | ----------------------------------------------------------------------------------------- |
| `openspec/`                           | What the site shows: two published specs, one change in progress and one archived change. |
| `.github/workflows/publish-specs.yml` | Runs `openspec-desk export --pull-requests` and deploys the result to GitHub Pages.       |
| `showcase/`                           | The pull requests of the walkthrough: `step.sh` and the files that each step adds.        |

To read the specs without GitHub, run `npx openspec-desk` in this folder. The local server shows no pull requests.

## Walkthrough

The steps build on each other, and each heading names the workflow trigger that the step shows. After a step, wait until the run of **Publish specs** under **Actions** has finished, then reload the site.

`showcase/step.sh <n>` prepares the branch of a step: it creates the branch from `main`, copies the files of `showcase/steps/<n>/` over the repository and commits them. It needs a clean working tree, and it never pushes.

### 1. Publish the specs: `push`, `workflow_dispatch`

Create an empty repository on GitHub. Make it public: on the free plan, GitHub Pages is only available for public repositories. Then, in this folder:

```sh
git init -b main
git add .
git commit -m "initial commit"
git remote add origin git@github.com:<owner>/openspec-desk-showcase.git
git push -u origin main
```

Set **Settings → Pages → Source** to **GitHub Actions**. The push has started a first run, which fails at its deploy step when Pages was not enabled yet. Start a new one with **Actions → Publish specs → Run workflow**.

The site is at `https://<owner>.github.io/openspec-desk-showcase/`. It shows:

- The repository, the branch and the commit that it was built from, and "View on GitHub" on every document.
- "Add recurring bookings" as a change in progress, with 5 of 8 tasks done. Its behaviour changes compare the delta spec with the published Bookings spec: two requirements are added and one is modified, word by word.
- "Release unattended rooms" in the archive.
- An "In review" section, which says that no open pull request changes the specs.

### 2. A change in review: `pull_request_target` (opened)

```sh
showcase/step.sh 1
git push -u origin add-waiting-list
```

Open a pull request to `main` with the title "Add a waiting list for taken rooms". After the run, "In review" lists the change "Add waiting list" with "PR #1" and your login. Its behaviour changes cover three capabilities:

- **bookings:** "Members book a room" is renamed and modified, and "Taken rooms show the office contact" is removed. "Members cancel bookings" has the note "Not found in the published spec.": the delta uses a wrong name on purpose, and step 4 corrects it.
- **check-in:** one requirement is modified.
- **waiting-list:** a new capability with three added requirements.

The documents of the pull request open in the reader and are found by the search, labelled "PR #1".

### 3. Review threads: `schedule`, `workflow_dispatch`

On the pull request, open **Files changed** and add the comments below with **Add single comment**. The export cannot see the comments of a review that is still pending.

| File                         | Line                                                            | Comment                                                                                                                                              | Then                                                             |
| ---------------------------- | --------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------- |
| `specs/waiting-list/spec.md` | `### Requirement: An offer expires after 15 minutes`            | just wondering: what happens when a slot is freed at night? nobody accepts within 15 minutes, so every offer expires and the slot is free by morning | Leave it open.                                                   |
| `proposal.md`                | `- The office contact is no longer shown on a refused booking.` | does the office team know they'll stop getting these requests?                                                                                       | Reply "yes, there's a task for it" and resolve the conversation. |
| `specs/bookings/spec.md`     | `### Requirement: Members cancel bookings`                      | the published spec calls this `Members cancel their own bookings`, maybe we should use that name here?                                               | Leave it open.                                                   |

Review comments do not start the workflow. The schedule picks them up within 30 minutes. To see them at once, use **Run workflow** again.

The card of the change now states "2 open threads". On the page of the change, the first and the third thread are shown with their requirement. The thread on the proposal is under "Discussion", collapsed because it is resolved. Every thread links to GitHub for replies.

### 4. A new commit on the pull request: `pull_request_target` (synchronize)

```sh
showcase/step.sh 2
git push
```

The commit corrects the name of the requirement. After the run, "Members cancel their own bookings" is compared with the published text and the note has disappeared. The line of the third thread no longer exists, so the thread has moved to "Discussion" and is marked "Outdated".

### 5. A pull request that archives its change: `pull_request_target` (opened)

```sh
showcase/step.sh 3
git push -u origin archive-recurring-bookings
```

Open a pull request with the title "Archive recurring bookings". Its commit is what `openspec archive` produces: the change moves to `changes/archive/`, and the published Bookings spec receives its requirements.

After the run, "Add recurring bookings" is also listed under "In review", complete and with "PR #2". It is not in the archive before the pull request merges. Its behaviour changes are still compared with the spec of `main`, although the pull request updates that spec itself.

### 6. A draft: `pull_request_target` (opened, ready_for_review)

```sh
showcase/step.sh 4
git push -u origin show-room-equipment
```

Open a **draft** pull request with the title "Show room equipment". The change has a proposal only. Its card has the badge "Draft pull request", and its page says that the change has no spec changes yet. **Ready for review** on the pull request starts a run that removes the badge.

### 7. A merge: `pull_request_target` (closed), `push`

Merge PR #2. The closed pull request and the push to `main` each start a run, and the later run cancels the earlier one. Afterwards "Add recurring bookings" is in the archive only, the published Bookings spec has seven requirements, and the changes of PR #1 are compared with that new spec.

### More to try

- A pull request from a fork is not read, and the site warns that one was skipped. This needs a second account.
- A pull request that changes nothing under `openspec/changes/` is not listed.
- Without `--pull-requests` in the workflow, the site shows `main` only and has no "In review" section.

## Start over

Close the pull requests and delete their branches, on GitHub and locally:

```sh
git switch main
git branch -D add-waiting-list archive-recurring-bookings show-room-equipment
```

`step.sh` refuses to create a branch that exists. Step 3 needs a `main` that still has "Add recurring bookings" in progress, so it works only before the merge of step 7.
