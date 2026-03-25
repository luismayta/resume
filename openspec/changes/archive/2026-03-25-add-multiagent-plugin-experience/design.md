## Context

The resume project currently supports multiple profiles (AI Architect, Cloud Architect, Golang Developer) and languages (English, Spanish). The system uses YAML data files that get converted to LaTeX for PDF generation. This change adds a new experience entry for the multi-agent orchestration plugin implementation.

## Goals / Non-Goals

**Goals:**
- Add multi-agent orchestration experience to the resume
- Include all 6 agents with their roles and responsibilities
- Support multi-provider architecture (OpenAI, Anthropic, Google Gemini, Ollama)
- Ensure the experience appears in appropriate profiles (AI Architect, Cloud Architect)

**Non-Goals:**
- Modify existing profiles beyond adding this experience
- Add new translations beyond existing EN/ES support
- Change the resume LaTeX template structure

## Decisions

1. **Data Model**: Use existing experience YAML schema from `data/experience/` to maintain consistency
2. **Agent Documentation**: Include all 6 agents (Zeus, Hermes, Apollo, Athena, Aphrodite, Hephaestus) with their roles
3. **Provider Support**: Document support for OpenAI, Anthropic, Google Gemini, and Ollama
4. **Profile Inclusion**: Add to AI Architect and Cloud Architect profiles only

## Risks / Trade-offs

- None identified - this is a straightforward data addition to existing schema

## Migration Plan

1. Create `data/experience/multiagent-orchestration.yml` with experience data
2. Update relevant profile files to include this experience
3. Regenerate resumes to verify appearance
4. Update translations if needed