% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/divajs.R
\name{shinydivajs}
\alias{shinydivajs}
\title{a JavaScript book image viewer}
\usage{
shinydivajs(objectData, inGrid = FALSE, enableAutoTitle = TRUE,
  enableFullscreen = TRUE, enableLinkIcon = TRUE, width = NULL,
  height = NULL)
}
\arguments{
\item{objectData}{URL to the JSON file that provides the object dimension data}

\item{inGrid}{enableAutoTitle}

\item{enableAutoTitle}{Shows the title within a div of id diva-title}

\item{enableFullscreen}{Enable or disable fullscreen icon (mode still available)}

\item{enableLinkIcon}{Controls the visibility of the link icon}

\item{width}{Width in pixels (optional, defaults to automatic sizing)}

\item{height}{Height in pixels (optional, defaults to automatic sizing)}

\item{iipServerURL}{The URL to the IIPImage installation}
}
\value{
Interactive dygraph plot
}
\description{
R interface to a JavaScript book image viewer designed to 
present multi-page documents at multiple resolutions using 
\href{https://github.com/DDMAL/diva.js}{diva.js} JavaScript library.
}

