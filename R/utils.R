#' Packge File
#' 
#' Get path to packge file.
#' 
#' @return Path to `inst/` file
#' 
#' @examples 
#' pkg_file(c("dir", "file.js"))
#' 
#' @noRd
#' @keywords internal
pkg_file <- function(...){
	# allow passing vector
	path <- collapse_path(...)
  system.file(path, package = "leprechaun")
}

#' Get Pacakge Name
#' 
#' Retrieve the name of the package from the config file.
#' 
#' @noRd
#' @keywords internal
get_pkg_name <- function(){
  desc <- read_lines("DESCRIPTION")
  pkg <- desc[grepl("^Package:", desc)]
  pkg <- gsub("^Package: ", "", pkg)
  trimws(pkg)
}

#' Package Version
#' 
#' Get the current version of leprechaun.
#' 
#' @noRd 
#' @keywords internal
get_pkg_version <- function(){
	as.character(utils::packageVersion("leprechaun"))
}

#' Template Replace
#' 
#' Replace the content of a template file.
#' 
#' @noRd 
#' @keywords internal
tmp_replace <- function(content){
	gsub("#PKGNAME#", get_pkg_name(), content)
}

#' @noRd 
#' @keywords internal
tmp_read_replace <- function(file){
	content <- read_lines(file)
	tmp_replace(content)
}

#' @noRd 
#' @keywords internal
tmp_read_replace_write <- function(infile, outfile){
	# paths
	infile <- collapse_path(infile)
	outfile <- collapse_path(outfile)

	# content
	content <- tmp_read_replace(infile)
	writeLines(content, con = outfile)
}

#' Read Lines
#' 
#' Soft wrapper to `readLines`.
#' 
#' @param ... Arguments to pass to [readLines].
#' 
#' @noRd 
#' @keywords internal
read_lines <- function(...){
	suppressWarnings(readLines(...))
}

#' Collapse a Path
#' 
#' Collapse a set of strings or vectors to a path.
#' 
#' @param ... Strings that make up the path.
#' 
#' @noRd 
#' @keywords internal
collapse_path <- function(...){
	vec <- c(...)
	paste0(vec, collapse = "/")
}

#' Copy file
#' 
#' Copy file and [collapse_path].
#' 
#' @param infile,outfile Input and output files
#' 
#' @importFrom fs file_copy
#' 
#' @noRd 
#' @keywords internal
copy_file <- function(infile, outfile){
	file_copy(
		collapse_path(infile), 
		collapse_path(outfile), 
		overwrite = TRUE
	)
}
