#' Run
#' 
#' Run application
#' 
#' @param ... Additional parameters to pass to [shiny::shinyApp].
#' 
#' @importFrom shiny shinyApp
#' 
#' @export 
run <- function(...){
	shinyApp(
		ui = ui,
		server = server,
		...
	)
}

#' Run Development
#' 
#' Runs the development version which includes
#' the build step.
#' 
#' @keywords internal
run_dev <- function(){
	file <- system.file("run/app.R", package = "#PKGNAME#")
	shiny::shinyAppFile(file)
}
