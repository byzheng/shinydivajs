library(shiny)
if (!require('shinydivajs')) {
    devtools::install_github('shinydivajs')
}

library(shinydivajs)




ui <- shinyUI(
    fluidPage(
        titlePanel('Weather station in wheatbelt'),
        sidebarPanel(
            selectInput('dataset', 'dataset', c('A', 'B'), 'A')
        ),
        mainPanel(
            divajsOutput('diva', width = '100%', height = '600px')
        ))
)

server <- function(input, output, session) {
    output$diva <- renderDivajs({
        ImageIIPimageDir <- ""
        ImageIIPobjectData <- c(
            A = 'https://ddmal.github.io/diva.js/try/iiif-highlight-pages/stgallen_390_annotated.json',
            B = 'https://ddmal.github.io/diva.js/try/demo/beromunster-iiif.json')
        dataset <- ImageIIPobjectData[input$dataset]
        print(dataset)
        shinydivajs(
            NULL, 
            dataset, 
            NULL,
            inGrid = TRUE,
            enableAutoTitle = FALSE,
            enableFullscreen = FALSE,
            enableLinkIcon = FALSE)
    })
    
}



shinyApp(ui = ui, server = server)
