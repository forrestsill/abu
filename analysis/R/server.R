server <- function(input, output) {
  
  
  output$distPlot <- renderPlot({
    
    # load data
    # data <- readRDS("//samba/proj/pmg-east/MBS Inv Team/Investment Process/Infrastructure/Software/ConvictionSurvey/data.rds")
    data <- data.table(read_excel("H:/apps/xp/Desktop/AJ Hackathon/data.xlsx"))
    
    # formatting
    data <- data.table(data)
    names(data) <- c("date", "user", "trade", "vote")
    data <- data[!(data$vote %in% c("MARGINAL_NEGATIVE", "WEAK_NEGATIVE")), ] # clean votes
    data$vote <- gsub(" Units", "", data$vote)
    data$vote <- as.numeric(data$vote)
    
    
    
    # remove fake users, AJ
    data <- data[!(data$user %in% c("test", "Test User", "areisman")), ]
    
    
    # add trade number
    data$trade_num <- data$trade
    data <- data[!(data$trade_num %in% c("", "Y2 ")), ] # remove fake trade numbers
    
    # add indicator for potential trades
    data$pot_trade <- data$trade
    
    # add indicator for active trades
    data$active_trade <- ifelse(data$trade_num %in% c(218, 222, 238, 240, 242, 244, 245, 246),
                                1, 0)
    
    
    # user-selected dates
    data <- data[as.Date(data$date) >= min(input$slider_dates), ]
    data <- data[as.Date(data$date) <= max(input$slider_dates), ]
    
    # # user-selected trades
    data <- data[data$trade_num %in% input$trade_number, ]
    
    
    
    # user-selected pms
    data <- data[data$user %in% as.character(input$pm), ]
    
    
    # grab pot(ential / all trades
    # v <- as.numeric(input$trade_type)
    # if (v == 1) data <- data[data$active_trade == 1, ]
    # if (v == 2) data <- data[data$active_trade == 0, ]
    # if (v == 3) data <- data[data$pot_trade == 1, ]
    
    
    # parameters
    # type <- as.numeric(input$type)
    
    v <- c("user", "trade_num")
    lines <- v[as.numeric(input$lines)]
    
    v <- c("user", "trade_num")
    facet <- v[as.numeric(input$facet)]
    
    
    # graphics
    if (nrow(data) > 0) {
      


    p1 <- ggplot(data, aes(x = date, y = vote, 
                           col = factor(get(lines)))) +

      facet_grid(~ get(facet)) +
      geom_line(size = 2) +
      labs(col = lines, x = "", y = "") +
      theme_bw() + xlab("") + ylab("vote") +
      scale_color_blk() +
      scale_fill_blk() 
      
    }
    
    p1

  })
}




