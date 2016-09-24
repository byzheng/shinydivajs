# * Author:    Bangyou Zheng (Bangyou.Zheng@csiro.au)
# * Created:   08:38 PM Saturday, 05 March 2016
# * Copyright: MIT

#' a JavaScript book image viewer  
#'
#' R interface to a JavaScript book image viewer designed to 
#' present multi-page documents at multiple resolutions using 
#' \href{https://github.com/DDMAL/diva.js}{diva.js} JavaScript library.
#' 
#' @param iipServerURL The URL to the IIPImage installation
#' @param objectData URL to the JSON file that provides the object dimension data
#' @param inGrid enableAutoTitle
#' @param enableAutoTitle Shows the title within a div of id diva-title
#' @param enableFullscreen Enable or disable fullscreen icon (mode still available)
#' @param enableLinkIcon Controls the visibility of the link icon
#' @param width Width in pixels (optional, defaults to automatic sizing)
#' @param height Height in pixels (optional, defaults to automatic sizing)
#'   
#' @return Interactive dygraph plot
#' @import htmlwidgets
#' @export
shinydivajs <- function(
                  objectData,
                  inGrid = FALSE,
                  enableAutoTitle = TRUE,
                  enableFullscreen = TRUE,
                  enableLinkIcon = TRUE,
                  width = NULL, height = NULL) {
    
    # pass the data and settings using 'x'
    x <- list(
        objectData = objectData,
        inGrid = inGrid,
        enableAutoTitle = enableAutoTitle,
        enableFullscreen = enableFullscreen,
        enableLinkIcon = enableLinkIcon
    )
    
    # create the widget
    htmlwidgets::createWidget("shinydivajs", x, width = width, height = height)
}



#' Shiny bindings for diva.js
#' 
#' Output and render functions for using diva.js within Shiny 
#' applications and interactive Rmd documents.
#' 
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{"100\%"},
#'   \code{"400px"}, \code{"auto"}) or a number, which will be coerced to a
#'   string and have \code{"px"} appended.
#' @param expr An expression that generates a diva.js
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This 
#'   is useful if you want to save an expression in a variable.
#'   
#' @name divajs-shiny
#'
#' @export
divajsOutput <- function(outputId, width = "100%", height = "400px") {
    shinyWidgetOutput(outputId, "shinydivajs", width, height, package = "shinydivajs")
}

#' @rdname divajs-shiny
#' @export
renderDivajs <- function(expr, env = parent.frame(), quoted = FALSE) {
    if (!quoted) { expr <- substitute(expr) } # force quoted
    shinyRenderWidget(expr, divajsOutput, env, quoted = TRUE)
}
