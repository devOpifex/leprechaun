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
#' @importFrom cli cli_alert_success cli_alert_warning
#' 
#' @export 
update_scaffold <- function(force = FALSE){
	check_is_leprechaun()

	# check whether an update is even required
	identical_versions <- compare_versions()

	if(!force && identical_versions){
		cli_alert_warning(
			"Scaffold version and installed leprechaun version match ({.field {get_pkg_version()}}): nothing to update"
		)
		return(invisible())
	}

	cli_alert_success(
		"Updating to leprechaun version {.field {get_pkg_version()}}"
	)

	update_r()
	update_use()
	update_main()

	invisible()
}

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
			names(confr)[i],
			"js-utils" = update_js_utils()
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