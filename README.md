# Benchmarking AI’s Deliberative Reasoning: Evaluating LLMs Against Human Collective Wisdom  

**Authors:** Francesco Veri, Gustavo Umbelino  
**Last Updated:** August 28, 2025  

This repository contains the code and data for the project *Benchmarking AI’s Deliberative Reasoning: Evaluating LLMs Against Human Collective Wisdom*. The project evaluates the deliberative reasoning capabilities of large language models (LLMs) and compares their outputs against human collective wisdom.  

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

---

## Case Studies  

The project evaluates 24 deliberation cases. Below is a summary table:  

| Case   | Topic                  | N  | N Considerations | N Preferences | Mean Human DRI |
|--------|------------------------|----|------------------|---------------|----------------|
| Case 1 | Climate Change         | 16 | 33               | 7             | 0.09           |
| Case 2 | Immigration            | 26 | 42               | 7             | 0.572          |
| Case 3 | Climate Change         | 16 | 43               | 7             | 0.233          |
| Case 4 | Climate Change         | 8  | 32               | 6             | 0.642          |
| Case 5 | Healthcare             | 56 | 16               | 7             | 0.198          |
| Case 6 | Climate Change         | 31 | 33               | 9             | 0.636          |
| Case 7 | Energy                 | 12 | 45               | 9             | 0.433          |
| Case 8 | Energy                 | 17 | 45               | 5             | 0.428          |
| Case 9 | Constitutional Reform  | 45 | 48               | 5             | -0.015         |
| Case 10| Transportation         | 11 | 42               | 7             | 0.498          |
| Case 11| Climate Change         | 9  | 45               | 7             | 0.534          |
| Case 12| Climate Change         | 11 | 45               | 6             | 0.455          |
| Case 13| Transportation         | 41 | 36               | 8             | 0.27           |
| Case 14| Human Genome Editing   | 23 | 45               | 7             | 0.355          |
| Case 15| Bio Ethics             | 17 | 38               | 7             | 0.28           |
| Case 16| Immigration            | 22 | 42               | 7             | 0.436          |
| Case 17| Climate Change         | 14 | 31               | 7             | -0.102         |
| Case 18| Bio Ethics             | 17 | 38               | 7             | 0.321          |
| Case 19| Climate Change         | 15 | 31               | 4             | 0.495          |
| Case 20| Government Planning    | 16 | 36               | 7             | 0.306          |
| Case 21| Bio Ethics             | 9  | 49               | 7             | 0.411          |
| Case 22| Bio Ethics             | 15 | 49               | 6             | 0.208          |
| Case 23| Climate Change         | 16 | 30               | 7             | 0.52           |
| Case 24| Mental Health          | 63 | 20               | 7             | 0.502          |

---

## Citation  

If you use this repository in your work, please cite the authors:  

**Francesco Veri, Gustavo Umbelino** – *Benchmarking AI’s Deliberative Reasoning: Evaluating LLMs Against Human Collective Wisdom*  
