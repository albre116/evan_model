histo-toolbox.shinyapps.io/Shiny

packages<-c("devtools","shinyapps","shiny")
lapply(packages,require,character.only=T)

#server
#ui

setwd("/Users/m006295/Documents/Academic/Programming/R/Shiny")

runApp()

deployApp()

#What are these different packages and the commands below?

#Process - develop app on your computer, upload to server where it runs