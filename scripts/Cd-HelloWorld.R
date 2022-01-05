##This is an example script.
##Author: Leander Anderegg
##Updated: 1-4-2022

####Set Up Workspace####

##Installs required packages
#install.packages(c("dplyr"))

##Load packages
library(dplyr)

##Load data. Your working directory needs to be set to the local location where you cloned the github repo
# for me that's 
getwd()
# "/Users/leeanderegg/Desktop/UCSB Classes/W2022 R Seminar/Wk1_Intro_RSeminar_W2022"
# you can check what's in your working directory to make sure the 'data' subdirectory is there for loading data
dir()
# if your working directory is in the wrong place, you can reset it with:
#setwd("[your.directory]")
gapminder <- read.csv("./data/gapminder.csv")

####Explore Data####

##Returns information about the data.
str(gapminder)

##Creates a subset of the data and a new variable.
canada <- filter(gapminder,country=="Canada")
canada <- mutate(canada,gdp=(gdpPercap*canada$pop)/1e10)

##Plots it
plot(x=canada$year,y=canada$gdp,type = "p",
     xlab="Year",
     ylab="Gross Domestic Product (billions,USD)",
     main="Canada")

####Analysis#####
model <- lm(gdp~year,data=canada)
summary(model)
drop1(model, test = "F")

####Make Figures#####

# make a folder to put our beautiful figure in
dir.create("plots")
# make sure it got created
dir()

# save our awsome figure as a pdf
pdf("./plots/Fig1_Canada_GDP.pdf",width=5,height=5)
plot(x=canada$year,y=canada$gdp,type = "p",
     xlab="Year",
     ylab="Gross Domestic Product (billions,USD)",
     main="Canada")
abline(model,lty=2)
dev.off()

#that's done



# final step, 'commit' any changes (i.e. the creation of the 'plots' folder and our snazy plot)
# and then 'push' those changes

