install.packages("tidyverse")
library("tidyverse")
storms
#remove some columns using "!" or "-" 
dplyr::select(
  storms,
  -c(lat, long, pressure, tropicalstorm_force_diameter, hurricane_force_diameter)
  )
#use ends_with argument
dplyr::select(
  storms,
  -c(lat, long, pressure, ends_with("diameter"))
)

#Filter Data using Filter function in Dplyr package
filter(
select(
  storms,-c(lat, long, pressure, ends_with("diameter"))
), status=="hurricane"
)

#using "Pipe" operator
hurricanes <- storms |> 
select(-c(lat, long, pressure, ends_with("diameter")))|>
filter(status== "hurricane") |>
arrange(desc(wind), name) |>
  distinct(name, year, .keep_all = TRUE)

hurricanes |> 
  select(c(name, year, wind)) |>
  write.csv("hurricanes.csv", row.names = FALSE)

hurricanes_2 = read.csv("hurricanes.csv")
hurricanes_2 |>
  group_by(year) |>
  arrange(desc(wind)) |>
  slice_head()
#slice_head()
hurricanes_2 |>
  group_by(year) |>
  slice_max(order_by = wind) |>
  ungroup()


#summarize
hurricanes_2 |>
  group_by(year) |>
  summarise(hurricanes=n())

