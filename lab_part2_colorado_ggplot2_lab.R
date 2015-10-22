##################################################################
### лабораторная работа ggplot2:  Часть вторая лабораторная работа
### университета Колорадо 
##################################################################

film_death_counts <- read.csv(file="film_death_counts.csv",header = T)

library(ggplot2)

head(film_death_counts)
film_death_counts 
ggplot(data=film_death_counts,aes(Year,
                                  IMDB_Rating,
                                  col=MPAA_Rating)) +
         geom_point()+ylab("Average IMDB Raiting")


# график 4


film_death_counts$death_per_minute <-  
     film_death_counts$Body_Count/film_death_counts$Length_Minutes
film_death_counts$TitleAndYear <- sprintf("%s (%s)",
  film_death_counts$Film,film_death_counts$Year)

top20 <-  film_death_counts[order(film_death_counts$death_per_minute,
                                                 decreasing = TRUE)[1:20],]
top20$TitleAndYear <-  reorder(top20$TitleAndYear,top20$death_per_minute)

ggplot(data=top20,aes(x=TitleAndYear,y=death_per_minute,fill=MPAA_Rating),ordered=T) +
   coord_flip()+ geom_bar(stat="identity")
