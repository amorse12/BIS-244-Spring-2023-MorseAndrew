library(ggplot2)


df <- read.csv("/Users/drewmorse/Git Kraken /Intro-to-R-2ed/BIS-244-Spring-2023-MorseAndrew/AMD.csv")


df$Date <- as.Date(df$Date)



df$log_volume <- log10(df$Volume)


ggplot(df, aes(x = Date, y = High)) +
  geom_line() +
  scale_y_continuous(name = "High",
                     limits = c(0, max(df$High)*1.1)) +
  scale_x_date(name = "Date") +
  scale_color_continuous(name = "Log Volume", 
                          trans = "log10",
                          breaks = c(1, 10, 100, 1000),
                          labels = c("1", "10", "100", "1000")) +
  geom_line(aes(color = log_volume))
