#####
# SET WORKING DIRECTORY CONDITIONAL TO SYSTEM
#####
if ( Sys.info()["sysname"] == "Linux" ){
  wd <- "/home/joebrew/Documents/marthon"
} else if( Sys.info()["user"] == "BrewJR"){
  wd <- "C:/Users/BrewJR/Documents/marathon"
} 
setwd(wd) 

#####
# READ IN MARATHON DATA
#####
mar <- read.csv("best_performances.csv")

# Americans
x <- mar[which(grepl("USA", mar$name_country)),]

#####
# READ IN DEATH MASTER FILE ?
#####
# http://ssdmf.info/download.html