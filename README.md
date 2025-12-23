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

The reference documents are created by exporting Pandoc’s default DOCX reference file and then editing it in Word or LibreOffice by modifying a small number of paragraph styles (e.g. Normal, Title, Subtitle, Header). This is intended as a one-time setup step; the reference documents are treated as first-class inputs and are version controlled. 

The initial reference file can be generated with:

```bash
pandoc --print-default-data-file reference.docx > reference.docx
```

Only a small number of styles typically matter for prose submissions. The intent is to keep formatting rules explicit and out of the manuscript text itself.

This repository includes two worked examples:

  • shunn-classic (monospaced)
  • shunn-modern (proportional serif)

The reference DOCX files are designed for use with Pandoc’s DOCX output and have been developed and tested using LibreOffice.

They should open and function in Microsoft Word, but layout and style editing has not been formally tested there. Users working primarily in Word may need to make small adjustments.

### Notes on Markdown usage

This project targets reliable DOCX output via Pandoc. As a result, some Markdown constructs are used as deliberate workarounds for limitations in Pandoc’s DOCX writer and Word-style document models.

Examples include:

- Blockquotes used to trigger the "Block Text" paragraph style for Shunn front-matter (name / email / word count), ensuring single spacing independent of body paragraph settings.

- Raw Pandoc blocks such as:

  ```
  ::: {custom-style="section-break"}
  \#
  :::
  ```

  This isused to force explicit section breaks and style transitions that cannot be expressed semantically in Markdown alone, in this context.

By necessity, these choices prioritize predictable layout and submission compliance over strict Markdown semantic purity.

See `works/example-story.md` to see these constructs in context.