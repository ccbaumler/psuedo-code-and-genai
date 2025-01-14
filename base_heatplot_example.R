data()
data(package = .packages(all.available = TRUE))

iris

UScitiesD
eurodist

class(UScitiesD)
?dist
as.matrix(UScitiesD)


plot(UScitiesD)
plot(as.matrix(UScitiesD))


custom_palette <- colorRampPalette(c("purple", "orange"))(25)
us_distance_matrix <- as.matrix(UScitiesD)
heatmap(us_distance_matrix, 
        main = "Distance Heatmap of US Cities", 
        xlab = "Cities", 
        ylab = "Cities", 
        col = custom_palette, 
        margins = c(10,10),
        scale = "none",
        Colv = NA)

us_min_value <- round(min(us_distance_matrix), 2)
us_ave_value <- round(mean(us_distance_matrix), 2)
us_max_value <- round(max(us_distance_matrix), 2)
summary(UScitiesD)

legend(
  title = "Distance (Mi or km?)",
  x = "bottomright", 
  legend = c(
    paste("min:", us_min_value),
    paste("ave:", us_ave_value),
    paste("max:", us_max_value)
  ),
  fill = colorRampPalette(custom_palette)(3),
  inset = c(-0.05, -0.205),
  xpd = TRUE,
  trace = TRUE
)

custom_palette <- colorRampPalette(c("purple", "orange"))(25)

euro_distance_matrix <- as.matrix(eurodist)
heatmap(euro_distance_matrix, 
        main = "Heatmap of Eurodist Distances", 
        xlab = "Cities", 
        ylab = "Cities", 
        col = colorRampPalette(c("yellow", "darkorange"))(25), 
        scale = "none")

euro_min_value <- round(min(euro_distance_matrix), 2)
euro_ave_value <- round(mean(euro_distance_matrix), 2)
euro_max_value <- round(max(euro_distance_matrix), 2)
summary(eurodist)

legend(
  title = "Distance (Mi or km?)",
  x = "bottomright", 
  legend = c(
    paste("min:", euro_min_value),
    paste("ave:", euro_ave_value),
    paste("max:", euro_max_value)
  ),
  fill = colorRampPalette(c("yellow", "darkorange"))(3),
  inset = -.1
)  

data(iris)

###
# Prompt
#
# please create a heatmap in only base R from a iris r dataset that goes from purple to orange and has a legend with numerical entries of min, ave, and max
#
###

# Select the numeric columns for the heatmap
iris_numeric <- iris[, 1:4]

# Normalize the data to scale it between 0 and 1
iris_normalized <- as.data.frame(lapply(iris_numeric, function(x) (x - min(x)) / (max(x) - min(x))))

# Create the heatmap
heatmap(as.matrix(iris_normalized), 
        col = colorRampPalette(c("purple", "orange"))(256), 
        scale = "none", 
        margins = c(5,10), 
        main = "Heatmap of Iris Dataset", 
        xlab = "Features", 
        ylab = "Samples", 
        cex.main = 1.5)

# Add a legend for Min, Average, and Max
legend("topright", 
       legend = c(paste("Min:", round(min(iris_normalized), 2)), 
                  paste("Ave:", round(mean(iris_normalized), 2)), 
                  paste("Max:", round(max(iris_normalized), 2))),
       fill = c("purple", "orange", "yellow"), 
       title = "Legend")



plot(iris$Sepal.Length, iris$Sepal.Width, main = "Sepal Length vs. Sepal Width",
     xlab = "Sepal Length", ylab = "Sepal Width", col = iris$Species)

### prompt
#
# attach an image of the plot and say "please re-create this plot in base R"
#
###

# Load the Iris dataset
data(iris)

# Define colors for each species
species_colors <- c("black", "red", "green")  # Setosa, Versicolor, Virginica
iris_colors <- species_colors[as.numeric(iris$Species)]

# Create the scatter plot
plot(
  iris$Sepal.Length,
  iris$Sepal.Width,
  col = iris_colors,
  pch = 1,  # Open circles
  xlab = "Sepal Length",
  ylab = "Sepal Width",
  main = "Sepal Length vs. Sepal Width"
)
