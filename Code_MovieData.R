

setwd('E:\\Farhan\\R\\P2-Section6-Homework-Data')
getwd()

movie_data <- read.csv("Section6-Homework-Data.csv", stringsAsFactors = T)

summary(movie_data)
str(movie_data)

sub_data_action <- movie_data[movie_data$Genre == "action",]

rm(sub_data)

sub_data_action <- movie_data[movie_data$Genre == "action",]
sub_data_adventure <- movie_data[movie_data$Genre == "adventure",]
sub_data_animation <- movie_data[movie_data$Genre == "animation",]
sub_data_comedy <- movie_data[movie_data$Genre == "comedy",]
sub_data_drama <- movie_data[movie_data$Genre == "drama",]


filtered_Genre <- rbind(sub_data_action, sub_data_adventure, sub_data_animation, sub_data_comedy, sub_data_drama)

rm(filtered_movie)
str(filtered_Genre)
summary(filtered_Genre)

sub_data_Buena_Vista_Studios <- filtered_Genre[filtered_Genre$Studio == "Buena Vista Studios", ]
sub_data_Fox <- filtered_Genre[filtered_Genre$Studio == "Fox", ]
sub_data_Paramount_Pictures <- filtered_Genre[filtered_Genre$Studio == "Paramount Pictures", ]
sub_data_Sony <- filtered_Genre[filtered_Genre$Studio == "Sony", ]
sub_data_universal <- filtered_Genre[filtered_Genre$Studio == "Universal", ]
sub_data_WB <- filtered_Genre[filtered_Genre$Studio == "WB", ]

filtered_movie <- rbind(sub_data_Buena_Vista_Studios,sub_data_Fox, sub_data_Paramount_Pictures, sub_data_Sony, sub_data_universal, sub_data_WB)

head(filtered_movie)

colnames(filtered_movie)[8] <- "BudgetMillions"
head(filtered_movie)

library(ggplot2)

a <- ggplot(data=filtered_movie, aes(x=Genre, y=Gross...US))

b <- a + geom_jitter(aes(color=Studio, size=BudgetMillions)) + geom_boxplot(alpha=0.5, size=1) 

b + labs(title="Domestic Growth",
             x ="Genre", y = "Gross US", color="Studio", size="Budget $M") +
  theme(
    plot.title = element_text(color="Red", size="14", face="bold", hjust=0.5),
    axis.title.x = element_text(color="blue", size="12", face="bold"),
    axis.title.y = element_text(color="green", size="12", face="bold"),
    
  )
?theme




