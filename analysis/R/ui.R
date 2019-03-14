library(shiny)
library(expm)
library(dplyr)
library(ggplot2)
library(ggthemes)
library(readxl)
library(data.table)

# define widgets ####
theme_blk <- function(base_size = 11, base_family = "") {
  
  half_line <- base_size / 2
  
  theme_grey(base_size = base_size, base_family = base_family) %+replace% 
    theme(line = element_line(colour = rgb(217, 217, 217, max = 255), #
                              size = 0.75, #
                              linetype = 1,
                              lineend = "butt"),
          text = element_text(family = base_family,
                              face = "plain",
                              colour = rgb(89, 89, 89, max = 255), # 
                              size = base_size,
                              lineheight = 0.9,
                              hjust = 0.5,
                              vjust = 0.5,
                              angle = 0,
                              margin = margin(),
                              debug = FALSE),
          axis.line = element_line(colour = rgb(191, 191, 191, max = 255)), #
          axis.line.y = element_blank(), #
          axis.text = element_text(size = rel(0.8),
                                   colour = rgb(89, 89, 89, max = 255)), #
          axis.ticks = element_blank(), #
          legend.background = element_blank(), ##
          legend.key = element_blank(), ##
          legend.text.align = 0, ##
          legend.title = element_blank(), #
          legend.position = "bottom", ##
          panel.background = element_blank(), #
          panel.grid.major = element_line(), #
          panel.grid.major.x = element_blank(), #
          panel.grid.major.y = element_line(), # 
          panel.grid.minor = element_blank(), # 
          strip.background = element_blank(), ##
          plot.background = element_blank(), ##
          plot.title = element_text(size = rel(1.2),
                                    hjust = 0.5, #
                                    vjust = 1,
                                    margin = margin(b = half_line * 1.2)), 
          plot.subtitle = element_text(size = rel(0.9),
                                       hjust = 0.5, #
                                       vjust = 1,
                                       margin = margin(b = half_line * 0.9)))
  
}


# BlackRock color palette
blk_palette <- function(n) {
  
  blk_colors <- c(rgb(  0,  53, 148, max = 255),
                  rgb(130, 188,   0, max = 255),
                  rgb( 39, 175, 175, max = 255),
                  rgb(248, 151,  29, max = 255),
                  rgb( 19, 181, 234, max = 255),
                  rgb(108,  32, 126, max = 255),
                  rgb(102, 134, 191, max = 255),
                  rgb(180, 215, 102, max = 255),
                  rgb(125, 207, 207, max = 255),
                  rgb(251, 193, 119, max = 255),
                  rgb(113, 211, 242, max = 255),
                  rgb(167, 121, 178, max = 255),
                  rgb(204, 215, 234, max = 255),
                  rgb(230, 242, 204, max = 255),
                  rgb(212, 239, 239, max = 255),
                  rgb(254, 234, 210, max = 255),
                  rgb(208, 240, 251, max = 255),
                  rgb(226, 210, 229, max = 255))
  
  rep(blk_colors, length.out = n)
  
}

# color palette for 'color' aesthetic
scale_color_blk <- function(...) {
  
  discrete_scale("colour", "blackrock", blk_palette, ...)
  
}

# color palette for 'fill' aesthetic
scale_fill_blk <- function(...) {
  
  discrete_scale("fill", "blackrock", blk_palette, ...)
  
}





ui <- fluidPage(
  
  titlePanel("Convictions"),
  
  # inputs
  fluidRow(
    
    
    column(2, 
           selectInput("lines", label = h4("lines"),
                       choices = list("user" = 1, "trade" = 2),
                       selected = 2),
           
           selectInput("facet", label = h4("facet"),
                       choices = list("user" = 1, "trade" = 2), 
                       selected = 1)
    ),
    column(3,
           sliderInput("slider_dates", label = h4("dates"),
                       min = as.Date("2019-02-10"), max = Sys.Date(),
                       value = c(as.Date("2017-09-01"), Sys.Date()))
    ),
    
    column(1,
           checkboxGroupInput("pm", label = h4("user"),
                              choices = list("alexander" = "alexander",
                                             "eliza" = "eliza",
                                             "angelica" = "angelica",
                                             "aaron" = "aaron",
                                             "thomas" = "thomas",
                                             "george" = "george"),
                              selected = c("alexander", "angelica"))
           
    ),
    
    column(3,
           selectInput("trade_number", label = h4("trade "),
                       choices = list('spx' = 'spx', 'tsy10' = 'tsy10',
                                      'em' = 'em', 'cash' = 'cash', 'fx' = 'fx'),
                       selected = c("spx", "tsy10"),
                       multiple = TRUE)          
    )
  ),
  
  # plot 
  fluidRow(
    column(12, 
           plotOutput(outputId = "distPlot")
    )
  )
)