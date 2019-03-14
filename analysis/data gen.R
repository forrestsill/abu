names <- c("alexander", "eliza", "angelica", "aaron", "thomas", "george")
trades <- c("spx", "tsy10", "em", "cash", "fx")
dates <- seq(from = Sys.Date() - 30, to = Sys.Date(), by = 1)



data <- data.table(DateTime = rep(dates, each = length(trades)),
                   UserName = rep(names, each = length(trades) * length(dates)),
                   Trade = rep(trades, length(dates)))


# create votes
data$Vote <- round(rnorm(nrow(data)) * 1.5)
