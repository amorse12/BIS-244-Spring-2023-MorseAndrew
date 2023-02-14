### read us-states csv into df
df <- read.csv("/Users/drewmorse/Git Kraken /Intro-to-R-2ed/BIS-244-Spring-2023-MorseAndrew/covid-19-data/us-states.csv")
### use dplry for onky PA
library(dplyr)
df_filt <- df %>% filter(state == "Pennsylvania")

### new var incr_cases and incr_deaths == change in cases and deaths
df_filt <- df_filt %>% mutate(incr_cases = c(NA, diff(cases)))
df_filt <- df_filt %>% mutate(incr_deaths = c(NA, diff(deaths)))                     

##head(df_filt, 100)

sd_cases <- sd(df_filt$incr_cases, na.rm=TRUE)
print(sd_cases)
### calc stand dev of all incr_creases in PA and print

