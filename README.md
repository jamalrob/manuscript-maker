# manuscript-maker

A minimal, reproducible workflow for writing prose in Markdown and producing
submission-ready manuscripts (e.g. Shunn format) using Pandoc and reference
DOCX files.

## Goals

- Write in plain Markdown
- Keep formatting out of the text
- Produce editor-friendly DOCX outputs
- Make submission standards explicit and reproducible

## Structure

```
manuscript-maker/
├── output
│   └── shunn
│       └── example-story.docx
├── README.md
├── scripts
├── standards
│   └── shunn
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

```bash
pandoc works/example-story.md \
  --reference-doc=standards/shunn/reference.docx \
  --metadata-file=standards/shunn/metadata.yaml \
  -o output/shunn/example-story.docx
```

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

The same Markdown source can be rendered against different standards
without modification.
