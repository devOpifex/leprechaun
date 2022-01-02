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
get_pkg_version <- function(pkg = "leprechaun"){
	as.character(utils::packageVersion(pkg))
}

#' Template Replace
#' 
#' Replace the content of a template file.
#' 
#' @param content Content to replace.
#' @param module module name.
#' @param bs_version Bootstrap version.
#' 
#' @noRd 
#' @keywords internal
tmp_replace <- function(content, module = NULL, bs_version = NULL){
	content <- gsub("#PKGNAME#", get_pkg_name(), content)

	if(!is.null(module))
		content <- gsub("#MODULE#", module, content)
	
	if(!is.null(bs_version))
		content <- gsub("#BSVERSION#", bs_version, content)

	return(content)
}

#' @noRd 
#' @keywords internal
tmp_read_replace <- function(file, module = NULL, bs_version = NULL){
	content <- read_lines(file)
	tmp_replace(content, module, bs_version)
}

#' @noRd 
#' @keywords internal
tmp_read_replace_write <- function(infile, outfile, module = NULL, bs_version = NULL){
	# paths
	infile <- collapse_path(infile)
	outfile <- collapse_path(outfile)

	# content
	content <- tmp_read_replace(infile, module, bs_version)
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
	tryCatch(
		suppressWarnings(
			readLines(...)
		),
		error = function(e) NULL
	)
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

#' Whether Project is Leprechaun
#' 
#' Whether the current project has been 
#' scaffolded with leprechaun.
#' 
#' @return Boolean
#' 
#' @noRd 
#' @keywords internal
is_leprechaun <- function(){
	fs::file_exists(LOCK_FILE)
}

#' Whether Project is Leprechaun
#' 
#' Checks whether the project is leprechaun scaffolded
#' throws an error if not.
#' 
#' @noRd 
#' @keywords internal
check_is_leprechaun <- function(){
	is <- is_leprechaun()
	if(is)
		return()
	
	stop(
		"This is not a leprechaun project, see `scaffold_leprechaun()`",
		call. = FALSE
	)
}

#' Add a package
#' 
#' Add a package to the `DESCRIPTION` file.
#' 
#' @importFrom usethis use_package
#' @importFrom cli cli_alert_success
#' 
#' @noRd 
#' @keywords internal
add_package <- function(package, type = "Imports", ...){
	cli_alert_success("Adding '{package}' to {type} in DESCRIPTION")
	suppressMessages(
		use_package(package, type, ...)
	)
}

#' Show Warning Require Build
#' 
#' Displays a warning to communicate that the
#' leprechaun build step is required to run this.
#' 
#' @importFrom cli cli_alert_warning
#' 
#' @noRd 
#' @keywords internal
require_build <- function(){
	cli_alert_warning(
		"This requires {.code leprechaun::build()}"
	)
	invisible()
}