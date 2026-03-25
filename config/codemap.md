# config/

## Responsibility
This directory contains LaTeX configuration files that define the visual styling, layout, and typography for the resume. These files control colors, margins, fonts, and custom commands used throughout the resume document.

## Design Patterns
The configuration follows a modular include pattern where `main.tex` acts as a central aggregator that loads all other configuration files in a specific order. This allows for separation of concerns:

- **Base packages**: config.tex handles LaTeX package loading
- **Colors**: color.tex defines all color definitions and semantic color assignments
- **Layout**: margin.tex defines page geometry
- **Commands**: commands.tex is reserved for custom macro definitions
- **Aggregation**: main.tex ties everything together with \input directives

### Semantic Color Pattern
Colors are defined at two levels:
1. **Raw colors**: HTML-based color definitions (e.g., DeepBlue, SlateGrey)
2. **Semantic colors**: Abstract assignments (heading, body, accent, company, job) that map raw colors to semantic meanings

This allows easy theme changes by modifying only the semantic color assignments.

## Integration
These configuration files are loaded by the main resume document via:
```latex
\input{./config/main.tex}
```

The main.tex file must be included in the root resume.tex file before any content is written. This ensures all styling is applied before the document content is processed.

## Files

### config.tex
**Purpose**: Base LaTeX package imports and encoding setup

**Contents**:
- UTF-8 input encoding
- T1 font encoding
- geometry package for page layout
- xcolor package for color support
- fontawesome package for icons (sourced from ./styles/fontawesome)
- lato font as default typeface
- paracol package for column-based layouts

**Usage**: Loaded first by main.tex to establish the foundational LaTeX environment

---

### color.tex
**Purpose**: Color palette definitions and semantic color assignments

**Contents**:
- Grey scale colors: SlateGrey (#4B4B4B), LightGrey (#A9A9A9), CharcoalGrey (#36454F), DarkGrey (#505050)
- Blue scale colors: DeepBlue (#003366), Charcoal (#333333), LightBlue (#A9C7E8), VividBlue (#1E3A8A), SlateBlue (#6A5ACD), SkyBlue (#87CEEB), SteelBlue (#4682B4), RoyalBlue (#4169E1), LightSteelBlue (#B0C4DE)
- Semantic color assignments:
  - heading → DeepBlue
  - body → DarkGrey
  - accent → VividBlue
  - emphasis → Charcoal
  - dates → CharcoalGrey
  - company → RoyalBlue
  - job → SlateBlue
  - achievements → LightSteelBlue
- Color1-6 palette for section-specific color coding

**Usage**: Referenced throughout resume templates to apply consistent colors to headings, text, dates, company names, job titles, and achievements

---

### margin.tex
**Purpose**: Page geometry and margin configuration

**Contents**:
```latex
\geometry{
    left=1cm,
    right=9cm,
    marginparwidth=6.8cm,
    marginparsep=1.2cm,
    top=1cm,
    bottom=1cm
}
```

**Design**: Uses asymmetric margins (1cm left, 9cm right) with a wide marginpar area (6.8cm) for sidebar content, creating a two-column layout where the main content occupies the left portion and the right margin holds supplementary information

**Usage**: Defines the overall page layout and creates space for sidebar elements like contact info, skills, and education

---

### main.tex
**Purpose**: Configuration aggregator that loads all config files

**Contents**:
```latex
\input{./config/config.tex}
\input{./config/color.tex}
\input{./config/margin.tex}
\input{./config/commands.tex}
```

**Design**: Includes all configuration files in the correct load order (packages first, then colors, then layout, then commands)

**Usage**: This is the entry point - the main resume.tex file should include this to apply all configuration

---

### commands.tex
**Purpose**: Reserved for custom LaTeX command definitions

**Contents**: Currently contains only template comments:
- Note about changing bullets for itemize
- Note about customizing rating markers for \cvskill command

**Usage**: Place custom macros, redefined commands, and LaTeX shortcuts here. The file is included last in main.tex so that any command definitions can override or extend the base packages

---

## Configuration Flow

```
resume.tex (root)
    └── config/main.tex (aggregator)
            ├── config.tex (packages)
            ├── color.tex (colors)
            ├── margin.tex (layout)
            └── commands.tex (custom commands)
```

The configuration is applied before any content, ensuring consistent styling across the entire resume document.