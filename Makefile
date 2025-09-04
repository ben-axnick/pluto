# Makefile for Pluto Emotion Analysis Tool
# Usage:
#   make install    - Install dependencies
#   make setup      - Install dependencies and setup NLTK data
#   make test       - Run a test analysis
#   make clean      - Clean up generated files
#   make help       - Show this help message

.PHONY: help install setup test clean check-python

# Default target
help:
	@echo "Pluto Emotion Analysis Tool - Makefile"
	@echo ""
	@echo "Available targets:"
	@echo "  install     - Install Python dependencies"
	@echo "  setup       - Install dependencies and setup NLTK data"
	@echo "  test        - Run a test analysis on sample text"
	@echo "  clean       - Clean up generated files"
	@echo "  check       - Check if dependencies are installed"
	@echo "  help        - Show this help message"
	@echo ""
	@echo "Usage examples:"
	@echo "  make setup              # First-time setup"
	@echo "  ./pluto sample_text.txt # Analyze sample text"

# Check if Python 3 is available
check-python:
	@which python3 >/dev/null 2>&1 || (echo "Error: Python 3 is required but not found in PATH" && exit 1)
	@echo "✓ Python 3 found: $$(python3 --version)"

# Install Python dependencies
install: check-python
	@echo "Installing Python dependencies..."
	python3 -m pip install --user -r requirements.txt
	@echo "✓ Dependencies installed successfully"

# Setup NLTK data (required for emotion analysis)
setup-nltk:
	@echo "Setting up NLTK data..."
	python3 -c "import nltk; nltk.download('vader_lexicon', quiet=True); print('✓ NLTK data downloaded')"

# Full setup: install dependencies and setup NLTK
setup: install setup-nltk
	@echo "✓ Setup complete! You can now use ./pluto <text_file>"

# Test the installation with sample text
test: check-python
	@if [ ! -f "sample_text.txt" ]; then \
		echo "Creating sample text file..."; \
		echo "I am absolutely thrilled and overjoyed about this amazing opportunity! However, I must admit I'm quite worried and anxious about the upcoming presentation. Despite my fears, I'm excited and hopeful about what the future holds." > sample_text.txt; \
	fi
	@echo "Running test analysis..."
	python3 pluto sample_text.txt --verbose
	@if [ -f "sample_text-plutchik.png" ]; then \
		echo "✓ Test completed successfully! Output: sample_text-plutchik.png"; \
	else \
		echo "✗ Test failed - no output file generated"; \
		exit 1; \
	fi

# Check if dependencies are properly installed
check: check-python
	@echo "Checking dependencies..."
	@python3 -c "import pyplutchik; print('✓ pyplutchik')" 2>/dev/null || echo "✗ pyplutchik not installed"
	@python3 -c "import matplotlib; print('✓ matplotlib')" 2>/dev/null || echo "✗ matplotlib not installed"
	@python3 -c "import nltk; print('✓ nltk')" 2>/dev/null || echo "✗ nltk not installed"
	@python3 -c "import textblob; print('✓ textblob')" 2>/dev/null || echo "✗ textblob not installed"
	@python3 -c "import numpy; print('✓ numpy')" 2>/dev/null || echo "✗ numpy not installed"
	@echo "Checking NLTK data..."
	@python3 -c "import nltk; nltk.data.find('vader_lexicon'); print('✓ NLTK vader_lexicon')" 2>/dev/null || echo "✗ NLTK vader_lexicon not downloaded"

# Clean up generated files
clean:
	@echo "Cleaning up generated files..."
	@rm -f *.png
	@rm -f *-plutchik.png
	@rm -rf __pycache__/
	@rm -rf .pytest_cache/
	@echo "✓ Cleanup complete"

# Development targets
dev-install: install
	@echo "Installing development dependencies..."
	python3 -m pip install --user pytest black flake8
	@echo "✓ Development dependencies installed"

# Format code (if black is installed)
format:
	@if python3 -c "import black" 2>/dev/null; then \
		python3 -m black pluto; \
		echo "✓ Code formatted with black"; \
	else \
		echo "Black not installed. Run 'make dev-install' first."; \
	fi

# Lint code (if flake8 is installed)
lint:
	@if python3 -c "import flake8" 2>/dev/null; then \
		python3 -m flake8 pluto --max-line-length=88 --ignore=E203,W503; \
		echo "✓ Code linted with flake8"; \
	else \
		echo "Flake8 not installed. Run 'make dev-install' first."; \
	fi
