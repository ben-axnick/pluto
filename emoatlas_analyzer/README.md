# EmoAtlas Text Analyzer

A command-line tool that analyzes text files using EmoAtlas and converts the results to Plutchik-compatible JSON format for visualization with the Pluto tool.

## Features

- **EmoAtlas Integration**: Analyze text using textual forma mentis networks
- **Plutchik JSON Output**: Generate JSON compatible with Pluto visualizer
- **Story Management**: Organize analyses with custom IDs
- **Flexible Output**: Auto-generate names or use custom paths
- **Verbose Mode**: Detailed analysis information

## Installation

### Prerequisites

- Python 3.7 or higher
- pip (Python package installer)

### Setup

```bash
# Install dependencies and language models
make setup
```

This will:

1. Install EmoAtlas and dependencies
2. Download spaCy English language model (en_core_web_lg)
3. Download NLTK wordnet data

### Manual Installation

```bash
# Install dependencies
pip install -r requirements.txt

# Download language models and data
python -m spacy download en_core_web_lg
python -c "import nltk; nltk.download('wordnet')"
```

## Usage

### Basic Analysis

```bash
# Analyze with story ID (creates stories/story-001.json)
./analyze --id story-001 transcript.txt

# Analyze with auto-generated name (creates transcript-analysis.json)
./analyze transcript.txt

# Custom output path
./analyze --output custom-analysis.json transcript.txt
```

### Verbose Output

```bash
# Show detailed analysis information
./analyze --id story-001 transcript.txt --verbose
```

### Integration with Pluto Visualizer

The JSON output is compatible with the Pluto visualizer:

```bash
# Step 1: Analyze text with EmoAtlas
./analyze --id climate-story climate_script.txt

# Step 2: Visualize with Pluto (in pluto_project directory)
cd ../pluto_project
./pluto ../emoatlas_analyzer/stories/climate-story.json
```

## Output Format

The tool generates JSON files with the following structure:

```json
{
  "analysis_metadata": {
    "text_length": 1250,
    "analysis_timestamp": "2025-01-27 10:30:00",
    "dominant_emotions": ["joy", "anticipation"],
    "overall_emotional_tone": "Primary emotions: joy, anticipation",
    "confidence_score": 0.7,
    "source": "EmoAtlas",
    "story_id": "story-001"
  },
  "part1_basic_emotions": {
    "joy": 0.8,
    "trust": 0.3,
    // ... other emotions
  },
  "part2_intensity_levels": {
    "joy": { "mild": 0.16, "moderate": 0.56, "intense": 0.08 },
    // ... other emotions with intensity breakdowns
  },
  "part3_emotional_dyads": {
    // Dyad scores (currently set to 0.0 - EmoAtlas focuses on basic emotions)
  },
  "analysis_summary": {
    "key_findings": [...],
    "emotional_complexity": "...",
    "notable_patterns": [...],
    "recommendations": [...]
  }
}
```

## Makefile Commands

```bash
make help        # Show available commands
make install     # Install dependencies
make setup       # Full setup (install + language models)
make test        # Run test analysis
make check       # Check if dependencies are installed
make clean       # Clean up generated files
```

## Supported Emotions

The tool analyzes text for Plutchik's 8 basic emotions:

- **Joy**: happiness, delight, cheerfulness
- **Trust**: confidence, faith, security
- **Fear**: anxiety, worry, terror
- **Surprise**: amazement, shock, bewilderment
- **Sadness**: sorrow, grief, melancholy
- **Disgust**: revulsion, loathing, contempt
- **Anger**: rage, fury, irritation
- **Anticipation**: excitement, hope, enthusiasm

## Dependencies

- **emoatlas**: Emotion analysis using textual forma mentis networks
- **spacy**: Natural language processing (requires en_core_web_lg model)
- **nltk**: Natural language toolkit (requires wordnet data)
- **numpy**: Numerical computing
- **pandas**: Data manipulation

## Troubleshooting

### Common Issues

1. **EmoAtlas not found**: Run `make setup` to install all dependencies

2. **Language model missing**: Download manually:

   ```bash
   python -m spacy download en_core_web_lg
   ```

3. **NLTK data missing**: Download manually:
   ```bash
   python -c "import nltk; nltk.download('wordnet')"
   ```

### Checking Installation

```bash
make check
```

This will verify all dependencies and language models are properly installed.

## Integration Workflow

This tool is designed to work with the Pluto visualizer:

1. **Analyze Text**: Use this tool to convert text to JSON
2. **Visualize**: Use Pluto to create emotion wheel visualizations
3. **Process**: Use the existing story processing workflow

```bash
# Complete workflow example
cd emoatlas_analyzer
./analyze --id john-oliver-climate script.txt

cd ../pluto_project
./pluto ../emoatlas_analyzer/stories/john-oliver-climate.json
```

## References

- [EmoAtlas Library](https://github.com/MassimoStel/emoatlas)
- [EmoAtlas Documentation](https://github.com/MassimoStel/emoatlas/wiki/0-%E2%80%90-Home)
- [Plutchik's Wheel of Emotions](https://en.wikipedia.org/wiki/Contrasting_and_categorization_of_emotions#Plutchik's_wheel_of_emotions)
