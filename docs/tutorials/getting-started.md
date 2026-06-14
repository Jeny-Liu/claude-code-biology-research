# 🚀 Getting Started with Claude Code for Biology

A step-by-step tutorial for biology researchers new to Claude Code.

---

## ⏱️ Estimated Time: 30 minutes

## 📋 Prerequisites
- Node.js 18+ installed
- Anthropic API key
- Terminal basics (navigating directories, running commands)

---

## Step 1: Installation

```bash
# Install Claude Code globally
npm install -g @anthropic-ai/claude-code

# Verify installation
claude --version
```

**Expected output:**
```
@anthropic-ai/claude-code/0.x.x
```

---

## Step 2: Authentication

```bash
# Set your API key
export ANTHROPIC_API_KEY="sk-ant-your-key-here"

# Make it permanent
echo 'ANTHROPIC_API_KEY="sk-ant-your-key-here"' >> ~/.claude/.env
```

---

## Step 3: Your First Biology Session

Start Claude Code in interactive mode:

```bash
claude
```

You'll see the Claude Code prompt. Let's try some biology tasks:

### Task 1: Sequence Analysis

```
Write a Python script that:
1. Takes a DNA sequence: ATGCGTACGATCGATCGATCGATCG
2. Calculates GC content
3. Finds reverse complement
4. Translates to protein sequence
5. Saves results to sequence_analysis.txt

Run the script and show me the results.
```

### Task 2: PubMed Search

```
Search PubMed for "CRISPR-Cas9 gene therapy clinical trial 2024"
and summarize the top 3 papers.
```

### Task 3: Data Visualization

```
Create a simple visualization script that plots a sine wave 
with labeled axes and a title. Save it as test_plot.pdf.
```

---

## Step 4: Configure MCP Servers

Create your global MCP configuration:

```bash
mkdir -p ~/.claude
```

**~/.claude/settings.json:**

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
    }
  }
}
```

Set environment variables:

```bash
export NCBI_API_KEY="your_ncbi_key"
export EMAIL="your.email@institution.edu"
```

---

## Step 5: Test MCP Integration

Restart Claude Code and test:

```
Search the NCBI nucleotide database for "BRCA1 human" and fetch the top result.
```

---

## Step 6: Complete a Mini Project

Create a project directory and run a mini RNA-seq workflow:

```bash
mkdir -p my-first-rnaseq-project/{data,scripts,results}
cd my-first-rnaseq-project
claude
```

In Claude Code:

```
I want to simulate a mini RNA-seq analysis:
1. Create a simulated count matrix with 100 genes and 6 samples
   (3 control, 3 treatment) using Python
2. Perform a simple differential expression analysis
3. Create a volcano plot
4. Save everything to the results/ directory
```

---

## 🎉 Congratulations!

You've successfully:
- ✅ Installed Claude Code
- ✅ Run your first biology analysis
- ✅ Configured MCP servers
- ✅ Completed a mini project

### Next Steps

- Explore the [Biology Skills Catalog](../skills/biology-skills-catalog.md)
- Try the [Biology Workflows](../workflows/biology-workflows.md)
- Read the [MCP Server Guide](../mcp-guides/biology-mcp-servers.md)
- Join the [Anthropic Discord](https://discord.gg/anthropic) for community help

---

## ❓ Troubleshooting

| Problem | Solution |
|---------|----------|
| `command not found: claude` | Ensure npm global bin is in PATH: `export PATH=$(npm bin -g):$PATH` |
| API key errors | Check `ANTHROPIC_API_KEY` is set correctly |
| Proxy errors | Set `HTTP_PROXY` and `HTTPS_PROXY` |
| MCP server fails | Check `uvx` is installed: `pip install uvx` |
| Slow responses | Use `/fast` mode for quick tasks |
