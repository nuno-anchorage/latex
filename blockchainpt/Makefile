# Variables
LATEX=xelatex
BIB=biber
PUBLISH_DIR=./publish
SCAN_SCRIPT=../scripts/scan.sh

# Default target
all: build

# Run the scan script and build the LaTeX document
build:
	cd $(DELIVERABLE) && \
	$(SCAN_SCRIPT) && \
	$(LATEX) -output-directory=./build deliverable.tex && \
	$(BIB) --input-directory=./build --output-directory=./build deliverable && \
	$(LATEX) -output-directory=./build deliverable.tex && \
	$(LATEX) -output-directory=./build deliverable.tex # Run twice for references

# Publishes the deliverable
publish: build
	mv $(DELIVERABLE)/build/deliverable.pdf $(PUBLISH_DIR)/$(DELIVERABLE).pdf

# Create the deliverable folder
deliverable:
	@echo "Creating new deliverable..."
	@mkdir $(DELIVERABLE)
	@mkdir $(DELIVERABLE)/build
	@cp -r ./template/* ./$(DELIVERABLE)
	@echo "Deliverable created in $(DELIVERABLE)"

# Clean up generated files
clean:
	rm -rf $(DELIVERABLE)/build/*

.PHONY: all deliverable build clean