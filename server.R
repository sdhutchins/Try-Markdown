library(shiny)
library(rmarkdown)

shinyServer(function(input, output) {

    output$html = reactive({

        t <- tempfile()
        cat(input$markdown, file = t)

        ## convert input to html
        t <- render(
            input         = t,
            output_format = 'html_document')

        ## read results
        res <- readLines(t)

        ## cleanup
        unlink(sub('.html$', '*', t))

        ## return
        paste(res, collapse = '\n')

    })
    
    output$downloadData <- downloadHandler(
      filename = function() { paste("markdowninput_", Sys.time(), ".txt", sep='') },
      content = function(file) {
        write(input$markdown, file)
      })

})
