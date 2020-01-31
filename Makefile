# Search path
VPATH = data data-raw docs eda reports scripts

# Processed data files
DATA = city_boundary.rds city_evictions.rds joined.rds

# EDA studies
EDA = city_evictions.md

# Docs
DOCS = DATA_DICTIONARY.txt

# All targets
all : $(DATA) $(EDA) $(DOCS)

# Data dependencies
joined.rds : city_boundary.rds city_evictions.rds

# EDA study and report dependencies
city_evictions.md : city_evictions.rds

# Pattern rules
%.rds : %.R
	Rscript $<
%.md : %.Rmd
	Rscript -e 'rmarkdown::render(input = "$<", output_options = list(html_preview = FALSE))'
