#' Check Whether Files Exist
#' 
#' Check whether core files that leprechaun creates
#' already exist in the current package. 
#' This is to make sure we do no overwrite files
#' the user may have created.
#' 
#' @importFrom fs file_exists
#' 
#' @return Boolean
#' 
#' @noRd 
#' @keywords internal
base_file_exist <- function() {
	files <- c(
		"R/ui.R", 
		"R/assets.R", 
		"R/run.R", 
		"R/input-handlers.R"
	)
	exist <- file_exists(files)
	any(exist)
}

#' Sitrep
#' 
#' Run a check on the project, prints useful
#' messages.
#' 
#' @importFrom cli cli_alert_danger cli_alert_warning cli_alert_success cli_alert_info
#' 
#' @export 
leprechaun_sitrep <- function(){
	if(!lock_exists()){
		cli_alert_danger("Not a leprechaun project")
		return(invisible())
	}

	identical_versions <- compare_versions()

	if(identical_versions){
		cli_alert_success(
			"Scaffold version and installed leprechaun version match ({.field {get_pkg_version()}}): all is well!"
		)
		return(invisible())
	}

	conf <- lock_read()

	cli_alert_warning(
		"You have leprechaun version {.strong {packageVersion('leprechaun')}} installed but the project uses {.strong {conf$version}}"
	)
	cli_alert_info("You may want to run  {.fn update_scaffold}")
}