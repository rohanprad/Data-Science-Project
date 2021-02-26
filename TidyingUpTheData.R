# Getting the Data
full.data <- read.csv("https://raw.githubusercontent.com/rohanprad/Data-Science-Project/main/Dataset/PL20-21.csv")

library(dplyr)

#Selecting only relevant observations

tidy.data <- select(full.data, Date:AR)
tidy.data <- select(tidy.data, -(Time))
tidy.data <- select(tidy.data, -(Referee))
tidy.data

# Getting the List of the 20 Team Names

clubs <- unique(tidy.data$HomeTeam)
clubs

# Function To Summarize the results and return a single row dataframe for each team

getTeamData <- function(teamName){

      Home <- filter(tidy.data, HomeTeam == teamName)
      Home
      
      Away <- filter(tidy.data, AwayTeam == teamName)
      Away
      
      home.wins <- 0
      home.losses <- 0
      home.draws <- 0
      
      away.wins <- 0
      away.losses <- 0
      away.draws <- 0
      
      for(result in Home$FTR){
          if(result == "H"){
              home.wins <- home.wins + 1
          }else if(result == "A"){
              home.losses <- home.losses + 1
          }else{
              home.draws <- home.draws + 1
          }
      }
      
      
      for(result in Away$FTR){
        if(result == "A"){
          away.wins <- away.wins + 1
        }else if(result == "H"){
          away.losses <- away.losses + 1
        }else{
          away.draws <- away.draws + 1
        }
      }
      
      wins <- home.wins + away.wins
      draws <- home.draws + away.draws
      losses <- home.losses + away.losses
      
      played <- wins + draws + losses
      points <- (3*wins) + (draws)
      
      goals.for <- sum(Home$FTHG) + sum(Away$FTAG)
      goals.against <- sum(Home$FTAG) + sum(Away$FTHG)
      
      goal.difference <- goals.for - goals.against
      
      home.win.rate <- home.wins/length(Home$FTR) * 100
      home.win.rate <- round(home.win.rate)
      
      away.win.rate <- away.wins/length(Away$FTR) * 100
      away.win.rate <- round(away.win.rate)
      
      overall.win.rate <- wins/played * 100
      overall.win.rate <- round(overall.win.rate)
      
      goals.for.avg <- goals.for/played
      goals.for.avg <- round(goals.for.avg, digits = 1)
      
      goals.against.avg <- goals.against/played
      goals.against.avg <- round(goals.against.avg, digits = 1)
      
      shots <- sum(Home$HS) + sum(Away$AS)
      shots.target <- sum(Home$HST) + sum(Away$AST)
      
      corners <- sum(Home$HC) + sum(Away$AC)
      
      fouls <- sum(Home$HF) + sum(Away$AF)
      
      yellow.cards <- sum(Home$HY) + sum(Away$AY)
      red.cards <- sum(Home$HR) + sum(Away$AR)
      
      team.data <- data.frame(teamName, played, wins, draws, losses, goal.difference, points, goals.for, goals.against, goals.for.avg, goals.against.avg, home.wins, home.draws, home.losses, home.win.rate, away.wins, away.draws, away.losses, away.win.rate, overall.win.rate, shots, shots.target, corners, fouls, yellow.cards, red.cards )
      names(team.data) <- c("Club", "P", "W", "D", "L", "GD", "Pts", "GF", "GA", "GF.Avg", "GA.Avg", "HW", "HD", "HL", "HW.rate", "AW", "AD", "AL", "AW.Rate", "W.Rate", "S", "ST", "C", "F", "YC", "RC")
      team.data

}

# Creating an empty dataframe to store the final results for all 20 teams

league.table <- data.frame(matrix(nrow = 0, ncol = 26))
colnames(league.table) <- c("Club", "P", "W", "D", "L", "GD", "Pts", "GF", "GA", "GF.Avg", "GA.Avg", "HW", "HD", "HL", "HW.rate", "AW", "AD", "AL", "AW.Rate", "W.Rate", "S", "ST", "C", "F", "YC", "RC")

# Creating the league table

for(club in clubs){
  row <- getTeamData(club)
  league.table <- rbind(league.table, row)
}
league.table

# Arranging the league table by points > goal difference > goals for

league.table <- arrange(league.table, desc(Pts), desc(GD), desc(GF))
league.table

# Creating a CSV file to store the final tidy data

write.csv(league.table, file = "./Dataset/TidyData.csv")

