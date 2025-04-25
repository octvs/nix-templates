all: main.pdf

main.pdf: %.pdf: %.md
	pandoc $< -o $@ \
		--template ${TEMPLATE} \
		--metadata-file ./meta.yaml

clean:
	rm main.pdf

.PHONY: all clean
