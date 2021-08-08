#' Create UI
#' 
#' Create the core ui function and file `ui.R`.
#' 
#' @param type Type of ui to create. 
#' Used to dynamically determine the file required
#' and its path.
#' 
#' @importFrom cli cli_alert_success
#' 
#' @noRd 
#' @keywords internal
create_ui <- function(type = c("navbarPage", "fluidPage")){
	check_is_leprechaun()

	type <- match.arg(type)

	# build file path based on name
	file_path <- sprintf("template/R/ui-%s.R", type)

	# prepare infile and outfile for copy
	infile <- pkg_file(file_path)
	outfile <- sprintf("R/%s.R", type)

	# copy/replace file
	tmp_read_replace_write(infile, outfile)

	cli_alert_success("Creating {.file R/ui.R}")
	lock_r("ui")
}

#' Create Server
#' 
#' Create basic server function and file `server.R`.
#' 
#' @importFrom cli cli_alert_success
#' 
#' @noRd 
#' @keywords internal
create_server <- function(){
	check_is_leprechaun()
	outfile <- c("R", "server.R")
	infile <- pkg_file("template", outfile)
	copy_file(infile, outfile)
	cli_alert_success("Creating {.file R/server.R}")
	lock_r("server")
}

#' Create Assets
#' 
#' Create assets function and file `assets.R`.
#' 
#' @importFrom cli cli_alert_success
#' 
#' @export 
create_assets <- function(){
	check_is_leprechaun()
	outfile <- c("R", "assets.R")
	infile <- pkg_file("template", outfile)
	tmp_read_replace_write(infile, outfile)
	cli_alert_success("Creating {.file R/assets.R}")
	lock_r("assets")
}

#' Create onLoad
#' 
#' Create `zzz.R` file containing `.onLoad` function.
#' 
#' @importFrom cli cli_alert_success
#' 
#' @export 
create_onload <- function(){
	check_is_leprechaun()
	outfile <- c("R", "zzz.R")
	infile <- pkg_file("template", outfile)
	tmp_read_replace_write(infile, outfile)
	cli_alert_success("Creating {.file R/zzz.R}")
	lock_r("zzz")
}

#' Create Run
#' 
#' Create `run.R` file to launch the app.
#' 
#' @importFrom cli cli_alert_success
#' 
#' @export 
create_run <- function(){
	check_is_leprechaun()
	outfile <- c("R", "run.R")
	infile <- pkg_file("template", outfile)
	copy_file(infile, outfile)
	cli_alert_success("Creating {.file R/run.R}")
	lock_r("run")
}

#' Create Utils
#' 
#' Create `utils.R` file containing helper functions.
#' 
#' @importFrom cli cli_alert_success
#' 
#' @export 
create_utils <- function(){
	check_is_leprechaun()
	outfile <- c("R", "leprechaun-utils.R")
	infile <- pkg_file("template", outfile)
	copy_file(infile, outfile)
	cli_alert_success("Creating {.file R/leprechaun-utils.R}")
	lock_r("utils")
}

#' Create Image directory
#' 
#' Create the image directory within `inst`
#' 
#' @importFrom cli cli_alert_success
#' @importFrom fs dir_create file_create
#' 
#' @noRd 
#' @keywords internals
create_dir_img <- function(){
	check_is_leprechaun()
	dir_create("inst/img", recurse = TRUE)
	file_create("inst/img/.gitkeep")
	cli_alert_success("Creating {.file inst/img}")
}

#' Create Assets directory
#' 
#' Create the assets directory within `inst`
#' to store CSS, and JavaScript files.
#' 
#' @importFrom cli cli_alert_success
#' @importFrom fs dir_create file_create
#' 
#' @noRd 
#' @keywords internals
create_dir_assets <- function(){
	check_is_leprechaun()
	dir_create("inst/assets", recurse = TRUE)
	file_create("inst/assets/.gitkeep")
	cli_alert_success("Creating {.file inst/assets}")
}

#' Create Dev directory
#' 
#' Create dev directory to store (optional)
#' development helper scripts.
#' 
#' @importFrom cli cli_alert_success
#' @importFrom fs dir_create file_create
#' 
#' @noRd 
#' @keywords internals
create_dir_dev <- function(){
	check_is_leprechaun()
	dir_create("inst/dev", recurse = TRUE)
	file_create("inst/dev/.gitkeep")
	cli_alert_success("Creating {.file inst/dev}")
}
