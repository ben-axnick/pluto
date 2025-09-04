# Pluto - JSON-based Plutchik Emotion Wheel Visualization Tool

Pluto is a command-line tool that reads JSON emotion analysis data and generates Plutchik emotion wheel visualizations using the pyplutchik library.

## Features

- Reads JSON files containing pre-analyzed emotion data
- Supports 3-dimensional emotion intensity levels (mild, moderate, intense)
- Maps emotions to Plutchik's 8 basic emotions: joy, trust, fear, surprise, sadness, disgust, anger, anticipation
- Generates beautiful emotion wheel visualizations saved as PNG images
- Displays metadata including dominant emotions, confidence scores, and overall tone
- Command-line interface with verbose output option

## Installation

### Prerequisites

- Python 3.7 or higher
- pip (Python package installer)

### Quick Setup

1. Navigate to the pluto_project directory:

   ```bash
   cd pluto_project
   ```

2. Run the setup command to install all dependencies:
   ```bash
   make setup
   ```

### Manual Installation

If you prefer to install manually:

```bash
# Install dependencies
pip install -r requirements.txt
```

## Usage

### Basic Usage

```bash
./pluto path/to/your/analysis.json
```

This will create an image file named `analysis-plutchik.png` in the same directory as your input file.

### Advanced Usage

```bash
# Custom output path
./pluto emotion_data.json --output my_visualization.png

# Add custom title
./pluto emotion_data.json --title "My Emotion Analysis"

# Verbose output (shows emotion intensity levels)
./pluto emotion_data.json --verbose

# Show help
./pluto --help
```

### Examples

```bash
# Visualize emotion analysis
./pluto sample_analysis.json

# Analyze with verbose output
./pluto emotion_results.json --verbose

# Custom output location
./pluto analysis.json --output /path/to/results/emotion_wheel.png
```

## Makefile Commands

The project includes a Makefile for easy management:

```bash
make help        # Show available commands
make install     # Install Python dependencies
make setup       # Full setup (install + NLTK data)
make test        # Run test analysis
make check       # Check if dependencies are installed
make clean       # Clean up generated files
```

## Output

The tool generates:

- A PNG image showing the Plutchik emotion wheel with 3-dimensional intensity visualization
- Optional verbose output showing individual emotion intensity levels and metadata

Example emotion intensity levels:

```
Emotion Intensity Levels:
  Anger        - Mild: 0.100, Moderate: 0.000, Intense: 0.000 (Total: 0.100)
  Anticipation - Mild: 0.300, Moderate: 0.400, Intense: 0.100 (Total: 0.800)
  Disgust      - Mild: 0.000, Moderate: 0.000, Intense: 0.000 (Total: 0.000)
  Fear         - Mild: 0.200, Moderate: 0.400, Intense: 0.100 (Total: 0.700)
  Joy          - Mild: 0.100, Moderate: 0.000, Intense: 0.000 (Total: 0.100)
  Sadness      - Mild: 0.100, Moderate: 0.000, Intense: 0.000 (Total: 0.100)
  Surprise     - Mild: 0.200, Moderate: 0.000, Intense: 0.000 (Total: 0.200)
  Trust        - Mild: 0.200, Moderate: 0.400, Intense: 0.000 (Total: 0.600)
```

## How It Works

Pluto reads pre-analyzed JSON emotion data and visualizes it:

1. **JSON Parsing**: Reads emotion analysis data from JSON file
2. **Data Validation**: Ensures proper format and validates intensity levels
3. **3D Mapping**: Maps mild, moderate, and intense levels for each emotion
4. **Metadata Extraction**: Extracts analysis metadata for enhanced visualization
5. **Plutchik Visualization**: Generates the emotion wheel using pyplutchik with 3-dimensional data

## Supported Emotions

Pluto analyzes text for Plutchik's 8 basic emotions:

- **Joy**: happiness, delight, cheerfulness
- **Trust**: confidence, faith, security
- **Fear**: anxiety, worry, terror
- **Surprise**: amazement, shock, bewilderment
- **Sadness**: sorrow, grief, melancholy
- **Disgust**: revulsion, loathing, contempt
- **Anger**: rage, fury, irritation
- **Anticipation**: excitement, hope, enthusiasm

## File Structure

```
pluto_project/
├── pluto                    # Main executable script
├── requirements.txt         # Python dependencies
├── Makefile                # Build and setup commands
├── README.md               # This file
├── sample_analysis.json    # Example JSON emotion data for testing
└── plutchik_analysis_prompt.md  # LLM prompt for generating JSON data
```

## Dependencies

- **pyplutchik**: Plutchik emotion wheel visualization
- **matplotlib**: Plotting and image generation
- **numpy**: Numerical computing support

## Troubleshooting

### Common Issues

1. **Permission denied**: Make sure the script is executable:

   ```bash
   chmod +x pluto
   ```

2. **Module not found**: Install dependencies:

   ```bash
   make setup
   ```

3. **Invalid JSON format**: Ensure your JSON file follows the expected structure with `part2_intensity_levels` section.

4. **Missing emotion data**: The script will warn about missing emotions and use default values (0.0, 0.0, 0.0).

### Checking Installation

```bash
make check
```

This will verify all dependencies are properly installed.

## Contributing

To set up a development environment:

```bash
make dev-install  # Install development dependencies
make format       # Format code with black
make lint         # Lint code with flake8
```

## License

This project uses the pyplutchik library and follows its licensing terms.

## References

- [Plutchik's Wheel of Emotions](https://en.wikipedia.org/wiki/Contrasting_and_categorization_of_emotions#Plutchik's_wheel_of_emotions)
- [pyplutchik Documentation](https://github.com/alfonsosemeraro/pyplutchik)
- [VADER Sentiment Analysis](https://github.com/cjhutto/vaderSentiment)
