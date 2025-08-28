# Benchmarking AI’s Deliberative Reasoning: Evaluating LLMs Against Human Collective Wisdom

**Authors:** Francesco Veri, Gustavo Umbelino  
**Last Updated:** August 28, 2025

This repository contains the code and data for the project _Benchmarking AI’s Deliberative Reasoning: Evaluating LLMs Against Human Collective Wisdom_. The project evaluates the deliberative reasoning capabilities of large language models (LLMs) and compares their outputs against human collective wisdom.

---

## Repository Structure

- **`analysis.Rmd`** – Main analysis file (R Markdown).
- **`01_select_llm_data.R`** – Script to select the LLM data used in the analysis.
- **`02_check_consistency.R`** – Script to generate internal consistency data using Cronbach's alpha.
- **`data/`** – All project data.
  - **`data/raw_llm_data/`** – Full raw LLM data, including all requests and responses.
    - Each directory contains a `request_log.csv` file with the raw requests.
- **`output/plots/`** – Contains all generated plots.

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

2. Preprocess the LLM data:

   ```R
   source("01_select_llm_data.R")
   ```

3. Check internal consistency using Cronbach's alpha:

   ```R
   source("02_check_consistency.R")
   ```

4. Open `analysis.Rmd` in RStudio (or another R environment).

5. Knit the file (`Knit` button in RStudio) or run all chunks to reproduce the analysis.

---

## Data

- Processed data for analysis is included in the `data/` directory.
- Full raw LLM interaction data (requests and responses) can be found in `data/raw_llm_data/`.
  - Each subdirectory contains a `request_log.csv` with all raw requests.

---

## Outputs

- Plots generated during the analysis are saved in the `output/plots/` directory.
