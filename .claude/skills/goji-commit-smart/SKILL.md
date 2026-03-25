---
name: goji-commit-smart
description: Create git commits using goji rules from .goji.json (type/scope/emoji/signoff) with path-based heuristics.
license: Proprietary
---

# Goji Commit Smart Skill

## Trigger phrases

- "haz un commit goji"
- "goji commit"
- "commit smart"
- "crea commits con goji"

## Source of truth

- `.goji.json`
  - `types[]` (name + emoji)
  - `scopes[]`
  - `subjectmaxlength`
  - `signoff`
- `infobot.toml`
  - `[issueTracking] provider + projectKey`
  - `[issueTracking.branch]` extraction regexes (derive key/id from branch name)
  - `[commit] style` (gitlab|jira)
  - `[commit.providers.*]` rules

## What I do

- Run `task validate` before creating any commit.
- Inspect working tree and staged changes.
- Group changes into 1..N commits using path heuristics (avoid mixing unrelated areas).
- Create commits following goji conventions: `<type> <emoji> (<scope>): <subject>`.
- Derive issue key/id from the current branch name and inject it into the subject when required.
- Create commits with `--signoff` when `signoff: true`.

## Commit style (gitlab|jira)

Decide commit style from `infobot.toml` `[commit].style`.

- `jira`
  - Require a Jira key in the subject (example: `AR-123`).
  - Prefer: `<type>(<scope>): <JIRA-KEY> <subject>`.
  - Derive `<JIRA-KEY>` from the current branch name using `infobot.toml` `[issueTracking].projectKey`.
    - Default extraction: `(<PROJECTKEY>-[0-9]+)` when `[issueTracking.branch].jiraKeyFromProjectKey = true`.
    - Override with `[issueTracking.branch].jiraKeyRegexOverride`.
- `gitlab`
  - Allow referencing GitLab issues in the subject (example: `(#123)` at the end).
  - Optional commit body line: `Closes #123`.
  - Derive `123` from the current branch name using `infobot.toml` `[issueTracking.branch].gitlabIssueNumberRegex`.

## Commit format

- Title: `<type> <emoji> (<scope>): <subject>`
  - `emoji` comes from `.goji.json` `types[].emoji` for the chosen type.
  - `type` must be one of `.goji.json` `types[].name`.
  - `scope` must be one of `.goji.json` `scopes[]`.
  - `subject` length must be `<= subjectmaxlength`.

For `gitlab` style, append the issue at the end of the subject: `(#<number>)`.

Examples:

- `docs 📚 (ci): document MCP setup (#123)`
- `ci 👷 (ci): bump gitlab ci runner image (#123)`
- `feat ✨ (core): add release task include (#123)`

## Heuristics (path -> type/scope)

Use these as defaults; ask only when ambiguous.

- `docs/**` -> `docs(ci)`
- `.gitlab-ci.yml` -> `ci(ci)`
- `.gitlab/**` -> `ci(ci)`
- `.claude/**` -> `chore(core)`
- `.opencode/**` -> `prompt(core)`
- `Taskfile.yml` -> `build(core)`
- `data/**` -> `chore(core)` (or `sample(core)` if clearly examples)
- `pkg/**` or `internal/**` or `core/**` or `config/**` -> `feat(core)` (or `fix(core)` if bug)

If only formatting changes, prefer `style(core)`. If only refactors with no behavior change, prefer `refactor(core)`.

## Process

0. Validate first

```bash
task validate
```

- If `task validate` fails, do not commit. Fix issues, re-run `task validate`, then proceed.

1. Collect context

```bash
git status --porcelain
git diff
git diff --cached
git diff --name-only
git diff --cached --name-only
git rev-parse --abbrev-ref HEAD
cat .goji.json
cat infobot.toml
```

2. Derive issue key/id from branch

- Determine `style` from `infobot.toml` `[commit].style`.
- Parse the current branch name (`git rev-parse --abbrev-ref HEAD`) and extract:
  - `jira`: `<PROJECTKEY>-<number>` (default derived from `[issueTracking].projectKey`)
  - `gitlab`: `<number>`
- If extraction fails (branch does not contain expected key/id), stop and ask the user for the key/id.

3. Decide commit groups (intelligent split)

- Prefer 1 commit if all changed files map to the same group.
- Split into multiple commits when files span multiple groups, for example:
  - docs-only vs CI-only vs code/tooling
  - `.gitlab/**` separate from `docs/**`
  - `.claude/**` separate from runtime code

Default grouping by path:

- `docs/**` -> one commit
- `.gitlab/**` -> one commit
- `.claude/**` + `provision/**` -> one commit
- `.opencode/**` + `data/**` -> one commit
- `Taskfile.yml` -> group with CI/tooling changes (not docs)
- `pkg/**|internal/**|core/**|config/**` -> one commit

4. Stage and commit each group

- If there are already staged changes, commit them first as a single coherent group.
- Otherwise, for each computed group, stage only those files:

```bash
git add <paths>
```

5. Draft commit title (use branch-derived key/id)

- Choose `type/scope` from heuristics.
- Pick `emoji` from `.goji.json` for that `type`.
- Keep `<subject>` within `.goji.json` `subjectmaxlength`.
- Subject rules by style:
  - `jira`: include `<JIRA-KEY>` (e.g. `AR-123`) early in the subject.
  - `gitlab`: include `(#<number>)` (e.g. `(#123)`) at the end.

6. Commit

- If `.goji.json` `signoff` is `true`:

```bash
git commit -s -m "<type> <emoji> (<scope>): <subject>"
```

- Else:

```bash
git commit -m "<type> <emoji> (<scope>): <subject>"
```

7. Repeat for remaining groups until all intended commits are created.

## Safety rules

- Never commit secrets (examples: `.env`, `credentials.json`, private keys, tokens).
- If any suspect files appear, stop and call them out.
- Do not use `git commit --amend` unless explicitly requested.
- Do not run destructive git commands (`reset --hard`, force-push) unless explicitly requested.
