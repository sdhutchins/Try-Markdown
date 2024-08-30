library(shiny)
library(shinythemes)
library(rmarkdown)

md_message <- "## Hello markdown!
Check out [my github](https://github.com/sdhutchins)."

ui <- fluidPage(
  fluidRow(
    HTML('<center><div class="jumbotron"><h1>Try Markdown</h1>
          <p>Input and edit Markdown formatted text and view output in real time.</p>
          </div></center>'),
    column(6,
           tags$textarea(
             value = md_message,
             id    = 'markdown',
             rows  = 25,
             style = 'width:100%;'),
           br(),
           br(),
           downloadButton('downloadData', 'Download Input')),
    column(6,
           uiOutput('html'))
  ),
  hr(),
  br(),
  fluidRow(
    HTML('<center><div class="jumbotron"><h2>Markdown Basics</h2></div></center>'),
    column(12,
           tags$iframe(style="height:800px; width:100%; scrolling=yes", 
                       src="MarkdownBasics.pdf"))
  )
)

server <- function(input, output) {
  
  output$html <- renderUI({
    t <- tempfile(fileext = ".md")
    cat(input$markdown, file = t)
    
    # Convert markdown to HTML
    html_output <- markdown::markdownToHTML(t, fragment.only = TRUE)
    
    # Cleanup
    unlink(t)
    
    # Return as HTML
    HTML(html_output)
  })
  
  output$downloadData <- downloadHandler(
    filename = function() { paste("markdowninput_", Sys.Date(), ".md", sep='') },
    content = function(file) {
      write(input$markdown, file)
    })
}

shinyApp(ui = ui, server = server)
