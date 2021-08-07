#' JavaScript Utils
#' 
#' @export 
use_javascript <- function(){
	# checks
	check_packer()
	check_is_leprechaun()

	copy_file(
		c("javascript", "utils.js"), 
		c("srcjs", "leprechaun-utils.js")
	)

	index_path <- "srcjs/index.js"
	index <- read_lines(index_path)

	# if it's already imported we just skip it
	if(grepl("leprechaun-utils.js", index))
		return()

	index <- c("import 'leprechaun-utils.js';", index)
	writeLines(index, con = index_path)
}
