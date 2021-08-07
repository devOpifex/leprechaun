#' Build CSS
#' 
#' Build the sass
sass_build <- function(){
	has_sass <- requireNamespace("sass", quietly = TRUE)

	if(!has_sass){
		warning(
			"Requires `sass` package: `install.packages('sass')`\n", 
			"Skipping.",
			call. = FALSE
		)
		return()
	}

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
