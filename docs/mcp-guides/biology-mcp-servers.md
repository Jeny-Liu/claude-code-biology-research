# 🔌 Biology MCP Server Reference

Complete reference for all biology-related MCP (Model Context Protocol) servers compatible with Claude Code.

---

## 📋 Quick Comparison

| Server | Data Type | API Required | Installation | Key Use |
|--------|-----------|-------------|--------------|---------|
| NCBI/BLAST | Sequences, genomes | NCBI API key | `uvx ncbi-mcp-server` | Sequence search & alignment |
| UniProt/PDB | Proteins, structures | None | `uvx uniprot-mcp-server` | Protein data retrieval |
| PubMed | Literature | NCBI API key | `npx -y pubmed-mcp-server` | Paper search & retrieval |
| BioPython | Computation | None | `uvx biopython-mcp-server` | Sequence manipulation |
| R/Bioconductor | Statistics | None | `uvx r-bioc-mcp-server` | Omics analysis |
| GEO/SRA | Expression data | NCBI API key | `uvx geo-mcp-server` | Dataset discovery |
| Cheminformatics | Chemistry | None | `uvx cheminformatics-mcp-server` | Molecular analysis |

---

## 🧬 NCBI/BLAST MCP Server

### Installation

```bash
# Install with uvx (recommended)
uvx ncbi-mcp-server

# Or install with pip
pip install ncbi-mcp-server
```

### Configuration

```json
{
  "mcpServers": {
    "ncbi-biology": {
      "command": "uvx",
      "args": ["ncbi-mcp-server"],
      "env": {
        "NCBI_API_KEY": "${NCBI_API_KEY}",
        "EMAIL": "${EMAIL}"
      }
    }
  }
}
```

### API Reference

| Function | Parameters | Returns |
|----------|-----------|---------|
| `search_nucleotide` | query: str, max_results: int (default 20), database: str | List of sequence records |
| `search_protein` | query: str, max_results: int (default 20) | List of protein records |
| `run_blast` | sequence: str, program: str, database: str | BLAST alignment results |
| `fetch_genbank` | accession: str | GenBank record in text format |
| `fetch_fasta` | accession: str | FASTA sequence |
| `search_pubmed` | query: str, max_results: int (default 20) | PubMed article summaries |
| `search_geo` | query: str, max_results: int (default 10) | GEO dataset information |
| `get_taxonomy` | taxon_id: int | Taxonomic lineage |
| `cross_reference` | accession: str, database: str | Cross-database links |

### Usage Examples

```
# In Claude Code:
Search NCBI nucleotide database for "BRCA1 human" and fetch the sequences
Run BLAST on this sequence: ATGCGTACGATCGATCG
Find GEO datasets related to "breast cancer RNA-seq"
```

---

## 🔬 UniProt/PDB MCP Server

### Installation

```bash
uvx uniprot-mcp-server
```

### Configuration

```json
{
  "mcpServers": {
    "uniprot-pdb": {
      "command": "uvx",
      "args": ["uniprot-mcp-server"]
    }
  }
}
```

### API Reference

| Function | Parameters | Returns |
|----------|-----------|---------|
| `search_uniprot` | query: str, max_results: int (default 20) | UniProtKB entries |
| `get_protein` | accession: str | Complete protein entry |
| `fetch_pdb` | pdb_id: str | PDB structure file |
| `search_pdb` | query: str, max_results: int | PDB entries |
| `get_alphafold` | uniprot_id: str | AlphaFold structure URL |
| `get_protein_features` | accession: str | Feature annotations |
| `search_by_sequence` | sequence: str | Sequence similarity results |
| `get_go_annotations` | accession: str | GO annotations |
| `get_interactions` | accession: str | Protein interaction data |

### Usage Examples

```
# In Claude Code:
Fetch the UniProt entry for human p53 (P04637)
Search PDB for COVID-19 spike protein structures
Get AlphaFold prediction for BRCA1
```

---

## 📚 PubMed MCP Server

### Installation

```bash
npx -y pubmed-mcp-server
```

### Configuration

