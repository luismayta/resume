## ADDED Requirements

### Requirement: Translation data structure
The system SHALL store UI translations in `data/translations/` with YAML files per language containing keys for section titles, labels, and common terms.

#### Scenario: Load Spanish translations
- **WHEN** language "es" is requested
- **THEN** system loads `data/translations/es.yml` with all translation keys

### Requirement: Profile content translation
The system SHALL support bilingual profile content including tagline, role names, and experience descriptions.

#### Scenario: Generate Spanish profile
- **WHEN** profile "golang-developer" and language "es" are requested
- **THEN** generated .tex contains Spanish tagline, role names, and achievement text

### Requirement: Fallback to English
The system SHALL fall back to English when a translation key is missing in the requested language.

#### Scenario: Missing translation key
- **WHEN** translation key "section.skills" is missing in es.yml
- **THEN** system uses "Skills" from en.yml as fallback