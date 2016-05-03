setwd("C:/Users/Megan Robertson/Documents/Spring2016/STA531/531FinalProject/Piano/CSV")
original = read.csv("Jupiter.csv", row.names = NULL)
remix1 = read.csv("jupiterRemix.csv")
remix2 = read.csv("jupiterRemix2.csv")
remix3 = read.csv("jupiterRemix-2H.csv")

original = original[39:nrow(original),]
remix1 = remix1[39:nrow(remix1),]
remix2 = remix2[39:nrow(remix2),]
remix3 = remix3[39:nrow(remix3),]

colnames(original) = c("one", "two", "Header", "zero", "Note", "Velocity", "X")
colnames(remix1) = c("one", "two", "Header", "zero", "Note", "Velocity", "X")
colnames(remix2) = c("one", "two", "Header", "zero", "Note", "Velocity", "X")
colnames(remix3) = c("one", "two", "Header", "zero", "Note", "Velocity", "X")



library(ggplot2)

#comparing velocities
ggplot(original, aes(x=row.names(remix1), y = Velocity)) + geom_point(shape = 1, col = "blue")
ggplot(remix1, aes(x=row.names(remix1), y = Velocity)) + geom_point(shape = 1)
ggplot(remix2, aes(x=row.names(remix2), y = Velocity)) + geom_point(shape = 1)
ggplot(remix3, aes(x=row.names(remix3), y = Velocity)) + geom_point(shape = 1)

#comparing notes
ggplot(original, aes(Note)) + geom_bar() + ggtitle("Original Composition")
ggplot(remix1, aes(Note)) + geom_bar() + ggtitle("First Order HMM")
ggplot(remix2, aes(Note)) + geom_bar() + ggtitle("Second Order HMM")
ggplot(remix3, aes(Note)) + geom_bar()+ ggtitle("First Order HMM \n Two Hidden States")


#Survey Results
survey = read.csv("SurveyResults.csv")

ggplot(data=survey, aes(x=Favorite,fill=Song)) + geom_bar() + ggtitle("Favorite Compositions") + 
  theme(plot.title = element_text(lineheight=.8, face="bold"))

ggplot(data=survey, aes(x=Correct,fill=Song)) + geom_bar() + ggtitle("Guesses of Original") + 
  theme(plot.title = element_text(lineheight=.8, face="bold"))
