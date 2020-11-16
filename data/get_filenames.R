setwd("~/Projects/shedd_corals_ITS2/")

filenames <- list.files(recursive = TRUE, include.dirs = FALSE, full.names = FALSE)
filenames <- basename(filenames)

library(stringr)
sample <- str_split_fixed(filenames, pattern = "_", 2)[, 1]

library(tidyverse)

res <- bind_cols(sample = sample, filename = filenames) %>%
  mutate(read = str_extract(filename, "R.")) %>%
  pivot_wider(id_cols = sample, names_from = read, values_from = filename)

write_tsv(res, path = "sample_filenames.tsv")
