WORKS := $(wildcard works/*.md)

.PHONY: shunn-classic shunn-modern

shunn-classic: $(WORKS:works/%.md=output/shunn-classic/%.docx)

shunn-modern: $(WORKS:works/%.md=output/shunn-modern/%.docx)

# NOTE: running pandoc using markdown-smart: preserves -- while retaining curly quotes (Pandoc ≥ 3.x)

output/shunn-classic/%.docx: works/%.md standards/shunn-classic/reference.docx standards/shunn-classic/metadata.yaml
	mkdir -p output/shunn-classic
	pandoc $< \
	  --reference-doc=standards/shunn-classic/reference.docx \
	  --metadata-file=standards/shunn-classic/metadata.yaml \
		-f markdown-smart \
	  -o $@

output/shunn-modern/%.docx: works/%.md standards/shunn-modern/reference.docx standards/shunn-modern/metadata.yaml
	mkdir -p output/shunn-modern
	pandoc $< \
	  --reference-doc=standards/shunn-modern/reference.docx \
	  --metadata-file=standards/shunn-modern/metadata.yaml \
		-f markdown-smart \
	  -o $@
