library(ggplot2)

#install.packages("devtools")
#devtools::install_github("slowkow/ggrepel")

library(ggrepel)

# Who has how many points?

# ggplot(league.table, aes(Club, Pts, colour = Col))+
#   geom_point(size = 4)+
#   theme_bw()+
#   geom_text_repel(
#     label= league.table$Club, 
#     nudge_x = 0, nudge_y = -1.0, 
#     aes(colour = "black")
#   )+
#   labs(x = "Club",
#        y = "Points",
#        title = "Premier League 2020-21")+
#   theme(axis.text.x=element_blank(),
#         axis.ticks.x=element_blank())+
#   scale_color_identity()


ggplot(league.table, aes(Club, Pts))+
  geom_bar(stat = "identity",
           fill = league.table$Col)+
  theme_bw()+
  coord_flip()+
  labs(x = "Club",
       y = "Points",
       title = "Premier League 2020-21 Points")

# Most Goals Scored

ggplot(league.table, aes(Club, GF))+
  geom_bar(stat = "identity",
           fill = league.table$Col)+
  theme_bw()+
  coord_flip()+
  labs(x = "Club",
       y = "Goals",
       title = "Premier League 2020-21 Goals")

# Most Goals Conceded

ggplot(league.table, aes(Club, GA))+
  geom_bar(stat = "identity",
           fill = league.table$Col)+
  theme_bw()+
  coord_flip()+
  labs(x = "Club",
       y = "Goals",
       title = "Premier League 2020-21 Goals")

# Goals Scored Vs Points

ggplot(league.table, aes(GF, Pts) )+
  geom_point(size = 4, col = league.table$Col)+
  geom_smooth(method = lm, se = FALSE, formula = y ~ x)+
  theme_bw()+
  labs(
    x = "Goals",
    y = "Points",
    title = "Points Vs Goals Scored")+
  geom_text_repel(
    label= league.table$Club, 
    nudge_x = 0, nudge_y = -1.0, 
    aes(size = 2.5)
  )+
  scale_size_identity()

# Points Vs Goals Conceded

ggplot(league.table, aes(GA, Pts))+
  geom_point(size = 4, col = league.table$Col)+
  geom_smooth(method = lm, se = FALSE, formula = y ~ x)+
  theme_bw()+
  labs(
    x = "Goals",
    y = "Points",
    title = "Points Vs Goals Conceded")+
  geom_text_repel(
    label= league.table$Club, 
    nudge_x = 0, nudge_y = -1.0, 
    aes(size = 3)
  )+
  scale_size_identity()


# Home Performance

ggplot(league.table, aes(HW.Rate, Pts))+
  geom_point(size = 4, col = league.table$Col)+
  geom_smooth(method = lm, se = FALSE, formula = y ~ x)+
  theme_bw()+
  labs(
    x = "Win %",
    y = "Points",
    title = "Home Performance")+
  geom_text_repel(
    label= league.table$Club, 
    nudge_x = 0, nudge_y = -0.25, 
    aes(size = 3)
  )+
  scale_size_identity()

# Away Performance

ggplot(league.table, aes(AW.Rate, Pts))+
  geom_point(size = 4, col = league.table$Col)+
  geom_smooth(method = lm, se = FALSE, formula = y ~ x)+
  theme_bw()+
  labs(
    x = "Win %",
    y = "Points",
    title = "Away Performance")+
  geom_text_repel(
    label= league.table$Club, 
    nudge_x = 0, nudge_y = -0.25, 
    aes(size = 3)
  )+
  scale_size_identity()

# Creativity 

ggplot(league.table, aes(S, ST))+
  geom_point(size = 4, col = league.table$Col)+
  geom_smooth(method = lm, se = FALSE, formula = y ~ x)+
  theme_bw()+
  labs(
    x = "Shots",
    y = "Shots on Target",
    title = "Creativity")+
  geom_text_repel(
    label= league.table$Club, 
    nudge_x = 0, nudge_y = -0.25, 
    aes(size = 3)
  )+
  scale_size_identity()

# Clinical Attacks

ggplot(league.table, aes(S, (GF/S * 100)))+
  geom_point(size = 4, col = league.table$Col)+
  geom_smooth(method = lm, se = FALSE, formula = y ~ x)+
  theme_bw()+
  labs(
    x = "Shots",
    y = "Score Rate",
    title = "Clinical Attacks")+
  geom_text_repel(
    label= league.table$Club, 
    nudge_x = 0, nudge_y = -0.25, 
    aes(size = 3)
  )+
  scale_size_identity()

# Fair Play / Tactical Fouls 

ggplot(league.table, aes(F, B))+
  geom_point(size = 4, col = league.table$Col)+
  geom_smooth(method = lm, se = FALSE, formula = y ~ x)+
  theme_bw()+
  labs(
    x = "Fouls",
    y = "Bookings",
    title = "Fair Play/ Tactical Fouls")+
  geom_text_repel(
    label= league.table$Club, 
    nudge_x = 0, nudge_y = -0.25, 
    aes(size = 3)
  )+
  scale_size_identity()

# Yellow Cards

ggplot(league.table, aes(Club, YC))+
  geom_bar(stat = "identity",
           fill = league.table$Col)+
  theme_bw()+
  coord_flip()+
  labs(x = "Club",
       y = "Yellow Cards",
       title = "Premier League 2020-21 Yellow Cards")

# Red Cards

ggplot(league.table, aes(Club, RC))+
  geom_bar(stat = "identity",
           fill = league.table$Col)+
  theme_bw()+
  coord_flip()+
  labs(x = "Club",
       y = "Red Cards",
       title = "Premier League 2020-21 Red Cards")

