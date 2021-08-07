#' Shiny UI
#' 
#' Core UI of package.
#' 
#' @param req The request object.
#' 
#' @importFrom shiny navbarPage tabPanel
#' @importFrom bslib bs_theme
#' 
#' @keywords internal
ui <- function(req){
	navbarPage(
		theme = bs_theme(version = 4L),
		header = list(assets()),
		title = "#PKGNAME#",
		id = "main-menu",
		tabPanel(
			"First tab",
			shiny::h1("First tab")
		),
		tabPanel(
			"Second tab",
			shiny::h1("Second tab")
		)
	)
}

#' Assets
#' 
#' Includes all assets.
#' This is a convenience function that wraps
#' [serveAssets] and allows easily adding additional
#' remote dependencies (e.g.: CDN) should there be any.
#' 
#' @importFrom shiny tags
#' 
#' @keywords internal
assets <- function(){
	list(
		serveAssets(), # base assets (assets.R)
		tags$head(
			# Place any additional depdendencies here
			# e.g.: CDN
		)	
	)
}
