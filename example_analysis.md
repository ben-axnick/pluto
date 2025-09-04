# Example Plutchik Analysis

## Sample Text

"The old lighthouse keeper watched the storm approach with growing unease. Dark clouds gathered menacingly on the horizon, and the wind began to howl with increasing fury. Despite his years of experience, a chill of fear ran down his spine. Yet, beneath the anxiety, there was also a strange sense of anticipation - he had weathered many storms before, and there was something almost thrilling about the raw power of nature. As the first drops of rain began to fall, he smiled grimly and prepared for the long night ahead, trusting in his lighthouse to guide ships safely home."

## Expected JSON Output

```json
{
  "analysis_metadata": {
    "text_length": 634,
    "analysis_timestamp": "2025-01-27 10:30:00",
    "dominant_emotions": ["fear", "anticipation", "trust"],
    "overall_emotional_tone": "Tense anticipation mixed with experienced confidence",
    "confidence_score": 0.88
  },
  "part1_basic_emotions": {
    "joy": 0.1,
    "trust": 0.6,
    "fear": 0.7,
    "surprise": 0.2,
    "sadness": 0.1,
    "disgust": 0.0,
    "anger": 0.1,
    "anticipation": 0.8
  },
  "part2_intensity_levels": {
    "joy": { "mild": 0.1, "moderate": 0.0, "intense": 0.0 },
    "trust": { "mild": 0.2, "moderate": 0.4, "intense": 0.0 },
    "fear": { "mild": 0.2, "moderate": 0.4, "intense": 0.1 },
    "surprise": { "mild": 0.2, "moderate": 0.0, "intense": 0.0 },
    "sadness": { "mild": 0.1, "moderate": 0.0, "intense": 0.0 },
    "disgust": { "mild": 0.0, "moderate": 0.0, "intense": 0.0 },
    "anger": { "mild": 0.1, "moderate": 0.0, "intense": 0.0 },
    "anticipation": { "mild": 0.3, "moderate": 0.4, "intense": 0.1 }
  },
  "part3_emotional_dyads": {
    "primary_dyads": {
      "optimism": 0.4,
      "love": 0.1,
      "submission": 0.3,
      "awe": 0.5,
      "disapproval": 0.1,
      "remorse": 0.0,
      "contempt": 0.0,
      "aggressiveness": 0.3
    },
    "secondary_dyads": {
      "pride": 0.2,
      "hope": 0.6,
      "anxiety": 0.7,
      "shame": 0.1,
      "sentimentality": 0.2,
      "cynicism": 0.1,
      "outrage": 0.1,
      "envy": 0.0
    },
    "tertiary_dyads": {
      "delight": 0.1,
      "guilt": 0.1,
      "curiosity": 0.3,
      "despair": 0.2,
      "unbelief": 0.0,
      "pessimism": 0.2,
      "morbidness": 0.0,
      "dominance": 0.4
    }
  },
  "analysis_summary": {
    "key_findings": [
      "Strong anticipation dominates the emotional landscape",
      "Fear is present but balanced by trust and experience",
      "The text shows emotional complexity with both negative apprehension and positive confidence",
      "Professional competence moderates natural fear responses"
    ],
    "emotional_complexity": "High complexity with layered emotions - surface fear counterbalanced by deep professional trust and anticipatory excitement",
    "notable_patterns": [
      "Tension between fear and trust creates emotional depth",
      "Anticipation builds throughout the narrative",
      "Professional experience serves as emotional anchor"
    ],
    "recommendations": [
      "This text would be effective for teaching about emotional complexity in literature",
      "Good example of how professional experience can moderate natural fear responses",
      "Demonstrates how anticipation can be both positive and negative simultaneously"
    ]
  }
}
```

## Analysis Rationale

### Part 1 - Basic Emotions Scoring:

- **Fear (0.7)**: "growing unease", "chill of fear", "anxiety" - strong but not overwhelming
- **Anticipation (0.8)**: "strange sense of anticipation", "thrilling", "prepared" - highest score due to forward-looking tension
- **Trust (0.6)**: "years of experience", "trusting in his lighthouse" - professional confidence
- **Surprise (0.2)**: Minimal, mostly in the "strange" quality of anticipation
- **Joy (0.1)**: Very subtle in "smiled grimly" - more grim satisfaction than joy
- **Others (low scores)**: Present but not dominant in this narrative

### Part 2 - Intensity Levels:

- Fear shows moderate intensity primarily, with some mild and a touch of intense
- Anticipation spans all levels but strongest in moderate range
- Trust is steady and moderate, reflecting professional competence

### Part 3 - Dyads:

- **Anxiety (0.7)**: Strong combination of fear + anticipation
- **Hope (0.6)**: Trust + anticipation in weathering the storm
- **Awe (0.5)**: Fear + surprise at nature's power
- **Optimism (0.4)**: Anticipation + joy in the challenge ahead

This example demonstrates how the prompt should produce nuanced, evidence-based analysis that captures both the explicit and implicit emotional content of the text.
