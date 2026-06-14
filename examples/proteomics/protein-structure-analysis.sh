#!/bin/bash
# Protein Structure Analysis using Claude Code
# Demonstrates how to retrieve and analyze protein structures
#
# Usage: bash protein-structure-analysis.sh

set -e

echo "=========================================="
echo "🔬 Protein Structure Analysis with Claude Code"
echo "=========================================="

PROTEIN="P04637"  # Human TP53

echo ""
echo "🔍 Analyzing protein: $PROTEIN (Human TP53)"
echo "============================================"

claude -p "
Using the UniProt MCP server and PDB databases:

1. Fetch the complete UniProt entry for $PROTEIN (human TP53)
   - Extract: function, domain architecture, sequence length, subcellular location
   - List all post-translational modifications

2. Find all available PDB structures for TP53
   - List them by resolution (best first)
   - Identify which domain each structure covers
   - Note the experimental method (X-ray, Cryo-EM, NMR)

3. For the best resolution full-length structure:
   - Download the PDB file
   - Analyze secondary structure content
   - Identify ligand binding sites

4. Retrieve AlphaFold2 prediction if available

5. Map known cancer-associated mutations to the 3D structure
   - Focus on the DNA-binding domain (residues 102-292)
   - Highlight hotspot residues (R175, G245, R248, R249, R273, R282)

Save all results to results/tp53_analysis/
Create a summary report at results/tp53_analysis/summary.md
Include PyMOL visualization script for the structure.
"
