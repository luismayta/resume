# sidebars/

## Responsibility

This directory contains LaTeX sidebar content files for the resume. Each `.tex` file represents a distinct sidebar section that appears alongside the main resume content, providing supplementary information such as skills, education, certifications, and personal details. The sidebars are designed to give recruiters and hiring managers a quick overview of the candidate's technical competencies, professional background, and personal attributes.

## Design Patterns

The sidebar content follows a modular, single-responsibility pattern where each file handles one specific category of information. All files use the `cvsection` command to create major sections and leverage custom LaTeX commands from the resume template (`\cvskill`, `\cvsubsection`, `\cvtag`, `\cvevent`, `\cvref`, `\cvcert`, `\cvhonor`, `\cvachievement`) to maintain consistent styling across all sidebars.

The content is organized into three main tiers:
- **Technical Information**: Skills, technical domains, certifications
- **Professional Background**: Education, conferences, references
- **Personal Attributes**: Soft skills, languages, honors, daily routine

## Integration

The sidebar files are designed to be included in the main LaTeX resume document using `\input{sidebars/<filename>}` or similar LaTeX include mechanisms. Each file is self-contained and can be selectively included or excluded from the resume build depending on the desired output. The sidebars typically appear in a fixed column layout on the resume, with each file representing one vertical section.

## Files

### skills.tex
Technical skills organized into four categories: AI Platform & Emerging Tech (MCP, LLM Orchestration, Vector Search, Cloud ML), Cloud & Infrastructure (Kubernetes, IaC, Configuration Management, AWS, CI/CD), Software Engineering (DevOps/MLOps, Architecture, DevSecOps, Design Patterns), and Programming Languages (Go, Python, Rust, Kotlin, Java, TypeScript). Each skill includes a proficiency level (1-5 scale).

### soft_skills.tex
Personal and professional soft skills displayed as tags, including outcome-driven delivery, technical leadership, architectural decision-making, clear technical communication, ownership & accountability, systems thinking, and cross-team collaboration.

### referess.tex
Professional references with contact information, including four references from previous employers (Product Owner, Mobile Development Lead, General Manager, and Data Science roles) from companies like Grupo El Comercio, Maker Development, and Interbank.

### technical_domains.tex
Technical domain expertise displayed as tags, covering information security, DevOps, DevSecOps, software engineering, automation, vulnerability assessment, metrics visualization & analytics, machine learning, NLP, LLMs, API design (REST & GraphQL), and Model Context Protocol (MCP).

### education.tex
Educational background with two formal programs: DevOps/SRE Nanodegree from Udacity (2017) and Software Development Program from Open Source College (2011-2012). Includes a note about self-taught professional commitment to continuous learning.

### languages.tex
Language proficiency with Spanish (native level - 5) and English (intermediate level - 3).

### honors.tex
Divided into two sections: "Most Proud Of" personal achievements (courage and persistence/loyalty) and "Honors & Awards" including three competition wins: 1st Place at Mi Primer Paso (Universidad de Lima, 2019), Merit Award for Innovation from Innovate Perú (2017), and 1st Place at Eventec Peruanо Alemán (2007).

### day_of_my_life.tex
A visual wheel chart showing daily time allocation (Sleep 29%, Fitness/Boxing 8%, Work 33%, Continuous Learning 13%, Family Time 13%, Open Source 4%) followed by a detailed text description of the daily routine emphasizing professional focus, continuous learning, open-source contribution, and personal well-being.

### certifications.tex
Professional certifications including Blockchain Developer with Ethereum, Blockchain Theory 101, Dart & Introduction to Flutter, Golang JumpStart, and Serverless Architecture on AWS.

### conferences.tex
Conference participation including co-organization of "Mean Full-Stack" (Compartiendo Conocimiento, 2015) and speaking engagement at "Introduction to NoSQL MongoDB" (MongoDB Peru, 2014).