```json
{
  "mcpServers": {
    "pubmed-mcp": {
      "command": "npx",
      "args": ["-y", "pubmed-mcp-server"],
      "env": {
        "NCBI_API_KEY": "${NCBI_API_KEY}"
      }
    }
  }
}
```

### API Reference

| Function | Parameters | Returns |
|----------|-----------|---------|
| `search_pubmed` | query: str, max_results: int, sort: str | Article list |
| `fetch_article` | pmid: int | Article metadata & abstract |
| `fetch_pmc` | pmcid: str | PMC full text |
| `get_citations` | pmid: int | Citation count and list |
| `find_related` | pmid: int | Similar articles |
| `search_with_filters` | author, journal, year, mesh_terms | Filtered results |
| `get_author_network` | author_name: str | Author collaboration data |

### Usage Examples

```
# In Claude Code:
Search PubMed for "single-cell RNA-seq pancreatic cancer 2024"
Find articles by "Collins FS" in Nature from 2023-2024
Get all papers citing PMID: 30429548
```

---

## 🐍 BioPython MCP Server

### Installation

```bash
uvx biopython-mcp-server
```

### Configuration

```json
{
  "mcpServers": {
    "biopython-mcp": {
      "command": "uvx",
      "args": ["biopython-mcp-server"]
    }
  }
}
```

### API Reference

| Function | Parameters | Returns |
|----------|-----------|---------|
| `parse_sequence` | file: str, format: str | Parsed sequence object |
| `translate_dna` | sequence: str, table: int | Protein translation |
| `reverse_complement` | sequence: str | Reverse complemented sequence |
| `align_sequences` | sequences: list, method: str | Multiple sequence alignment |
| `calculate_gc_content` | sequence: str | GC content percentage |
| `phylogenetic_tree` | alignment: str, method: str | Newick tree string |
| `blast_sequence` | sequence: str, database: str | BLAST results |
| `find_orfs` | sequence: str, min_length: int | Open reading frames |
| `parse_genbank` | file: str | GenBank feature table |
| `convert_format` | input_file, input_format, output_format | Converted sequence file |

### Usage Examples

```
# In Claude Code:
Parse this GenBank file and extract all CDS features
Find ORFs in this DNA sequence: ATGCCCTGA...
Calculate GC content for the human genome chr1
```

---

## 📊 R/Bioconductor MCP Server

### Installation

```bash
uvx r-bioc-mcp-server
```

### Configuration

```json
{
  "mcpServers": {
    "r-bioconductor": {
      "command": "uvx",
      "args": ["r-bioc-mcp-server"]
    }
  }
}
```

### API Reference

| Function | Parameters | Returns |
|----------|-----------|---------|
| `run_deseq2` | counts, coldata, design | DEG results table |
| `run_limma` | expression, design, contrasts | Differential expression |
| `run_enrichment` | genelist, ontology, organism | Enrichment results |
| `run_clustering` | data, method, k | Cluster assignments |
| `plot_volcano` | results, pval_cutoff, fc_cutoff | Volcano plot SVG |
| `plot_heatmap` | data, annotation, genes | Heatmap SVG |
| `run_pca` | data, groups, n_components | PCA coordinates and plot |
| `run_gsva` | expression, gene_sets | Pathway activity scores |
| `plot_ma` | results | MA plot SVG |

### Usage Examples

```
# In Claude Code:
Run DESeq2 on this count matrix with control vs treatment design
Perform GO enrichment on these upregulated genes
Create a publication-ready heatmap of the top 50 DEGs
```

---

## 🔗 GEO/SRA MCP Server

### Installation

```bash
uvx geo-mcp-server
```

### Configuration

```json
{
  "mcpServers": {
    "geo-sra": {
      "command": "uvx",
      "args": ["geo-mcp-server"],
      "env": {
        "NCBI_API_KEY": "${NCBI_API_KEY}"
      }
    }
  }
}
```

### API Reference

| Function | Parameters | Returns |
|----------|-----------|---------|
| `search_geo` | query: str, max_results: int | GEO dataset list |
| `fetch_geo_series` | gse_id: str | Series metadata and samples |
| `fetch_geo_platform` | gpl_id: str | Platform annotation |
| `get_sra_runs` | accession: str | SRA run accessions |
| `download_metadata` | gse_id: str | Sample metadata table |
| `search_datasets` | keyword, organism, study_type | Filtered results |
| `get_series_matrix` | gse_id: str | Expression matrix |

