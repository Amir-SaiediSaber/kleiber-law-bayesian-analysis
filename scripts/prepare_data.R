args <- commandArgs(trailingOnly = TRUE)

input_path <- if (length(args) >= 1) args[[1]] else "data/raw/observations.csv"
output_path <- if (length(args) >= 2) args[[2]] else "data/animaltraits_bmr.csv"

required_columns <- c(
  "species",
  "class",
  "body mass",
  "metabolic rate",
  "metabolic rate - method"
)

raw <- read.csv(input_path, check.names = FALSE, stringsAsFactors = FALSE)
missing_columns <- setdiff(required_columns, names(raw))
if (length(missing_columns) > 0) {
  stop("Missing required columns: ", paste(missing_columns, collapse = ", "))
}

method <- raw[["metabolic rate - method"]]
selected <-
  !is.na(method) &
  trimws(method) == "basal metabolic rate" &
  !is.na(raw[["body mass"]]) &
  !is.na(raw[["metabolic rate"]])

dat <- data.frame(
  species = raw$species[selected],
  taxon_group = raw$class[selected],
  body_mass_kg = raw[["body mass"]][selected],
  metabolic_rate_W = raw[["metabolic rate"]][selected],
  stringsAsFactors = FALSE
)

dat <- dat[
  dat$taxon_group %in% c("Aves", "Mammalia") &
    dat$body_mass_kg > 0 &
    dat$metabolic_rate_W > 0,
]

dir.create(dirname(output_path), recursive = TRUE, showWarnings = FALSE)
write.csv(dat, output_path, row.names = FALSE)

cat("Wrote", nrow(dat), "records to", output_path, "\n")
print(table(dat$taxon_group))
