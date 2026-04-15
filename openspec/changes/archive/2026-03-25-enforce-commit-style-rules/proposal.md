## Why

The repository has commits that don't follow the style defined in `infobot.toml`. The current commit style requires format `<type> <emoji> (<scope>): <subject>` with GitHub style, signoff enabled, and specific type prefixes (feat, fix, docs, chore, refactor, style, test). Without enforcement, contributors may make commits that don't match this standard, leading to inconsistent git history and potential issues with automated tools that expect conventional commits.

## What Changes

- Add pre-commit hook configuration to validate commit messages before allowing commits
- Create a commit validation script that checks against infobot.toml rules
- Add documentation for contributors explaining the commit style
- Apply fixes to existing commits that don't follow the style (where possible)

## Capabilities

### New Capabilities

- `commit-style-validation`: Pre-commit hook to validate commit messages against goji format defined in infobot.toml

### Modified Capabilities

- None (new capability only)

## Impact

- `.pre-commit-config.yaml` - Will be updated with new hook
- `infobot.toml` - Already contains commit style configuration
- Contributors need to follow new commit format