# openspec/

## Responsibility

This directory contains the OpenSpec configuration and workflow definitions for the project. OpenSpec is an experimental workflow system that helps manage changes, proposals, and task implementation. The directory serves as the configuration root for specifying artifact schemas, project context, and custom rules that guide AI-assisted development workflows.

## Files

### config.yaml
The main OpenSpec configuration file that defines the schema and workflow rules. This YAML file contains:
- **schema**: Set to `spec-driven`, indicating this project uses a specification-driven workflow
- **context** (commented out): Placeholder for adding project-specific context such as tech stack, conventions, and domain knowledge that AI agents use when creating artifacts
- **rules** (commented out): Placeholder for per-artifact custom rules (e.g., proposal length limits, task chunking guidelines)

### codemap.md
This file - the codemap documentation that provides an architectural overview of the openspec directory. It serves as self-documentation for the OpenSpec workflow system and includes sections for:
- Responsibility: What this directory does
- Design: Key patterns and architectural decisions
- Flow: How data/control flows through this module
- Integration: How it connects to other parts of the system

## Design

The OpenSpec system follows a `spec-driven` schema approach, meaning changes and features are first specified as specifications before implementation. This encourages thoughtful design and documentation before coding begins. The configuration is intentionally minimal, allowing teams to customize context and rules to fit their workflow needs.

## Flow

The openspec directory itself is passive - it provides configuration that other OpenSpec tools read to determine how to process proposals, changes, and tasks. When an OpenSpec workflow is triggered, the tools read `config.yaml` to understand the expected schema and apply any custom rules defined there.

## Integration

This directory integrates with the OpenSpec MCP tools (specified in available_skills) that handle:
- **openspec-propose**: Creating new change proposals
- **openspec-apply-change**: Implementing tasks from a specification
- **openspec-archive-change**: Finalizing completed changes
- **openspec-explore**: Exploring ideas and clarifying requirements

The config.yaml provides the contract between this project and the OpenSpec workflow system.