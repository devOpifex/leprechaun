LOCK_FILE <- ".leprechaun"

#' Create Lock File
#'
#' Create `.leprechaun` lock file.
#' This is currently not used but will likely
#' be useful in the future to correctly update 
#' leprechaun projects.
#' 
#' @examples 
#' \dontrun{lock_create()}
#' 
#' @importFrom cli cli_alert_success
#' @importFrom jsonlite write_json
#' 
#' @noRd 
#' @keywords internal
lock_create <- function(){
	conf <- list(
		package = get_pkg_name(),
		version = get_pkg_version()
	)
	lock_write(conf)
	cli_alert_success("Creating {.file {LOCK_FILE}}")
}

#' @importFrom fs file_exists
lock_exists <- function(){
	file_exists(LOCK_FILE)
}

#' @importFrom jsonlite read_json
lock_read <- function(){
	jsonlite::read_json(LOCK_FILE)
}

#' @importFrom jsonlite toJSON
lock_write <- function(conf){
	jsonlite::write_json(
		conf, 
		path = LOCK_FILE, 
		auto_unbox = TRUE,
		pretty = TRUE
	)
}

#' @keywords internal
lock_get_bs_version <- function(){
	lock_read()$bs_version
}

#' Change Lock
#' 
#' Change a `file` entry version in the lockfile.
#' 
#' @param key,value Key value pair to set.
#' 
#' @examples 
#' \dontrun{lock_r("aVariable")}
#' 
#' @noRd 
#' @keywords internal
lock_r <- function(key, value = get_pkg_version()) {
	lock_change(key, value, parent = "r")
}

#' @noRd 
#' @keywords internal
lock_use <- function(key, value = get_pkg_version()) {
	lock_change(key, value, parent = "uses")
}

#' @noRd 
#' @keywords internal
lock_change <- function(key, value, parent = "r"){
	conf <- lock_read()
	conf[[parent]][[key]] <- value
	lock_write(conf)
}