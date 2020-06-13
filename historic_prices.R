# A game to play "what if?" you had a time machine and could go back and buy $100 in any stock 
library(tidyquant)
library(ggplot2)

aapl <- tq_get('AAPL',
  from = "2017-01-01",
  to = "2018-03-01",
  get = "stock.prices")

aapl %>%
  ggplot(aes(x = date, y = adjusted)) +
  geom_line() +
  theme_minimal() +
  labs(x = 'Date',
       y = "Adjusted Price",
       title = "Apple price chart") +
  scale_y_continuous(breaks = seq(0,300,10))


tickers = c("AAPL", "NFLX", "AMZN", "^DJI")
prices <- tq_get(tickers,
                 from = "2017-01-01",
                 to = "2017-03-01",
                 get = "stock.prices")
prices %>%
  ggplot(aes(x = date, y = adjusted, color = symbol)) +
  geom_line() +
  facet_wrap(~symbol,scales = 'free_y') +
  theme_minimal() +
  labs(x = 'Date',
       y = "Adjusted Price",
       title = "Price Chart") +
  scale_x_date(date_breaks = "month",
               date_labels = "%b\n%y")

# Take the above and make either a shiny app, or parameterized .Rmd where someone enters in their golden ticket then see how much they would have made then lay that against Dow Jones IA.
