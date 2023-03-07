library(ggplot2)

df <- read.csv("/Users/drewmorse/Git Kraken /Intro-to-R-2ed/BIS-244-Spring-2023-MorseAndrew/gc.csv")
print(colnames(df))
my_plot <- ggplot(df, aes(x=Duration, y = Credit.amount)) + geom_point() + facet_wrap(~ Housing)

plot(my_plot)


my_plot2 <- ggplot(df, aes(x=Duration, y = Credit.amount)) + geom_point() + facet_wrap(~ job)


my_plot3 <- ggplot(df, aes(x=Duration, y = Credit.amount)) + geom_point() + facet_wrap(risk ~ Housing)




