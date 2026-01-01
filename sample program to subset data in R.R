# 1. Read the CSV File
chicks <- read.csv("chick_feed_na.csv")

# 2. Clean the Data
cleaned_chicks <- subset(chicks, !is.na(Weight))

# 3. Show unique feed options
unique_feed <- unique(cleaned_chicks$Feed.Name)

formatted_options <- paste0(seq_along(unique_feed), ". ", unique_feed)
cat(formatted_options, sep = "\n")

# 4. Take user input
user_option <- as.integer(readline("Feed Type: "))

# 5. Validate input
if (is.na(user_option) || user_option < 1 || user_option > length(unique_feed)) {
  cat("Invalid input")
} else {
  selected_feed <- unique_feed[user_option]
  print(subset(cleaned_chicks, Feed.Name == selected_feed))
}

