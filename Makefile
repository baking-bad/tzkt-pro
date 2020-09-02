.PHONY: docs

install:
	yarn
	pip install nbconvert
	sudo apt install rename -y

postprocess:
	cd $$MDIR && rename 's/^([0-9]+).*/$$1.md/' *.md
	cd $$MDIR && sed -i 's/&quot;/"/g' *.md
	cd $$MDIR && sed -r -i 's/^>\sNote:\s(.*)$$/::: warning NOTE\n\1\n:::/g' *.md
	cd $$MDIR && sed -r -i 's/^>\sTip:\s(.*)$$/::: tip\n\1\n:::/g' *.md

docs:
	rm docs/tutorials/*.md || true
	jupyter nbconvert notebooks/*.ipynb --TemplateExporter.template_file=jupyter.tpl --Exporter.preprocessors='["preprocess.AddBinderComponent"]' --to markdown --output-dir docs/tutorials
	MDIR=docs/tutorials $(MAKE) postprocess

build:
	yarn build
	echo "pro.tzkt.io" > ./docs/.vuepress/dist/CNAME

dev:
	yarn dev