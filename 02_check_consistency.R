library(readr)
library(dplyr)
library(psych)
library(knitr)
library(rstatix)

# input data files
LLM_DATA_FILE <- "data/llm_data_clean.csv"

# output data files
CONSISTENCY_RESULTS_FILE <- "data/consistency_results.csv"

if (file.exists(CONSISTENCY_RESULTS_FILE)) {
  stop(paste("File", CONSISTENCY_RESULTS_FILE, "already exists.",
             "Please delete file to regenerate it."))
}

# load llm data
llm_data <- read_csv(LLM_DATA_FILE, show_col_types = FALSE)

# Initialize an empty list to store the alpha results
consistency_results <- list()

models_with_data <- llm_data %>%
  distinct(provider, model) 

# Iterate over each unique provider/model combination
for (row in 1:nrow(models_with_data)) {
  provider <- models_with_data[row, ]$provider
  model <- models_with_data[row, ]$model
  
  # filter the data for the current provider/model
  provider_model_data <- llm_data %>%
    filter(model == !!model)
  
  # iterate over each survey
  for (survey_name in unique(provider_model_data$survey)) {
    
    # filter the data for the current survey
    survey_data <- provider_model_data %>%
      filter(survey == !!survey_name)

    # Calculate Cronbach's Alpha for considerations (C1..C50)
    considerations_data <- survey_data %>% select(C1:C50)
    
    if (nrow(considerations_data) > 1) {
      
      # Check if policies are all equal (no variance)
      # this can happen when there are few iterations
      c_all_equal <- all(apply(considerations_data, 1, function(row)
        all(row == considerations_data[1, ], na.rm = TRUE)), na.rm = TRUE)
      
      # TODO: FIXME! 
      # NOTE: assign alpha = 1, which should NOT exist!
      # if (c_all_equal) {
      #   alpha_considerations <- 1
      # } else {
      alpha_considerations <- psych::alpha(
        considerations_data,
        check.keys = TRUE,
        warnings = FALSE,
      )$total$raw_alpha
      # }
    } else {
      alpha_considerations <- NA
    }
    
    # Calculate Cronbach's Alpha for policies (P1..P10)
    policies_data <- survey_data %>% select(P1:P10)
    
    if (nrow(policies_data) > 1) {
      
      # Check if policies are all equal (no variance)
      # this can happen when there are few iterations
      p_all_equal <- all(apply(policies_data, 1, function(row)
        all(row == policies_data[1, ], na.rm = TRUE)), na.rm = TRUE)
      
      # NOTE: assign alpha = 1, which should NOT exist!
      if (p_all_equal) {
         alpha_policies <- 1
      }
      
      # normal case, calculate alpha
      else {
        alpha_policies <- psych::alpha(
          policies_data,
          check.keys = TRUE,
          warnings = FALSE,
        )$total$raw_alpha
      }
    } else {
      alpha_policies <- NA
    }
    
    if (nrow(policies_data) > 1 && nrow(considerations_data) > 1) {
      all_data <- cbind(considerations_data, policies_data)
      alpha_all <- psych::alpha(
        all_data,
        check.keys = TRUE,
        warnings = FALSE,
      )$total$raw_alpha
    } else {
      alpha_all <- NA
    }
    
    
    # Store the results in the list
    consistency_results[[length(consistency_results) + 1]] <- tibble(
      provider = provider,
      model = model,
      survey = survey_name,
      N = nrow(considerations_data),
      alpha_considerations = alpha_considerations,
      alpha_policies = alpha_policies,
      alpha_all = alpha_all
    )
  }
}

# Combine all results into a single data frame
consistency_results <- bind_rows(consistency_results)

rm(models_with_data)
rm(considerations_data)
rm(survey_data)
rm(policies_data)
rm(provider_model_data)

# write summary to file
write_csv(consistency_results, CONSISTENCY_RESULTS_FILE)


# Aggregate consistency_results by model and calculate summary statistics
alpha_summary <- consistency_results %>%
  group_by(provider, model) %>%
  summarise(
    N = sum(N),
    mean_alpha_all = mean(alpha_all, na.rm = TRUE),
    std_alpha_all = sd(alpha_policies, na.rm = TRUE),
    min_alpha_considerations = min(alpha_considerations, na.rm = TRUE),
    max_alpha_considerations = max(alpha_considerations, na.rm = TRUE),
    mean_alpha_considerations = mean(alpha_considerations, na.rm = TRUE),
    std_alpha_considerations = sd(alpha_considerations, na.rm = TRUE),
    min_alpha_policies = min(alpha_policies, na.rm = TRUE),
    max_alpha_policies = max(alpha_policies, na.rm = TRUE),
    mean_alpha_policies = mean(alpha_policies, na.rm = TRUE),
    std_alpha_policies = sd(alpha_policies, na.rm = TRUE),
    .groups = "drop"
  )

get_summary_stats(consistency_results, type="robust")

alpha_summary %>%
  mutate(considerations = round(mean_alpha_considerations,2),
         policies = round(mean_alpha_policies,2),
         all = round(mean_alpha_all, 2)) %>%
  select(provider, model, N, all, considerations, policies) %>%
  arrange(all) %>%
  kable(caption = "Alpha summary across models, mean across surveys", row.names = TRUE)
