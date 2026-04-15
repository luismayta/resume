## Context

The project uses goji commit style defined in `infobot.toml`:
- Format: `<type> <emoji> (<scope>): <subject>`
- Style: GitHub
- Signoff: required
- Types: feat, fix, docs, chore, refactor, style, test
- Subject max length: 100 characters
- Issue reference pattern: `\(#[0-9]+\)$`

Currently there is no enforcement mechanism to ensure commits follow this format. This leads to inconsistent commit messages across the repository.

## Goals / Non-Goals

**Goals:**
- Add pre-commit hook to validate commit messages against goji format
- Ensure all new commits follow the style defined in infobot.toml
- Document the commit style for contributors

**Non-Goals:**
- Not rewriting existing commit history (except for critical fixes)
- Not enforcing on CI only - should block at commit time
- Not changing the infobot.toml configuration (already correct)

## Decisions

### D1: Use commitlint with custom configuration

**Decision:** Use commitlint as the validation tool, configured to match infobot.toml rules.

**Rationale:** commitlint is the standard tool for commit message validation, has wide adoption, and can be integrated with pre-commit. It's more maintainable than custom scripts.

**Alternative considered:** Custom shell script using regex → More error-prone, harder to maintain

### D2: Add to pre-commit config (local hook)

**Decision:** Add commitlint as a local pre-commit hook in `.pre-commit-config.yaml`.

**Rationale:** Local hooks don't require external dependencies and are part of the repo. Easier to configure and maintain.

**Alternative considered:** System-wide git hook → Not portable, harder to share

### D3: Configure commitlint for GitHub style

**Decision:** Configure commitlint to match the goji GitHub style from infobot.toml.

**Rationale:** The configuration should mirror infobot.toml to ensure consistency. commitlint has a "github" preset that can be extended.

**Alternative considered:** Define rules from scratch → More work, risk of inconsistencies

## Risks / Trade-offs

- **[Risk]** Developers may find the validation annoying → **Mitigation**: Clear error messages showing what's wrong and how to fix it
- **[Risk]** Existing commits don't follow the style → **Mitigation**: Focus on forward-looking enforcement, don't rewrite history
- **[Risk]** False positives on valid commits → **Mitigation**: Test configuration thoroughly with sample commits

## Migration Plan

1. Add commitlint configuration file (commitlint.config.js)
2. Update .pre-commit-config.yaml with commitlint hook
3. Run pre-commit autoupdate to get the latest versions
4. Test with a sample commit to verify it works
5. Document the commit style in CONTRIBUTING.md

## Open Questions

- Should we also add a commit-msg hook (for local git hooks) in addition to pre-commit?
- Should we fix existing commits that don't follow the style?