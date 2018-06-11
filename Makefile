src=$(shell find src -type f)
$(shell mkdir -p build)

build: $(src)

	rm build/*

	# Convert .md files to .html files
	for file in $(src)
	do
		name=`basename $file .md`
		pandoc --verbose -s -f markdown -t html -o build/$$name.html $$file
	done
