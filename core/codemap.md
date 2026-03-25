# core/

## Responsibility
This directory contains the LaTeX core files for the resume/CV. It provides the document class and all supporting packages that define the visual layout, styling, commands, and content structures used to build the resume. The system is built on top of the AltaCV class with custom extensions for contact info, sections, items, and more.

## Files

### Document Classes
- **`altacv.cls`** - The base AltaCV document class (v1.3.3), a popular LaTeX class for creating modern CVs/resumes. Defines the core layout, colors, section formatting, photo placement, and bibliography integration. Supports options for academicons, normal photos, ragged2e, and hyperref.
- **`core.cls`** - Custom resume class that extends AltaCV. Configures font settings (Lato font family), loads FontAwesome5 for icons, and imports all custom packages from the `packages/` and `settings/` directories.

### Packages (./packages/)
- **`achievement.sty`** - Defines `\cvachievement` command for displaying achievements with an icon, title, and description in a tabular format.
- **`bibliography.sty`** - Empty placeholder package for bibliography configuration (likely extended elsewhere).
- **`commands.sty`** - Core utility commands including `\emphasis` for styled text, and customizations for `\itemmarker` and `\ratingmarker`.
- **`contacts.sty`** - Defines contact info fields using AltaCV's `\NewInfoField`: email, mailaddress, phone, homepage, link, twitter, linkedin, github, orcid, location, instagram, and telegram.
- **`fonts.sty`** - Configures the font directory and main document font (Lato). Sets up FontAwesome font family.
- **`geometry.sty`** - Empty placeholder for page geometry configuration.
- **`honor.sty`** - Defines `\cvhonor` command for displaying honors/awards with icon, title, and details in a multi-row tabular layout.
- **`items.sty`** - Defines `\cvevent` and `\cvexperience` commands for displaying CV events and work experiences with dates and locations.
- **`misc.sty`** - Miscellaneous commands: `\cvtag` (styled tags), `\cvskill` (skill rating visualization), `\cvref` (references), `\cvcert` (certifications), and `\cvtool` (tool/technology listings).
- **`roles.sty`** - Defines `\cvrole` command for displaying roles with dates and location info.
- **`sections.sty`** - Defines `\cvsection` and `\cvsubsection` commands for creating styled section headers with colored rules.

### Settings (./settings/)
- **`fontsettings.sty`** - Placeholder for additional font configuration (currently just a comment).
- **`sections.sty`** - Defines localized section commands: `\Experience`, `\Education`, `\Training`, `\Languages`, `\Achievements`, `\ComputerSkills`, `\EngineeringSkills`, `\MediaSkills`, `\Publications`, `\RelevantCourses`, `\Conferences`, `\Activities`, and `\Referees`. Each supports English (EN) and Russian (RU) translations.

### Additional Files
- **`fontawesomesymbols.tex`** - Large file (900 lines) defining FontAwesome 5 icon shortcuts as TeX commands (e.g., `\faGitHub`, `\faLinkedIn`, `\faStar`). Maps icon names to their Unicode glyphs for use in the document.