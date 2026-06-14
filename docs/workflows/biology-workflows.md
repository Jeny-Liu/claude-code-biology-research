# 🧪 Biology Research Workflows with Claude Code

This guide provides ready-to-use workflow templates for common biology research tasks. Each workflow includes the exact prompts to use with Claude Code and expected outcomes.

---

## 📋 Workflow Index

1. [RNA-seq Analysis](#1-rna-seq-analysis)
2. [ChIP-seq Peak Calling](#2-chip-seq-peak-calling)
3. [Single-cell RNA-seq](#3-single-cell-rna-seq)
4. [Proteomics Analysis](#4-proteomics-analysis)
5. [Phylogenetic Analysis](#5-phylogenetic-analysis)
6. [Literature Review Automation](#6-literature-review-automation)
7. [Molecular Docking](#7-molecular-docking)
8. [CRISPR Design](#8-crispr-design)
9. [Metagenomics](#9-metagenomics)
10. [GWAS Analysis](#10-gwas-analysis)

---

## 1. RNA-seq Analysis

### Full Differential Expression Pipeline

**Prompt for Claude Code:**

```
I have RNA-seq FASTQ files from an Illumina NextSeq run studying 
drug response in melanoma cells. I have 3 control and 3 treated samples.

Files:
- control_1.fastq.gz, control_2.fastq.gz, control_3.fastq.gz
- treated_1.fastq.gz, treated_2.fastq.gz, treated_3.fastq.gz

Reference: Homo sapiens GRCh38

Please create and execute a complete RNA-seq pipeline:

Step 1: Quality Control
- Run FastQC on all samples
- Create a MultiQC report
- Trim adapters with Trimmomatic

Step 2: Alignment
- Index the reference genome with STAR
- Align reads to the reference
- Generate alignment statistics

Step 3: Quantification
- Count reads per gene using featureCounts
- Create a count matrix

Step 4: Differential Expression
- Run DESeq2 in R
- Identify DEGs (|log2FC| > 1, padj < 0.05)
- Output results table

Step 5: Visualization
- Volcano plot
- Heatmap of top 30 DEGs
- PCA plot
- MA plot

Step 6: Functional Analysis
- GO enrichment (biological process, molecular function, cellular component)
- KEGG pathway analysis
- GSEA analysis

Save all results to the 'results/' directory and all figures to 'figures/'.
Create a summary report at 'results/analysis_summary.md'.
```

### Expected Output Structure

```
results/
├── analysis_summary.md        # Full report
├── deg_results.csv            # All DEGs
├── deg_sig.csv                # Significant DEGs only
├── counts/
│   └── count_matrix.csv       # Raw counts
├── enrichment/
│   ├── go_bp.csv              # GO Biological Process
│   ├── go_mf.csv              # GO Molecular Function
│   ├── go_cc.csv              # GO Cellular Component
│   └── kegg.csv               # KEGG pathways
└── qc/
    ├── multiqc_report.html    # QC report
    └── alignment_stats.csv    # Alignment rates
figures/
├── volcano.pdf                # Volcano plot
├── heatmap_top30.pdf          # DEG heatmap
├── pca.pdf                    # PCA plot
├── ma_plot.pdf                # MA plot
└── enrichment_bar.pdf         # GO enrichment bar chart
```

---

## 2. ChIP-seq Peak Calling

### Transcription Factor ChIP-seq

**Prompt for Claude Code:**

```
I have ChIP-seq data for the transcription factor MYC in K562 cells.
I have 2 IP samples and 1 input control.

Files:
- MYC_rep1.fastq.gz, MYC_rep2.fastq.gz  (IP samples)
- input.fastq.gz                          (control)

Reference: hg38

Please run a ChIP-seq analysis pipeline:

1. QC with FastQC and trim adapters
2. Align with Bowtie2 (--very-sensitive)
3. Remove PCR duplicates with Picard
4. Call peaks with MACS2 (narrow peaks)
5. Annotate peaks with ChIPseeker
6. Find motifs with MEME-ChIP
7. Create browser tracks (bigWig)
8. Generate:
   - Peak density profile around TSS
   - Heatmap of signal at peak regions
   - Genomic annotation pie chart
   - Motif logos

Output format: BED narrowPeak files, motif PWMs, and publication-ready figures.
```

---

## 3. Single-cell RNA-seq

### 10X Genomics Data Analysis with ScanPy

**Prompt for Claude Code:**

```
I have 10X Genomics scRNA-seq data from a PBMC study.
The data is in the 'data/' directory with the standard 10X format
(barcodes.tsv, features.tsv, matrix.mtx).

Please perform a complete single-cell analysis using ScanPy (Python):

Step 1: Data Loading and QC
- Load the data with scanpy.read_10x_mtx()
- Calculate QC metrics (n_genes, n_counts, percent_mito)
- Filter cells: n_genes > 200, n_genes < 5000, percent_mito < 20%
- Filter genes: expressed in at least 3 cells

Step 2: Normalization and HVG Selection
- Normalize to 10,000 counts per cell
- Log-transform
- Identify top 2000 highly variable genes

Step 3: Dimensionality Reduction
- PCA (50 components)
- Compute neighborhood graph (n_neighbors=15)
- Run UMAP
- Run t-SNE

Step 4: Clustering
- Leiden clustering at multiple resolutions (0.5, 1.0, 1.5)
- Cluster stability assessment

Step 5: Marker Gene Identification
- Find markers for each cluster vs rest
- Find markers between specific clusters
- Output rank_genes_groups table

Step 6: Cell Type Annotation
- Use the PanglaoDB marker database
- Score each cluster for cell type markers
- Annotate clusters with cell type labels

Step 7: Visualization
- UMAP colored by cluster, cell type, QC metrics
- Dotplot of top markers per cluster
- Heatmap of top markers
- Violin plots of key genes

Step 8: Differential Analysis Between Conditions
If metadata includes condition information:
- Perform pseudobulk differential expression
- Identify condition-specific cell state changes

Save all results and generate a comprehensive HTML report.
```

---

## 4. Proteomics Analysis

### MaxQuant Output Analysis

**Prompt for Claude Code:**

```
I have MaxQuant output from a TMT-based proteomics experiment
comparing treated vs control cells. The key files are:
- proteinGroups.txt
- evidence.txt
- peptides.txt

Please perform a complete proteomics data analysis in R:

1. Data Import and Filtering
   - Load proteinGroups.txt
   - Filter for contaminant-free, reverse-free proteins
   - Filter for proteins quantified in at least 2/3 replicates in one condition

2. Normalization
   - Log2 transformation
   - Quantile normalization or median normalization
   - Check normalization with density plots

3. Statistical Analysis
   - Limma for differential protein expression
   - Multiple testing correction (Benjamini-Hochberg)
   - Cutoffs: |log2FC| > 0.58 (1.5-fold), adj.p < 0.05

4. Visualization
   - Volcano plot (highlight significant proteins)
   - Heatmap of significant proteins
   - PCA plot
   - Protein-protein interaction network (STRING)

5. Functional Enrichment
   - GO enrichment
   - KEGG pathway enrichment
   - Reactome pathway analysis

6. Output
   - Significant protein table with all stats
   - Enrichment results
   - Publication-quality figures
```

---

## 5. Phylogenetic Analysis

### Maximum Likelihood Phylogeny

**Prompt for Claude Code:**

```
I have aligned protein sequences of the COX1 gene from 20 mammalian species
in FASTA format (aligned_cox1.fasta).

Please build a phylogenetic tree:

1. Model Selection
   - Use ModelFinder or ProtTest to find best substitution model
   - Consider: LG, WAG, JTT, Dayhoff matrices
   - With gamma-distributed rate heterogeneity (+G) and invariant sites (+I)

2. Tree Construction
   - Maximum Likelihood with IQ-TREE or RAxML-NG
   - 1000 ultrafast bootstrap replicates
   - Also run Bayesian inference with MrBayes if software available

3. Tree Visualization
   - Root the tree with an appropriate outgroup
   - Create a publication-ready tree with:
     - Bootstrap support values shown
     - Color by taxonomic order
     - Scale bar for substitutions/site
   - Save as PDF and Newick format

4. Divergence Time Estimation (optional)
   - If fossil calibration points are available
   - Run MCMCTree or BEAST2
```

---

## 6. Literature Review Automation

### Multi-database Systematic Literature Review

**Prompt for Claude Code:**

```
Perform a systematic literature review on the following topic:

"The role of tumor microenvironment in immunotherapy resistance"

Use the systematic-literature-review skill and include:

1. Database Search
   - PubMed/PMC
   - bioRxiv (preprints)
   - CrossRef
   - Search terms: ("tumor microenvironment" OR "TME") AND 
     ("immunotherapy resistance" OR "immune checkpoint blockade resistance")
   - Year range: 2020-2025

2. Screening
   - Title/abstract screening
   - Inclusion criteria: original research, cancer immunotherapy focus
   - Exclusion criteria: reviews, case reports, non-English
   - Score relevance 1-10

3. Data Extraction
   For each included paper, extract:
   - Cancer type
   - Immunotherapy type (anti-PD-1, anti-CTLA-4, CAR-T, etc.)
   - Key TME components studied (immune cells, fibroblasts, ECM, etc.)
   - Resistance mechanism identified
   - Experimental models (in vitro, in vivo, clinical samples)
   - Key findings

4. Synthesis
   - PRISMA flow diagram
   - Summary table of included studies
   - Thematic analysis of resistance mechanisms
   - Identification of knowledge gaps
   - Future research directions

5. Output
   - Full structured review document (markdown)
   - Reference list in APA format
   - Summary figure/diagram of resistance mechanisms
```

---

## 7. Molecular Docking

### Virtual Screening Workflow

**Prompt for Claude Code:**

```
I want to perform molecular docking of a library of compounds 
against the SARS-CoV-2 main protease (Mpro, PDB: 6LU7).

Steps:

1. Protein Preparation
   - Download PDB structure 6LU7
   - Remove water molecules and heteroatoms
   - Add hydrogen atoms
   - Define the active site (from literature: H41 and C145)
   - Save as PDBQT format

2. Ligand Library Preparation
   - I have SMILES strings in 'compounds.smi'
   - Generate 3D conformations with RDKit or OpenBabel
   - Minimize energy
   - Save as PDBQT files

3. Docking (AutoDock Vina)
   - Set grid box covering the active site
   - Exhaustiveness: 24
   - Number of modes: 9
   - Run docking for all compounds

4. Analysis
   - Rank compounds by binding affinity (kcal/mol)
   - Visualize top 5 binding poses
   - Analyze protein-ligand interactions:
     - Hydrogen bonds
     - Hydrophobic contacts
     - Pi-stacking
   - Create 2D interaction diagrams

5. Output
   - Docking scores table
   - Binding pose images (top 5)
   - Interaction diagrams
   - Recommendations for experimental validation
```

---

## 8. CRISPR Design

### Guide RNA Design and Validation

**Prompt for Claude Code:**

```
I want to design CRISPR-Cas9 guide RNAs to knock out the human TP53 gene
(ENSG00000141510 or NC_000017.11, chr17:7,661,779-7,687,549).

Please design and validate gRNAs:

1. Gene Analysis
   - Retrieve TP53 gene structure (exons, CDS, UTRs)
   - Identify optimal targeting region (early constitutive exons)
   - Get DNA sequence of target exons

2. gRNA Design
   - Design gRNAs targeting exon 2-4 (constitutive exons)
   - Use 20bp guide sequence + NGG PAM
   - Rules:
     - GC content 40-80%
     - Avoid homopolymer runs (TTTT, GGGG)
     - Prefer guides in early coding exons

3. Off-target Analysis
   - For each gRNA, BLAST against human genome
   - Count potential off-targets (0-1-2-3 mismatches)
   - Use CFD or MIT specificity score

4. Primer Design
   - Design PCR primers for on-target validation
   - Amplicon size: 400-700 bp
   - T_m: 58-62°C
   - Check primer specificity with in silico PCR

5. Output
   - Top 5 gRNAs with scores and sequences
   - Off-target summary table
   - Cloning oligo sequences
   - Validation primer sequences
   - Suggested experimental workflow
```

---

## 9. Metagenomics

### 16S rRNA Microbiome Analysis

**Prompt for Claude Code:**

```
I have 16S rRNA amplicon sequencing data (V3-V4 region) 
from gut microbiome samples. I have 10 control and 10 treatment samples.

Files are in 'data/' directory as paired-end FASTQ files.

Please perform a complete microbiome analysis using QIIME2:

1. Import and Demultiplex
   - Import FASTQ into QIIME2 artifact
   - Summarize demultiplexing stats

2. Quality Control
   - Generate quality plots
   - Denoise with DADA2 (truncate at quality drop)
   - Generate feature table and representative sequences

3. Taxonomic Classification
   - Train classifier on SILVA 138 database (or GTDB)
   - Assign taxonomy to ASVs
   - Create taxonomic bar plots

4. Diversity Analysis
   - Alpha diversity: Shannon, Chao1, observed_features
   - Rarefaction curves
   - Beta diversity: UniFrac (weighted and unweighted), Bray-Curtis
   - PCoA and NMDS ordination
   - PERMANOVA statistical test

5. Differential Abundance
   - ANCOM-BC or DESeq2 for differential features
   - LEfSe analysis
   - Identify enriched taxa in each condition

6. Visualization
   - Taxonomy bar plots (phylum to genus level)
   - Alpha diversity box plots
   - Beta diversity PCoA plots
   - Heatmap of top abundant genera
   - Differential abundance volcano plot

7. Output
   - QIIME2 artifact files
   - Publication-quality figures
   - Summary statistics table
   - Results interpretation
```

---

## 10. GWAS Analysis

### Genome-Wide Association Study

**Prompt for Claude Code:**

```
I have genotype data (PLINK binary format) and phenotype data 
for a case-control study of type 2 diabetes:
- data/genotypes.{bed,bim,fam}
- data/phenotypes.txt

Sample size: 2000 cases, 2000 controls

Please perform a GWAS analysis:

1. Quality Control
   - Sample QC: call rate > 98%, heterozygosity filter
   - SNP QC: call rate > 98%, HWE p > 1e-6, MAF > 0.01
   - Sex check
   - Relatedness check (IBD)
   - Population stratification (PCA)

2. Association Testing
   - Logistic regression (additive model)
   - Include top 10 PCs as covariates
   - Genomic control (λ inflation factor)

3. Results Analysis
   - Manhattan plot
   - QQ plot
   - Identify genome-wide significant loci (p < 5e-8)
   - Clump significant SNPs to independent loci

4. Post-GWAS
   - Regional association plots for top loci
   - Annotation of significant SNPs (nearest gene, regulatory features)
   - Look up in GWAS Catalog
   - eQTL analysis (GTEx)
   - Tissue enrichment analysis

5. Output
   - GWAS summary statistics
   - QC report
   - Manhattan and QQ plots
   - Regional association plots
   - Significant loci table with annotations
```

---

## 📊 Workflow Comparison Table

| Workflow | Data Size | Compute | Time Estimate | Key Software |
|----------|-----------|---------|---------------|-------------|
| RNA-seq | 10-50 GB | High | 2-6 hours | STAR, DESeq2 |
| ChIP-seq | 5-20 GB | Medium | 1-3 hours | Bowtie2, MACS2 |
| scRNA-seq | 1-10 GB | High | 1-4 hours | ScanPy, Seurat |
| Proteomics | 10-100 MB | Low | 30 min | Limma, DEP |
| Phylogenetics | 1-10 MB | Medium | 1-24 hours | IQ-TREE, RAxML |
| Literature Review | N/A | Low | 10-30 min | MCP servers |
| Molecular Docking | 10-100 MB | High | 1-12 hours | AutoDock Vina |
| CRISPR Design | 1-10 MB | Low | 15 min | CRISPick, BLAST |
| Metagenomics | 5-30 GB | High | 2-8 hours | QIIME2, DADA2 |
| GWAS | 1-10 GB | Medium | 1-4 hours | PLINK, SAIGE |

---

## 🚀 Automating Workflows

### Using Claude Code's Agent Mode

For complex multi-step workflows, use Claude Code's built-in agent mode:

```bash
# Start an interactive session
claude

# The agent will autonomously:
# 1. Parse your request
# 2. Execute steps in order
# 3. Handle errors and adjust
# 4. Request user input when needed
# 5. Present complete results
```

### Creating Reusable Workflow Scripts

```bash
#!/bin/bash
# run-rna-seq.sh - Automated RNA-seq analysis wrapper

# Step 1: Quality Control
claude -p "Run FastQC on all FASTQ files in data/raw/ and save to data/qc/"

# Step 2: Alignment
claude -p "Align reads to GRCh38 using STAR. Input: data/raw/*.fastq.gz. Output: data/aligned/"

# Step 3: Quantification
claude -p "Run featureCounts on BAM files in data/aligned/ using GRCh38 annotation"

# Step 4: Differential Expression
claude -p "Run DESeq2 analysis on count matrix from featureCounts. Design: ~condition"

# Step 5: Results
claude -p "Create a summary report of the RNA-seq analysis in results/summary.md"
```
