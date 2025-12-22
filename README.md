# manuscript-maker

A minimal, reproducible workflow for writing prose in Markdown and producing submission-ready manuscripts (e.g. Shunn format) using Pandoc and reference DOCX files.

## Goals

- Write in plain Markdown
- Keep formatting out of the text
- Produce editor-friendly DOCX outputs
- Make submission standards explicit and reproducible

## Structure

```
manuscript-maker/
├── Makefile
├── output
│   ├── shunn-classic
│   └── shunn-modern
├── README.md
├── scripts
├── standards
│   ├── shunn-classic
│   │   ├── metadata.yaml
│   │   └── reference.docx
│   └── shunn-modern
│       ├── metadata.yaml
│       └── reference.docx
├── templates
└── works
    └── example-story.md
```

- `works/` — source manuscripts (Markdown)
- `standards/` — submission standards (metadata + reference DOCX)
- `output/` — generated documents (not hand-edited)
- `scripts/` — helper scripts (optional)

## Example

In project root, run:

```bash
make shunn-classic
```

Or:

```bash
make shunn-modern
```

These will generate a Shunn-formatted DOCX manuscript in `output/` for each markdown file in `works/`.

## Submission standards

This repository separates *manuscript content* from *submission standards*.

Submission standards live under `standards/` and consist of:
- a `reference.docx` file (Word styles)
- a small `metadata.yaml` file (Pandoc metadata)

Currently supported:

- **shunn-classic**  
  Traditional Shunn-style manuscript using a monospaced font.

- **shunn-modern**  
  Contemporary Shunn-style manuscript using a proportional serif font.

The same Markdown source can be rendered against different standards without modification.


## Creating and modifying submission standards

Submission standards are defined by a pair of files:

- `reference.docx` — a Word document containing the formatting rules
- `metadata.yaml` — small Pandoc metadata overrides

The reference documents are created using Pandoc’s default reference file and then edited in Word or LibreOffice by modifying paragraph styles (e.g. Normal, Title, Subtitle, Header). This is intended as a one-time setup step; the reference documents are treated as first-class inputs and are version controlled.

Only a small number of styles typically matter for prose submissions. The intent is to keep formatting rules explicit and out of the manuscript text itself.

This repository includes two worked examples:
- `shunn-classic` (monospaced)
- `shunn-modern` (proportional serif)

New standards can be created by copying and adapting an existing one.

