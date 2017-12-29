library(shiny)
library(shinythemes)

md_message <- "## Hello markdown!
Check out [my github](https://github.com/sdhutchins)."


shinyUI(fluidPage(
  fluidRow(HTML('<center><div class="jumbotron"><h1>Try Markdown</h1>
                             <p>Input and edit Markdown formatted text and view output in real time.</p>
                             </div></center>'),
           column(6,
                  tags$textarea(
                    md_message,
                    id    = 'markdown',
                    rows  = 25,
                    style = 'width:100%;'),
                  br(),
                  br(),
                  downloadButton('downloadData', 'Download Input')),
           
           column(6,
                  htmlOutput('html'))),
  hr(),
  br(),
  fluidRow(HTML('<center><div class="jumbotron"><h2>Markdown Basics</h2></div></center>'),
           column(12,
                  tags$iframe(style="height:800px; width:100%; scrolling=yes", 
                              src="MarkdownBasics.pdf")))
  
))
