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
mar <- read.csv("best_performances.csv",
                stringsAsFactors = FALSE)


#####
# READ IN DEATH MASTER FILE ?
#####
# http://ssdmf.info/download.html

#####
# GET BIRTH YEAR
#####
mar$year_of_birth <- as.numeric(ifelse(nchar(mar$dob) <5, mar$dob,
                            as.numeric(as.character(substr(as.Date(mar$dob, format = "%d-%b-%y"), 1, 4)))))
mar$year_of_birth[which(mar$year_of_birth > 2000)] <- 
  mar$year_of_birth[which(mar$year_of_birth > 2000)] - 100

#####
# CONVERT TIME TO MINUTES
#####
Minutify <- function(x){
  hours <- as.numeric(substr(x, 1, 1))
  minutes <- as.numeric(substr(x, 3, 4))
  seconds <- as.numeric(substr(x, 6, 7))
  
  seconds_decimal <- seconds / 60
  
  time <- ( hours*60 ) + minutes + seconds_decimal
  
  return(time)
}

mar$minutes <- Minutify(mar$time)

#####
# GET AGE AT TIME OF RUN
#####


# Americans
x <- mar[which(grepl("USA", mar$name_country)),]

# Americans born before 1970
x <- x[which(x$year_of_birth < 1970),]

hist(mar$minutes, freq = FALSE)
hist(x$minutes, col = adjustcolor("red", alpha.f = 0.6), freq = FALSE, add = T)

