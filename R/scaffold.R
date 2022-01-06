#' Scaffold Leprechaun
#' 
#' Scaffolds a leprechaun project.
#' This must be run from within a package
#' and should only be run once per project.
#' 
#' @param ui Type of UI to use.
#' @param overwrite Whether to force overwrite all files.
#' This is not recommended, make sure you have save and/or
#' committed and checked that the files that will be overwritten
#' can be before proceeding with this option.
#' @param bs_version Bootstrap version to use.
#' If shiny > 1.6 is installed defaults to version 5,
#' otherwise version 4.
#' 
#' @examples 
#' \dontrun{scaffold()}
#' 
#' @importFrom cli cli_h1 cli_h2
#' @importFrom fs file_exists
#' @importFrom usethis use_build_ignore
#' 
#' @export 
scaffold <- function(
	ui = c("navbarPage", "fluidPage"),
	bs_version = bootstrap_version(),
	overwrite = FALSE
){
	ui <- match.arg(ui)

	# check that it is run within a package
	if(!file_exists("DESCRIPTION"))
		stop("This does not appear to be a package", call. = FALSE)
	
	if(!overwrite && base_file_exist())
		stop(
			"Project already scaffolded. ",
			"You can overwrite all the scaffold with ",
			"`scaffold_leprechaun(overwrite = TRUE)`.",
			"This is NOT recommended.",
			call. = FALSE
		)

	cli_h1("Scaffolding leprechaun app")
	
	# create lock file
	cli_h2("Creating lock file")
	lock_create()

	# add dependencies
	cli_h2("Adding dependencies")
	add_package("shiny")
	add_package("bslib")
	add_package("htmltools")
	add_package("pkgload", type = "Suggests")
	cat("\n")

	# copy files
	cli_h2("Generating code")
	create_ui(ui, bs_version)
	create_assets()
	create_run()
	create_server()
	create_utils()
	create_disable_autoload()
	create_onload()
	create_input_handlers()

	# images
	cat("\n")
	create_dir_dev()
	create_dir_assets()
	create_dir_img()
	create_dir_run()

	# ignore files
	cli_h2("Ignoring files")
	use_build_ignore(".leprechaun")
}
