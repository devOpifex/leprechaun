#' Update
#' 
#' Update the scaffolded code to a new version of 
#' leprechaun.
#' 
#' This reads the content of the `.leprechaun` lock file
#' and updates it too.
#' 
#' @param force Force update, ignore safety checks.
#' 
#' @examples 
#' \dontrun{update_scaffold()}
#' 
#' @importFrom cli cli_alert_success cli_alert_warning cli_alert_danger
#' 
#' @export 
update_scaffold <- function(force = !interactive()){
	check_is_leprechaun()

	# check whether an update is even required
	identical_versions <- compare_versions()

	if(!force && identical_versions){
		cli_alert_warning(
			"Scaffold version and installed leprechaun version match ({.field {get_pkg_version()}}): nothing to update"
		)
		return(invisible())
	}

	proceed <- confirm_update(force)

	if(!proceed){
		cli_alert_danger("Aborting update")
		return()
	}

	cli_alert_success(
		"Updating to leprechaun version {.field {get_pkg_version()}}"
	)

	update_r()
	update_use()
	update_main()

	invisible()
}

#' @noRd 
#' @keywords internal
#' @importFrom cli cli_alert_info
update_config <- function(){
	cli_alert_info("Updating {.file R/config.R}")
	use_config_overwritable()
}

#' @noRd 
#' @keywords internal
#' @importFrom cli cli_alert_info
update_sass <- function(){
	cli_alert_info("Updating {.file inst/dev/sass.R}")
	use_sass_overwritable()
}

#' @noRd 
#' @keywords internal
#' @importFrom cli cli_alert_info
update_packer <- function(){
	cli_alert_info("Updating {.file R/assets.R}")
	use_packer(TRUE)
}

# Update Main version
update_main <- function(){
	conf <- lock_read()
	conf$version <- get_pkg_version()
	lock_write(conf)
}

#' Compare Global Versions
#' 
#' Compare the installed version of leprechaun with
#' the version set in the lockfile to assess whether
#' an update is necessary.
#' 
#' @examples 
#' \dontrun{compare_versions()}
#' 
#' @return boolean indicating whether the versions are identical
#' 
#' @noRd 
#' @keywords internal
compare_versions <- function(){
	version_current <- get_pkg_version()
	version_set <- lock_read()[["version"]]

	identical(version_current, version_set)
}

#' Update Use
#' 
#' @noRd 
#' @keywords internal
update_use <- function(){
	version <- get_pkg_version()

	conf <- lock_read()
	confuse <- conf[["uses"]]

	if(!length(confuse))
		return()

	for(i in 1:length(confuse)){
		# update functions write to the lockfile
		# we read it at every loop
		conf <- lock_read()
		confuse <- conf[["uses"]]

		# it's already on the latest version
		if(confuse[[i]] == version)
			next;

		switch(
			names(confuse)[i],
			"js-utils" = update_js_utils(),
			"html-utils" = update_html_utils(),
			"endpoint-utils" = update_endpoint_utils(),
			"sass" = update_sass(),
			"packer" = update_packer(),
			"config" = update_config(),
			"inputs" = update_inputs()
		)
	}
}

#' Update JS Utils
#' 
#' @noRd 
#' @keywords internal
update_js_utils <- function(){
	cli_alert_info("Updating {.file R/utils-js.R} and {.file srcjs/leprechaun-utils.js}")
	use_js_utils(overwrite = TRUE, quiet = TRUE)
}

#' Update HTML Utils
#' 
#' @noRd 
#' @keywords internal
update_html_utils <- function(){
	cli_alert_info("Updating {.file R/html-utils.R}")
	use_html_utils(overwrite = TRUE, quiet = TRUE)
}

#' Update Endpoint Utils
#' 
#' @noRd 
#' @keywords internal
update_endpoint_utils <- function(){
	cli_alert_info("Updating {.file R/endpoint-utils.R}")
	use_endpoints_utils(overwrite = TRUE, quiet = TRUE)
}

#' Update R
#' 
#' @noRd 
#' @keywords internal
update_r <- function(){
	version <- get_pkg_version()
	conf <- lock_read()
	confr <- conf[["r"]]

	for(i in 1:length(confr)){
		# update functions write to the lockfile
		# we read it at every loop
		conf <- lock_read()
		confr <- conf[["r"]]

		# it's already on the latest version
		if(confr[[i]] == version)
			next;

		switch(
			names(confr)[i],
			"zzz" = update_onload(),
			"assets" = update_assets(),
			"leprechaun-utils" = update_utils()
		)
	}
}

#' @noRd 
#' @keywords internal
#' @importFrom cli cli_alert_info
update_onload <- function(){
	cli_alert_info("Updating {.file R/zzz.R}")
	create_onload(TRUE)
}

#' @noRd 
#' @keywords internal
#' @importFrom cli cli_alert_info
update_assets <- function(){
	cli_alert_info("Updating {.file R/assets.R}")
	create_assets(TRUE)
}

#' @noRd 
#' @keywords internal
#' @importFrom cli cli_alert_info
update_utils <- function(){
	cli_alert_info("Updating {.file R/leprechaun-utils.R}")
	create_utils(TRUE)
}

#' @noRd 
#' @keywords internal
#' @importFrom cli cli_alert_info
update_inputs <- function(){
	cli_alert_info("Updating {.file R/input-handlers.R}")
	create_onload(TRUE)
}

#' Confirm Update
#' 
#' Confirm with user that updates need to nbe made.
#' Prints useful messages to decide whether to update.
#' 
#' @param force Force update, ignore safety checks.
#' 
#' @return Boolean indicating whether the user wants to
#' proceed.
#' 
#' @importFrom cli cli_h1 cli_alert_info cli_h2 cli_li
#' 
#' @noRd 
#' @keywords internal
confirm_update <- function(force = FALSE){
	conf <- lock_read()

	cli_h1("Updating leprechaun application")
	cat("\n")
	cli_alert_info(
		"Will attempt to bump code from version {.field {conf$version}} to {.field {get_pkg_version()}}"
	)

	cli_h2("R files")
	li <- names(conf$r)
	li <- paste0("R/", li, ".R")
	cli_li(li)

	cli_h2("Uses")
	li <- names(conf$uses)
	cli_li(li)

	cat("\n")

	if(force)
		return(TRUE)

	ask()	
}

#' Prompt the user for confirmation update
#' 
#' @keywords internal
#' @noRd 
ask <- function(){

	response <- readline("Do you want to proceed? (y/n)\n")
	
	if(response != "y")
		return(FALSE)

	TRUE
}
