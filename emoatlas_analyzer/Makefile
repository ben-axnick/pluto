# Makefile for EmoAtlas Text Analyzer
# Usage:
#   make install    - Install dependencies
#   make setup      - Install dependencies and setup language models
#   make test       - Run a test analysis
#   make clean      - Clean up generated files
#   make help       - Show this help message

.PHONY: help install setup test clean check-python

# Default target
help:
	@echo "EmoAtlas Text Analyzer - Makefile"
	@echo ""
	@echo "Available targets:"
	@echo "  install     - Install Python dependencies"
	@echo "  setup       - Install dependencies and setup language models"
	@echo "  test        - Run a test analysis on sample text"
	@echo "  clean       - Clean up generated files"
	@echo "  check       - Check if dependencies are installed"
	@echo "  help        - Show this help message"
	@echo ""
	@echo "Usage examples:"
	@echo "  make setup                          # First-time setup"
	@echo "  ./analyze --id story-001 text.txt   # Analyze with story ID"
	@echo "  ./analyze text.txt                  # Analyze with auto-generated name"

# Check if Python 3 is available
check-python:
	@which python3 >/dev/null 2>&1 || (echo "Error: Python 3 is required but not found in PATH" && exit 1)
	@echo "✓ Python 3 found: $$(python3 --version)"

# Install Python dependencies
install: check-python
	@echo "Installing EmoAtlas and dependencies..."
	python3 -m pip install --user -r requirements.txt
	@echo "✓ Dependencies installed successfully"

# Setup language models and data (required for EmoAtlas)
setup-data:
	@echo "Setting up language models and NLTK data..."
	python3 -c "import nltk; nltk.download('wordnet', quiet=True); print('✓ NLTK wordnet downloaded')"
	python3 -m spacy download en_core_web_lg
	@echo "✓ Language models downloaded"

# Full setup: install dependencies and setup data
setup: install setup-data
	@echo "✓ Setup complete! You can now use:"
	@echo "  ./analyze --id story-001 text.txt   # Analyze with story ID"
	@echo "  ./analyze text.txt                  # Analyze with auto-generated name"

# Test the installation with sample text
test: check-python
	@if [ ! -f "test_sample.txt" ]; then \
		echo "Creating sample text file..."; \
		echo "I am absolutely thrilled and overjoyed about this amazing opportunity! However, I must admit I'm quite worried and anxious about the upcoming presentation. Despite my fears, I'm excited and hopeful about what the future holds." > test_sample.txt; \
	fi
	@echo "Running test analysis..."
	python3 analyze --id test-sample test_sample.txt --verbose
	@if [ -f "stories/test-sample.json" ]; then \
		echo "✓ Test completed successfully! Output: stories/test-sample.json"; \
	else \
		echo "✗ Test failed - no output file generated"; \
		exit 1; \
	fi

# Check if dependencies are properly installed
check: check-python
	@echo "Checking dependencies..."
	@python3 -c "import numpy; print('✓ numpy')" 2>/dev/null || echo "✗ numpy not installed"
	@python3 -c "import pandas; print('✓ pandas')" 2>/dev/null || echo "✗ pandas not installed"
	@python3 -c "import nltk; print('✓ nltk')" 2>/dev/null || echo "✗ nltk not installed"
	@python3 -c "import spacy; print('✓ spacy')" 2>/dev/null || echo "✗ spacy not installed"
	@python3 -c "from emoatlas import EmoScores; print('✓ emoatlas')" 2>/dev/null || echo "✗ emoatlas not installed"
	@echo "Checking language models and data..."
	@python3 -c "import nltk; nltk.data.find('corpora/wordnet'); print('✓ NLTK wordnet')" 2>/dev/null || echo "✗ NLTK wordnet not downloaded"
	@python3 -c "import spacy; spacy.load('en_core_web_lg'); print('✓ spaCy en_core_web_lg')" 2>/dev/null || echo "✗ spaCy en_core_web_lg not installed"

# Clean up generated files
clean:
	@echo "Cleaning up generated files..."
	@rm -f test_sample.txt
	@rm -f *-analysis.json
	@rm -rf stories/test-sample*
	@rm -rf __pycache__/
	@rm -rf .pytest_cache/
	@echo "✓ Cleanup complete"

# Development targets
dev-install: install
	@echo "Installing development dependencies..."
	python3 -m pip install --user pytest black flake8
	@echo "✓ Development dependencies installed"
