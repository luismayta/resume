#!/usr/bin/env python3
"""
Resume Generator - Convert YAML data to LaTeX resumes.

Usage:
    python scripts/generate_resume.py --profile ai-architect --lang en
    python scripts/generate_resume.py --all
"""

import argparse
import sys
import yaml
from pathlib import Path
from typing import Any

# Project root
PROJECT_ROOT = Path(__file__).parent.parent
DATA_DIR = PROJECT_ROOT / "data"


def load_yaml(filepath: Path) -> dict[str, Any]:
    """Load YAML file."""
    with open(filepath, "r", encoding="utf-8") as f:
        return yaml.safe_load(f)


def load_profile(profile_id: str) -> dict[str, Any]:
    """Load profile metadata."""
    filepath = DATA_DIR / "profiles" / f"{profile_id}.yml"
    return load_yaml(filepath)


def load_experience(profile_id: str) -> dict[str, Any]:
    """Load experience data for profile."""
    filepath = DATA_DIR / "experience" / f"{profile_id}.yml"
    return load_yaml(filepath)


def load_translations(lang: str) -> dict[str, Any]:
    """Load translation file with fallback to English."""
    filepath = DATA_DIR / "translations" / f"{lang}.yml"
    if not filepath.exists():
        filepath = DATA_DIR / "translations" / "en.yml"
    return load_yaml(filepath)


def load_sidebar(profile_id: str, sidebar_name: str) -> str:
    """Load sidebar content for profile."""
    filepath = DATA_DIR / "sidebars" / profile_id / f"{sidebar_name}.tex"
    if not filepath.exists():
        return ""
    with open(filepath, "r", encoding="utf-8") as f:
        return f.read()


def get_profile_emphasis(profile_data: dict) -> list[str]:
    """Get emphasis tags for profile."""
    return profile_data.get("emphasis", [])


def filter_experience_by_emphasis(
    experience_data: dict, profile_emphasis: list[str]
) -> list[dict]:
    """Filter experience entries by profile emphasis tags."""
    filtered = []
    for entry in experience_data.get("experience", []):
        entry_emphasis = entry.get("emphasis", [])
        # Include if any emphasis matches
        if any(emp in profile_emphasis for emp in entry_emphasis):
            filtered.append(entry)
        # Also include if no emphasis specified (default include)
        elif not entry_emphasis:
            filtered.append(entry)
    return filtered


def generate_personal_section(profile_data: dict, lang: str) -> str:
    """Generate personal.tex content."""
    # Get profile info (nested under "profile" key)
    profile_info = profile_data.get("profile", {})
    personal = profile_data.get("personal", {})
    
    # Get tagline from nested profile
    tagline_data = profile_info.get("tagline", {})
    tagline = tagline_data.get(lang, tagline_data.get("en", ""))

    lines = [
        "%% \\cvsection{Personal}",
        f"\\name{{{personal.get('name', '')}}}",
        f"\\tagline{{{tagline}}}",
        f"\\photoR{{2.5cm}}{{{personal.get('photo', './assets/images/me')}}}",
        "\\personalinfo{%",
        "  % Not all of these are required!",
    ]

    if personal.get("email"):
        lines.append(f"  \\email{{{personal['email']}}}")
    if personal.get("phone"):
        lines.append(f"  \\phone{{{personal['phone']}}}")
    if personal.get("location"):
        lines.append(f"  \\location{{{personal['location']}}}")
    if personal.get("homepage"):
        lines.append(f"  \\homepage{{{personal['homepage']}}}")
    if personal.get("twitter"):
        lines.append(f"  \\twitter{{{personal['twitter']}}}")
    if personal.get("linkedin"):
        lines.append(f"  \\linkedin{{{personal['linkedin']}}}")
    if personal.get("github"):
        lines.append(f"  \\github{{{personal['github']}}}")
    if personal.get("orcid"):
        lines.append(f"  \\orcid{{{personal['orcid']}}}")

    lines.append("}")
    return "\n".join(lines)


