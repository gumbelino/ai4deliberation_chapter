# Benchmarking AI’s Deliberative Reasoning: Evaluating LLMs Against Human Collective Wisdom  

**Authors:** Francesco Veri, Gustavo Umbelino  
**Last Updated:** August 28, 2025  

This repository contains the code and data for the project *Benchmarking AI’s Deliberative Reasoning: Evaluating LLMs Against Human Collective Wisdom*. The project evaluates the deliberative reasoning capabilities of large language models (LLMs) and compares their outputs against human collective wisdom.  

---

## Repository Structure  

- **`analysis.Rmd`** – Main analysis file (R Markdown).  
- **`data/`** – All project data.  
  - **`data/raw_llm_data/`** – Full raw LLM data, including all requests and responses.  

---

## Requirements  

- **R version 4.4.2** or later  

We recommend using [RStudio](https://posit.co/download/rstudio-desktop/) for running the `.Rmd` file.  

---

## Running the Project  

1. Clone this repository:  
   ```bash
   git clone https://github.com/gumbelino/ai4deliberation_chapter.git
   cd ai4deliberation_chapter
   ```  

2. Open `analysis.Rmd` in RStudio (or another R environment).  

3. Knit the file (`Knit` button in RStudio) or run all chunks to reproduce the analysis.  

---

## Data  

- Processed data for analysis is included in the `data/` directory.  
- Full raw LLM interaction data (requests and responses) can be found in `data/raw_llm_data/`.  
