# 🧬 Biology Skills Catalog

A comprehensive catalog of Claude Code skills useful for biology research, including built-in skills, custom skill templates, and usage examples.

---

## 📋 Built-in Skills Quick Reference

| Skill Name | Category | Key Biology Use Case |
|-----------|----------|---------------------|
| `systematic-literature-review` | 📚 Literature | Systematic reviews, meta-analyses |
| `academic-writing-polisher` | 📝 Writing | Manuscript polishing, grammar |
| `paper-write-sci` | 📝 Writing | Full manuscript drafting |
| `paper-select-journal` | 📝 Writing | Journal matching |
| `review-papers` | 📚 Literature | Pre-submission peer review |
| `paper-explain-figures` | 📊 Figures | Figure interpretation |
| `chem-vis` | 🔬 Chemistry | Molecular visualization |
| `thesis-review` | 📚 Literature | Thesis structure review |
| `code-review` | 💻 Development | Bioinfo code review |
| `simplify` | 💻 Development | Code refactoring |
| `deep-research` | 📚 Research | Multi-source research |
| `verify` | 💻 Development | Code validation |

---

## 🧪 Biology Skill Templates

### Template 1: RNA-seq Analysis Skill

```yaml
name: rna-seq-analysis
description: Complete RNA-seq differential expression analysis pipeline
triggers:
  - "rna-seq analysis"
  - "differential expression"
  - "run DESeq2"
steps:
  - "Quality control: FastQC on raw FASTQ files"
  - "Alignment: STAR or Hisat2 against reference genome"
  - "Count quantification: featureCounts or htseq-count"
  - "Differential expression: DESeq2 in R"
  - "Visualization: Volcano plot, heatmap, PCA"
  - "Functional enrichment: GO and KEGG analysis"
dependencies:
  - fastqc>=0.11.9
  - star>=2.7.10
  - subread>=2.0.3
  - r-deseq2>=1.38
  - r-ggplot2>=3.4
  - r-clusterprofiler>=4.6
```

### Template 2: ChIP-seq Analysis Skill

```yaml
name: chip-seq-analysis
description: ChIP-seq peak calling and motif analysis pipeline
triggers:
  - "chip-seq analysis"
  - "peak calling"
  - "motif analysis"
steps:
  - "Quality control: FastQC and ChIPQC"
  - "Alignment: Bowtie2 or BWA"
  - "Peak calling: MACS2"
  - "Peak annotation: ChIPseeker or HOMER"
  - "Motif discovery: MEME Suite"
  - "Visualization: IGV tracks, profile plots"
dependencies:
  - fastqc
  - bowtie2
  - macs2
  - r-chipseeker
  - meme
```

### Template 3: Protein Analysis Skill

```yaml
name: protein-analysis
description: Protein sequence-structure-function analysis
triggers:
  - "protein analysis"
  - "protein structure"
  - "protein function"
steps:
  - "Retrieve sequence from UniProt"
  - "Domain annotation with InterProScan"
  - "Structure prediction or fetch from PDB"
  - "Post-translational modification prediction"
  - "Protein-protein interaction network"
  - "Function enrichment analysis"
dependencies:
  - biopython
  - requests
  - matplotlib
  - biotite
```

---

## 🔧 Creating Custom Skills

### Method 1: Using `/skill-creator`

```bash
# In Claude Code interactive session
/skill-creator
# Follow the guided prompt to define your skill
```

### Method 2: Manual Creation

Skills are stored in `~/.claude/skills/`. Create a new skill:

```bash
mkdir -p ~/.claude/skills/my-biology-skill
touch ~/.claude/skills/my-biology-skill/main.md
```

### Method 3: From a Workflow

```bash
claude -p "Analyze my ChIP-seq pipeline script and create a reusable skill from it"
```

---

## 🎯 Skill Usage Examples

### Literature Review Mastery

```bash
# 1. Start a systematic literature review
/systematic-literature-review

# 2. Deep research on a specific topic
/deep-research "CRISPR base editing off-target effects 2024-2025"

# 3. Polish your findings
/academic-writing-polisher --file review_draft.md

# 4. Review your manuscript
/review-papers
```

### Code Quality for Bioinformatics

```bash
# 1. Review an analysis script
/code-review analysis_script.py

# 2. Simplify and optimize
/simplify analysis_script.py

# 3. Verify changes work
/verify
```

---

## 📊 Skill Performance Tips

1. **Be specific in triggers** — The more precise your trigger phrases, the better Claude recognizes when to activate skills
2. **Version all dependencies** — Biology software versions matter for reproducibility
3. **Document input/output formats** — Clearly state what file formats each step expects
4. **Test with small data first** — Validate your skill on a mini-dataset before full-scale analysis
5. **Share with collaborators** — Skills can be version-controlled and shared via Git
