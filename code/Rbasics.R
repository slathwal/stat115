# Creating a new vector in R
x <- c(1,2,3,4,5)

# Indexing a vector
x[2]

# Operations are performed on each element
x^2

# We can check logical conditions on a vector and subset by logical conditions
x[x<3]

# Create a matrix in R
y <- matrix(1:8, nrow = 2, ncol = 4, byrow=FALSE)
y

# Access first row and second column of a matrix
y[1,2]

# Access the third column
y[,3]

# Access the second row
y[2,]

# Check the dimensions of a matrix
dim(y)

# Create a list in R
list_data <- list(c("jan", "feb", "mar"), y, list("green", 12.3))
# Give names to the elements in a list
names(list_data) <- c("month_names", "A_matrix","Another list")
str(list_data)
list_data

# A dataframe in R
# Access inbuilt datasets in R
data(mtcars)
str(mtcars)

# see the first few rows of a dataframe
head(mtcars)
head(mtcars[1])
head(mtcars[[1]])

# Apply a function across all columns of a dataframe
sapply(mtcars, mean)

# Data manipulation using dplyr
# loading an already installed package
library(tidyverse)

# installing a package
install.packages("nycflights13")
library(nycflights13)
# The above package contains a really large dataset called flights.

# filter based on specific conditions
filter(mtcars, mpg >= 20.0, hp >= 100)

# Select specific columns from a dataframe
select(mtcars, mpg, cyl, disp)

# Remove specific columns from a dataframe
select(mtcars, -drat, -gear, -carb)

# Add new columns based on other columns you already have
mutate(mtcars,
       metric = mpg/100 + hp/100
       )

# Sort dataframes by columns
arrange(mtcars, hp, mpg)

# sort by descending order
arrange(mtcars, desc(mpg))

# Take many numbers and condense them into 1 number
summarise(mtcars,
          avg_mpg = mean(mpg, na.rm = TRUE)
          )

# Create summaries by groups
by_hp <- group_by(mtcars, hp)
by_hp

summarise(by_hp,
          count=n(),
          avg_mpg = mean(mpg, na.rm = TRUE)
          )


# pipe operator
# Turn a function f(x,y) into x |> f(y)

# Get a dataset called colon from a library called survival
library(survival)
data(cancer)
head(colon)

# use the pipe operator to do the following:
# 1. Remove the study column for clarity since it only contains ones
# 2. We only want rows with etype 2 (these are death events rather than recurrence)
# 3. Round time to months (for simplicity, assume a month has exactly 30 days)
# 4. Sort dataframe by age (from low to high age)
# 5. Show a simple summary of the average survival time, in months, grouped by treatment

colon |>
  select(-study) |>
  filter(etype == 2) |>
  mutate(months = round(time/30)) |>
  arrange(age) |>
  group_by(rx) |>
  summarise(avg_survival = mean(months))


# Plotting with ggplot2
# Using flights data from nycflights13 package
flights |>
  filter(arr_delay <= 360) |>
  ggplot(aes(x = factor(month), y = arr_delay, color = origin)) +
  geom_boxplot() +
  ggtitle("Delay by month") +
  xlab("Month") +
  ylab("Arrival delay (min)")

flights |>
  filter(month == 1, arr_delay < 360, dep_delay < 360) |>
  ggplot(aes(x = dep_delay, y = arr_delay)) +
  geom_point() +
  ggtitle("Relationship between departure and arrival delay") +
  xlab("Departure Delay (min)") +
  ylab("Arrival Delay (min)")
