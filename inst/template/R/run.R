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
