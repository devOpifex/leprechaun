#' Columns
#' 
#' Shortcuts to create columns of specific width.
#' 
#' @param ... Any valid htmltools content and tags
#' to pass to `column`.
#' 
#' @importFrom shiny column
#' 
#' @name leprechaun-columns
#' @keywords internal
col1 <- function(...){
	column(1, ...)
}

#' @rdname leprechaun-columns
#' @keywords internal
col2 <- function(...){
	column(2, ...)
}

#' @rdname leprechaun-columns
#' @keywords internal
col3 <- function(...){
	column(3, ...)
}

#' @rdname leprechaun-columns
#' @keywords internal
col4 <- function(...){
	column(4, ...)
}

#' @rdname leprechaun-columns
#' @keywords internal
col5 <- function(...){
	column(5, ...)
}

#' @rdname leprechaun-columns
#' @keywords internal
col6 <- function(...){
	column(6, ...)
}

#' @rdname leprechaun-columns
#' @keywords internal
col7 <- function(...){
	column(7, ...)
}

#' @rdname leprechaun-columns
#' @keywords internal
col8 <- function(...){
	column(8, ...)
}

#' @rdname leprechaun-columns
#' @keywords internal
col9 <- function(...){
	column(9, ...)
}

#' @rdname leprechaun-columns
#' @keywords internal
col10 <- function(...){
	column(10, ...)
}

#' @rdname leprechaun-columns
#' @keywords internal
col11 <- function(...){
	column(11, ...)
}

#' @rdname leprechaun-columns
#' @keywords internal
col12 <- function(...){
	column(12, ...)
}

#' Badge
#' 
#' Add a badge.
#' 
#' @param ... Content of the badge.
#' @param class Any additional class.
#' @param color Color of the badge.
#' @param pill Whether to create a pill badge.
#' @param .tag Tag to use (`span`, or `a`)
#' 
#' @keywords internal
badge <- function(
	..., 
	class = "", 
	color = "dark", 
	pill = FALSE,
	.tag = shiny::span
){
	cl <- sprintf("%s badge badge-%s", class, color)

	if(pill)
		cl <- sprintf("%s badge-pill", cl)

	.tag(..., class = cl)
}

#' Alert
#' 
#' Create a bootstrap 4 alert.
#' 
#' @param ... Content of the alert.
#' @param class Any additional class.
#' @param color Color of the alert.
#' 
#' @keywords internal
alert <- function(..., class = "", color = "primary"){
	cl <- sprintf("%s alert alert-%s", class, color)

	div(
		class = cl,
		role = "alert",
		...
	)
}
