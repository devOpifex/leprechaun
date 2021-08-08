#' JavaScript Utils
#' 
#' Add utility JavaScript function, e.g.: to hide or show
#' element in the DOM.
#' 
#' @param overwrite Whether to overwrite existing files.
#' 
#' @note This requires a packer scaffold in place.
#' 
#' @importFrom fs file_exists
#' 
#' @export 
use_js_utils <- function(overwrite = FALSE){
	# checks
	check_packer()
	check_is_leprechaun()

	if(!overwrite && file_exists("srcjs/leprechaun-utils.js"))
		stop(
			"Files already exists. Use `overwrite = TRUE` to update."
		)

	# copy files
	copy_file(
		pkg_file("javascript", "utils.js"), 
		c("srcjs", "leprechaun-utils.js")
	)

	copy_file(
		pkg_file("javascript", "javascript.R"),
		c("R", "javascript.R")
	)

	lock_change("js-utils")

	# check if it is imported in the index
	index_path <- "srcjs/index.js"
	index <- read_lines(index_path)

	# if it's already imported we just skip it
	if(any(grepl("leprechaun-utils.js", index)))
		return(invisible())

	index <- c(
		"import { handleUtils } from './leprechaun-utils.js';", 
		index,
		"handleUtils();"
	)
	writeLines(index, con = index_path)
}
