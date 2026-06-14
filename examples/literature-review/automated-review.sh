#!/bin/bash
# Automated Literature Review using Claude Code
# This script demonstrates how to automate literature reviews
#
# Usage: bash automated-review.sh

set -e

echo "=========================================="
echo "📚 Automated Literature Review with Claude Code"
echo "=========================================="

# Define topic
TOPIC="machine learning for drug discovery 2024-2025"

echo ""
echo "🔍 Searching for: $TOPIC"
echo "=========================="

# Search and summarize
claude -p "
Search PubMed for papers on '$TOPIC'.

For each of the top 10 papers, provide:
1. Title and authors
2. Journal and year
3. Key methods used
4. Main findings
5. A 2-sentence summary

Format as a markdown table with columns:
| # | Title | Journal | Year | Methods | Key Finding | Summary |

Save to results/literature_search.md
"

echo ""
echo "📊 Extracting trends..."
echo "=========================="

claude -p "
Based on the literature search results in results/literature_search.md:

1. Identify the top 3 machine learning methods being used
2. List the most studied disease areas
3. Identify the most commonly used data sources
4. Note emerging trends
5. Suggest future research directions

Save to results/trends_analysis.md
"

echo ""
echo "✅ Literature Review Complete!"
echo "Results saved to results/literature_search.md"
echo "Trends saved to results/trends_analysis.md"