### Usage Examples

```
# In Claude Code:
Find RNA-seq datasets for Alzheimer's disease
Download metadata for GSE123456
Get SRA run accessions for all samples in this study
```

---

## 🧪 Cheminformatics MCP Server

### Installation

```bash
uvx cheminformatics-mcp-server
```

### Configuration

```json
{
  "mcpServers": {
    "cheminfo": {
      "command": "uvx",
      "args": ["cheminformatics-mcp-server"]
    }
  }
}
```

### API Reference

| Function | Parameters | Returns |
|----------|-----------|---------|
| `smiles_to_structure` | smiles: str | Molecular structure (SVG) |
| `calculate_properties` | smiles: str | LogP, MW, HBA, HBD, etc. |
| `search_pubchem` | query: str | PubChem compound list |
| `search_chembl` | target: str | Bioactivity data |
| `dock_molecule` | receptor: str, ligand: str | Docking scores |
| `fingerprint_similarity` | smiles1, smiles2 | Tanimoto coefficient |
| `ro5_analysis` | smiles: str | Lipinski rule-of-5 |
| `substructure_search` | smiles, pattern | Substructure matching |

---

## ⚙️ Combined Configuration

### Complete Biology MCP Configuration

Save as `~/.claude/settings.json`:

```json
{
  "mcpServers": {
    "ncbi-biology": {
      "command": "uvx",
      "args": ["ncbi-mcp-server"],
      "env": {
        "NCBI_API_KEY": "${NCBI_API_KEY}",
        "EMAIL": "${EMAIL}"
      }
    },
    "pubmed-mcp": {
      "command": "npx",
      "args": ["-y", "pubmed-mcp-server"],
      "env": {
        "NCBI_API_KEY": "${NCBI_API_KEY}"
      }
    },
    "uniprot-pdb": {
      "command": "uvx",
      "args": ["uniprot-mcp-server"]
    },
    "biopython-mcp": {
      "command": "uvx",
      "args": ["biopython-mcp-server"]
    },
    "r-bioconductor": {
      "command": "uvx",
      "args": ["r-bioc-mcp-server"]
    },
    "geo-sra": {
      "command": "uvx",
      "args": ["geo-mcp-server"],
      "env": {
        "NCBI_API_KEY": "${NCBI_API_KEY}"
      }
    },
    "cheminfo": {
      "command": "uvx",
      "args": ["cheminformatics-mcp-server"]
    }
  }
}
```

### Environment Variables (.env)

```bash
# File: ~/.claude/.env
NCBI_API_KEY=your_ncbi_key_here
EMAIL=your.email@institution.edu
```

---

## 🔐 Getting API Keys

### NCBI API Key

1. Go to [https://www.ncbi.nlm.nih.gov/account/](https://www.ncbi.nlm.nih.gov/account/)
2. Create or log into your NCBI account
3. Navigate to Account Settings → API Key Management
4. Generate a new API key
5. Copy the key (starts with usually with a series of alphanumeric characters)

### Why You Need It

| Without API Key | With API Key |
|----------------|--------------|
| 3 requests/second | 10 requests/second |
| No access to some tools | Full API access |
| Frequent rate limiting | Rare rate limiting |

---

## 🛠️ Troubleshooting

### Common Issues

| Issue | Solution |
|-------|----------|
| MCP server not found | Ensure `uvx` or `npx` is installed: `pip install uvx` or `npm install -g npx` |
| NCBI API rate limiting | Add `NCBI_API_KEY` to environment; without it, only 3 req/s |
| Proxy connection errors | Set `HTTP_PROXY` and `HTTPS_PROXY` environment variables |
| Python module not found | Install with `pip install <module-name>` or use `uvx` which auto-installs |
| MCP server crashes | Check Claude Code version: `claude --version` (needs latest) |

### Verifying MCP Connection

```bash
# Start Claude Code and check MCP servers
claude

# In the interactive session, type:
"List all available MCP tools and their descriptions"
```
