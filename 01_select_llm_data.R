library(readr)
library(dplyr)
library(knitr)

# input data files
LLM_DATA_FILE <- "data/llm_data.csv"
MODELS_FILE <- "data/included_models.csv"

# output data files
LLM_DATA_CLEAN_FILE <- "data/llm_data_clean.csv"

if (file.exists(LLM_DATA_CLEAN_FILE)) {
  stop(paste("File", LLM_DATA_CLEAN_FILE, "already exists.",
      "Please delete file to regenerate it."))
}

# load included models
included_models <- read_csv(MODELS_FILE, show_col_types = FALSE)

# load llm data
llm_data <- read_csv(LLM_DATA_FILE, show_col_types = FALSE)

# select up to 5 iterations of included models' data for each survey
# also include models where temperature == 1
llm_data_clean <- llm_data %>%
  filter(model %in% included_models$model) %>%
  group_by(model, survey) %>%
  slice_head(n = 5)

# write file 
write_csv(llm_data_clean, LLM_DATA_CLEAN_FILE)

# print summary
nrow(llm_data_clean)

# number of models
length(unique(llm_data_clean$model))

# number of surveys
length(unique(llm_data_clean$survey))

# number of min/max iterations per model
llm_data_clean %>%
  group_by(model, survey) %>%
  summarise(n = n()) %>%
  group_by(model) %>%
  summarise(
    min_iterations = min(n),
    max_iterations = max(n),
  ) %>% 
  arrange(min_iterations) %>%
  kable(row.names = TRUE)



