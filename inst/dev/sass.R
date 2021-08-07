#' Build CSS
#' 
#' Build the sass
#' 
#' @export 
sass_build <- function(){
	has_sass <- requireNamespace("sass", quietly = TRUE)

	if(!has_sass)
		stop(
			"Requires `sass` package: `install.packages('sass')`", 
			call. = FALSE
		)

	output <- sass::sass(
		sass::sass_file(
			'scss/main.scss'
		),
		cache = NULL,
		options = sass::sass_options(
			output_style='compressed'
		),
		output = 'inst/assets/style.min.css'
	)
	invisible(output)
}

sass_build()
