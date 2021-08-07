#' Show
#' 
#' @keywords internal
show <- function(selector, session = shiny::getDefaultReactiveDomain()){
	selector <- make_selector(selector)
	session$sendCustomMessage('leprechaun-show', list(selector = selector))
}

#' @keywords internal
hide <- function(selector, session = shiny::getDefaultReactiveDomain()){
	selector <- make_selector(selector)
	session$sendCustomMessage('leprechaun-hide', list(selector = selector))
}

#' @keywords internal
toggle <- function(selector, session = shiny::getDefaultReactiveDomain()){
	selector <- make_selector(selector)
	session$sendCustomMessage('leprechaun-toggle', list(selector = selector))
}

make_selector <- function(selector){
	is_selector <- grepl("\\.|\\[", selector)

	if(is_selector)
		return(selector)

	sprintf("#%s", selector)
}