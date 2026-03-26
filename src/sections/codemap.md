# sections/

## Responsibility

This directory contains LaTeX section files that comprise the content sections of the resume. Each file represents a distinct section of the CV/resume, covering personal information, work experience, activities, part-time roles, and volunteer work.

## Design Patterns

- **Modular Organization**: Each section is a separate `.tex` file, following the modular design pattern that allows for easy maintenance and selective inclusion in the main resume.
- **Consistent Structure**: All sections use standardized LaTeX commands from the `awesome-cv` class (e.g., `\cvsection`, `\cvexperience`, `\cvrole`, `\cvevent`, `\divider`).
- **Semantic Naming**: File names clearly describe their content (e.g., `experience.tex` for work history, `volunteer.tex` for community involvement).
- **Visual Hierarchy**: Uses `\divider` commands to separate entries within sections, and itemized lists with `\emphasis` for highlighting key accomplishments.

## Integration

These sections are integrated into the main resume through the root `resume.tex` file, which uses LaTeX input commands to include each section. The sections reference shared resources like:

- Photo assets (e.g., `./assets/images/me`)
- Custom LaTeX commands defined in the preamble (e.g., `\cvexperience`, `\photoR`, `\personalinfo`)
- Color themes defined in the main document class

## Files

### personal.tex

Contains the header information for the resume including:

- Name: Luis Mayta
- Tagline with professional titles (AI Platform Architect, Lead ML Systems Engineer)
- Profile photo reference
- Contact information (email, phone, location, homepage, social links, ORCID)

### experience.tex

Documents the professional work history with multiple roles:

- AI Platform Architect / Lead ML Systems Engineer at Infosis (Aug 2025 -- Present)
- Lead Software Architect at Infosis (Nov 2022 -- Aug 2025)
- Machine Learning Engineer at Maker Development (Part-time, Nov 2023 -- May 2024)
- Senior SRE / DevOps Engineer at Multiple Companies (2017 -- 2022)

Each entry includes bullet points highlighting key achievements and technologies used.

### day_of_my_life.tex

A unique visual section featuring:

- A wheel chart visualization showing daily time distribution across activities (sleep, fitness, focused work, learning, family, open source)
- A descriptive paragraph about personal work philosophy and values

### part_time_roles.tex

Lists part-time and ongoing contributions:

- Software Developer at Freedom Project (PunoPeru) from February 2018 to Present
- Focus on organization maintenance

### volunteer.tex

Documents community involvement and advocacy:

- Development Leader at "Compartiendo Conocimiento" (Feb 2015 -- Present) - Co-organizer and research
- Member & Evangelist at "MongoDB Peru" (June 2013 -- Present) - Speaker and research

### codemap.md

Documentation file providing an overview of the sections directory structure, design patterns, and file descriptions.