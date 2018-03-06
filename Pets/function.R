library(plotly)
library(dplyr)


plot <- function(data, style, group, status, type) {
  
  # filter the dataset according to given GroupCheck
  # Cat, Dog, Others
  # Dead animals are excluded
  cat <- filter(data, animal_type == "Cat")
  dog <- filter(data, animal_type == "Dog")
  other <-
    filter(data, animal_type != "Cat") %>% filter(animal_type != "Dog") %>% filter(!grepl("Dead", animal_type))
  
  animal_type_data <- data.frame()
  
  if ("Dog" %in% group) {
    animal_type_data <- rbind(animal_type_data, dog)
    }else if ("Cat" %in% group) {
      animal_type_data <- rbind(animal_type_data, cat)
       }else if ("Other" %in% group) {
        animal_type_data <- rbind(animal_type_data, other)
       }else{
         animal_type_data <- rbind(animal_type_data, dog)
       }
         
  # filter dataset according to given Status
  # Adoptable, Lost, Found
  if (status == "A") {
    animal_type_data <-
      animal_type_data %>% filter(Record_Type == "ADOPTABLE")
  } else if (status == "L") {
    animal_type_data <- animal_type_data %>% filter(Record_Type == "LOST")
  } else{
    animal_type_data <-
      animal_type_data %>% filter(Record_Type == "FOUND")
  }
  
  # filter dataset accodring to given x-axis
  # Gender or Breed
  if (type == "G") {
    animal_type_data <- group_by(animal_type_data, Animal_Gender) %>% summarize(count = n())
  }else{
    animal_type_data <- group_by(animal_type_data, Animal_Breed) %>% summarize(count = n())
  }
  colnames(animal_type_data) <- c("x", "y")
  
  # call plotting function according to given style
  if(style == "bar"){
    bar_plot(animal_type_data)
  }else{
    donut_plot(animal_type_data)
  }
}

donut_plot <- function(data) {
    p <- plot_ly(labels = data$x, values = data$y) %>%
      add_pie(hole = 0.6) %>%
      layout(
        showlegend = F,
        xaxis = list(
          showgrid = FALSE,
          zeroline = FALSE,
          showticklabels = FALSE
        ),
        yaxis = list(
          showgrid = FALSE,
          zeroline = FALSE,
          showticklabels = FALSE
        )
      )
  
  p <- ggplotly(p)
  return(p)
}

bar_plot <- function(data) {
      p <- plot_ly(x = data$x,
              y = data$y,
              type = "bar") %>% layout(margin = list(b = 160), xaxis = list(tickangle = 45))
              
  
  p <- ggplotly(p)
  return(p)
}
