#!/bin/bash
# RNA-seq Analysis Pipeline using Claude Code
# This script demonstrates how to automate RNA-seq analysis with Claude Code
#
# Usage: bash rna-seq-pipeline.sh
#
# Prerequisites:
# - Claude Code installed (npm install -g @anthropic-ai/claude-code)
# - FASTQ files in data/raw/ directory
# - Reference genome index available

set -e

echo "=========================================="
echo "🧬 RNA-seq Analysis Pipeline with Claude Code"
echo "=========================================="

# Step 1: Quality Control
echo ""
echo "📊 Step 1: Quality Control"
echo "---------------------------"

claude -p "Run FastQC on all FASTQ files in data/raw/ and save reports to data/qc/.
Then run MultiQC on the FastQC reports to create a combined report."

# Step 2: Alignment
echo ""
echo "🧬 Step 2: Alignment with STAR"
echo "-------------------------------"

claude -p "Align RNA-seq reads from data/raw/ to the GRCh38 reference genome using STAR.
Parameters:
- --outSAMtype BAM SortedByCoordinate
- --outFilterMultimapNmax 20
- --outFilterMismatchNmax 999
- --outFilterMismatchNoverLmax 0.04
- --twopassMode Basic

Output BAM files to data/aligned/.
Generate alignment statistics."

# Step 3: Quantification
echo ""
echo "📝 Step 3: Gene Quantification"
echo "-------------------------------"

claude -p "Run featureCounts on the BAM files in data/aligned/ to quantify gene-level counts.
Use the GRCh38 GTF annotation file.
Parameters:
- -t exon
- -g gene_id
- -s 2 (reverse stranded)
- -p (pair-end)

Save count matrix to data/counts/count_matrix.txt"

# Step 4: Differential Expression
echo ""
echo "🔬 Step 4: Differential Expression Analysis"
echo "--------------------------------------------"

claude -p "Perform differential expression analysis using DESeq2 in R.

Input: data/counts/count_matrix.txt
Design: The first 3 samples are control, last 3 are treatment.

Create the following outputs in results/:
1. deg_results.csv - Full results table
2. deg_significant.csv - Significant DEGs (padj < 0.05, |log2FC| > 1)
3. results/summary.txt - Analysis summary

Also create figures in figures/:
1. figures/volcano.pdf - Volcano plot
2. figures/heatmap.pdf - Heatmap of top 30 DEGs
3. figures/pca.pdf - PCA plot"

# Step 5: Functional Enrichment
echo ""
echo "🧪 Step 5: Functional Enrichment"
echo "---------------------------------"

claude -p "Perform GO and KEGG enrichment analysis on the significant DEGs from results/deg_significant.csv.
Use clusterProfiler in R with:
- Organism: Homo sapiens (org.Hs.eg.db)
- GO categories: BP, MF, CC
- KEGG pathway analysis
- pvalueCutoff: 0.05
- qvalueCutoff: 0.1

Save results to results/enrichment/"

# Step 6: Summary Report
echo ""
echo "📋 Step 6: Generate Summary Report"
echo "-----------------------------------"

claude -p "Create a comprehensive summary report of the RNA-seq analysis.

Include:
1. Sample information and sequencing stats
2. Alignment rates
3. Number of genes detected
4. DEG count (up/down regulated)
5. Top pathways enriched
6. Key biological insights

Save to results/final_report.md"

echo ""
echo "=========================================="
echo "✅ RNA-seq Pipeline Complete!"
echo "=========================================="
echo "Results are in the results/ directory"
echo "Figures are in the figures/ directory"