def generate_experience_section(
    experience_data: dict, profile_emphasis: list[str], lang: str
) -> str:
    """Generate experience.tex content."""
    translations = load_translations(lang)
    section_title = translations.get("labels", {}).get(
        "recent_work_experience", "Recent Work Experience"
    )

    lines = [
        "%-------------------------------------------------------------------------------",
        "%\tSECTION TITLE",
        "%-------------------------------------------------------------------------------",
        f"\\cvsection[page1sidebar]{{{section_title}}}",
    ]

    filtered_exp = filter_experience_by_emphasis(experience_data, profile_emphasis)

    for entry in filtered_exp:
        role = entry.get("role", {}).get(lang, entry.get("role", {}).get("en", ""))
        company = entry.get("company", "")
        period = entry.get("period", "")
        location = entry.get("location", "")
        exp_type = entry.get("type", "Full-time")

        lines.append("")
        lines.append(
            f"\\cvexperience{{{role}}}{{{company}}}{{{exp_type}}}{{{period}}}{{{location}}}"
        )

        achievements = entry.get("achievements", {}).get(lang, entry.get("achievements", {}).get("en", []))
        if achievements:
            lines.append("")
            lines.append("\\begin{itemize}")
            for achievement in achievements:
                lines.append(f"  \\item \\emphasis{{{achievement}}}")
            lines.append("\\end{itemize}")

        lines.append("")
        lines.append("\\divider")

    return "\n".join(lines)


def generate_sidebar_content(profile_id: str) -> str:
    """Generate all sidebar content."""
    lines = []

    # Load common sidebar files
    sidebar_files = [
        "skills",
        "soft_skills",
        "certifications",
        "education",
        "languages",
        "honors",
        "conferences",
    ]

    for sidebar in sidebar_files:
        content = load_sidebar(profile_id, sidebar)
        if content:
            lines.append(content)
            lines.append("")  # Add blank line between sidebars

    return "\n".join(lines)


def generate_resume_tex(
    profile_id: str, lang: str, output_path: Path
) -> None:
    """Generate complete resume.tex file."""
    # Load data
    profile_data = load_profile(profile_id)
    experience_data = load_experience(profile_id)
    translations = load_translations(lang)

    profile_emphasis = get_profile_emphasis(profile_data)

    # Generate sections
    personal = generate_personal_section(profile_data, lang)
    experience = generate_experience_section(
        experience_data, profile_emphasis, lang
    )

    # Build complete .tex content
    content = [
        "\\documentclass[10pt,a4paper,ragged2e,withhyper]{./core/core}",
        "\\input{./config/main.tex}",
        "",
        "\\begin{document}",
        "",
        personal,
        "",
        "%% Make the header extend all the way to the right, if you want.",
        "\\begin{fullwidth}",
        "\\makecvheader",
        "\\end{fullwidth}",
        "",
        experience,
        "",
        "\\clearpage",
        "\\end{document}",
    ]

    # Write to file
    output_path.parent.mkdir(parents=True, exist_ok=True)
    with open(output_path, "w", encoding="utf-8") as f:
        f.write("\n".join(content))

    print(f"Generated: {output_path}")


def main():
    parser = argparse.ArgumentParser(description="Generate resume from YAML data")
    parser.add_argument(
        "--profile",
        choices=["ai-architect", "cloud-architect", "golang-developer"],
        help="Profile to generate",
    )
    parser.add_argument(
        "--lang",
        choices=["en", "es"],
        default="en",
        help="Language (en or es)",
    )
    parser.add_argument(
        "--all",
        action="store_true",
        help="Generate all 6 resumes",
    )
    parser.add_argument(
        "--output-dir",
        default=str(PROJECT_ROOT),
        help="Output directory for .tex files",
    )

    args = parser.parse_args()

    profiles = ["ai-architect", "cloud-architect", "golang-developer"]
    langs = ["en", "es"]

    if args.all:
        # Generate all combinations
        for profile in profiles:
            for lang in langs:
                output_path = Path(args.output_dir) / f"resume-{profile}-{lang}.tex"
                generate_resume_tex(profile, lang, output_path)
    elif args.profile:
        # Generate specific profile
        output_path = Path(args.output_dir) / f"resume-{args.profile}-{args.lang}.tex"
        generate_resume_tex(args.profile, args.lang, output_path)
    else:
        parser.print_help()
        sys.exit(1)


if __name__ == "__main__":
    main()
