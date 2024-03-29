#' Create UI
#' 
#' Create the core ui function and file `ui.R`.
#' 
#' @param type Type of ui to create. 
#' Used to dynamically determine the file required
#' and its path.
#' @param quiet Whether to print messages to the console.
#' @param bs_version Bootstrap version to use.
#' 
#' @examples 
#' \dontrun{create_ui()}
#' 
#' @importFrom cli cli_alert_success
#' 
#' @noRd 
#' @keywords internal
create_ui <- function(
	type = c("navbarPage", "fluidPage"),
	bs_version = bootstrap_version(),
	quiet = FALSE
){
	check_is_leprechaun()

	type <- match.arg(type)

	# build file path based on name
	file_path <- sprintf("template/R/ui-%s.R", type)

	# prepare infile and outfile for copy
	infile <- pkg_file(file_path)
	outfile <- "R/ui.R"

	# copy/replace file
	tmp_read_replace_write(infile, outfile, bs_version = bs_version)

	conf <- lock_read()
	conf$bs_version <- bs_version
	lock_write(conf)

	lock_r("ui")
	if(!quiet)
		cli_alert_success("Creating {.file R/ui.R}")
	
	invisible()
}

#' Default Bootstrap Version
#' 
#' Gets the default Bootstrap version based 
#' on the Shiny version installed.
#' Shiny > 1.6 uses version 5 while
#' earlier version use Bootstrap 4.
#' 
#' @examples 
#' bootstrap_version()
#' 
#' @return An integer denoting the Bootstrap version.
#' 
#' @export
bootstrap_version <- function() {
	version <- utils::packageVersion("shiny")

	version <- strsplit(
		as.character(
			version
			)
		, 
		"\\.")[[1]]

	version <- as.numeric(
		paste0(
			version[1],
			".",
			version[2]
		)
	)

	if(version > 1.6)
		return(5L)

	4L
}

#' Create Server
#' 
#' Create basic server function and file `server.R`.
#' 
#' @param quiet Whether to print messages to the console.
#' 
#' @examples 
#' \dontrun{create_server()}
#' 
#' @importFrom cli cli_alert_success
#' 
#' @noRd 
#' @keywords internal
create_server <- function(quiet = FALSE){
	check_is_leprechaun()
	outfile <- c("R", "server.R")
	infile <- pkg_file("template", outfile)
	copy_file(infile, outfile)

	lock_r("server")

	if(!quiet)
		cli_alert_success("Creating {.file R/server.R}")

	invisible()
}

#' Create Assets
#' 
#' Create assets function and file `assets.R`.
#' 
#' @param quiet Whether to print messages to the console.
#' 
#' @examples 
#' \dontrun{create_assets()}
#' 
#' @return Invisibly returns `NULL`, called for 
#' side-effects.
#' 
#' @importFrom cli cli_alert_success
#' 
#' @export 
create_assets <- function(quiet = FALSE){
	check_is_leprechaun()
	outfile <- c("R", "assets.R")
	infile <- pkg_file("template", outfile)
	tmp_read_replace_write(infile, outfile)
	lock_r("assets")

	if(!quiet)
		cli_alert_success("Creating {.file R/assets.R}")

	invisible()
}

#' Create onLoad
#' 
#' Create `zzz.R` file containing `.onLoad` function.
#' 
#' @param quiet Whether to print messages to the console.
#' 
#' @examples 
#' \dontrun{create_onload()}
#' 
#' @importFrom cli cli_alert_success
#' 
#' @export 
create_onload <- function(quiet = FALSE){
	check_is_leprechaun()
	outfile <- c("R", "zzz.R")
	infile <- pkg_file("template", outfile)
	tmp_read_replace_write(infile, outfile)
	lock_r("zzz")

	if(!quiet)
		cli_alert_success("Creating {.file R/zzz.R}")

	invisible()
}

#' Create Run
#'
#' Create `run.R` file to launch the app.
#' 
#' @param quiet Whether to print messages to the console.
#' 
#' @examples 
#' \dontrun{create_run()}
#' 
#' @importFrom cli cli_alert_success
#' 
#' @noRd 
#' @keywords internal 
create_run <- function(quiet = FALSE){
	check_is_leprechaun()
	outfile <- c("R", "run.R")
	infile <- pkg_file("template", outfile)
	tmp_read_replace_write(infile, outfile)
	lock_r("run")

	if(!quiet)
		cli_alert_success("Creating {.file R/run.R}")

	invisible()
}

#' Create Utils
#' 
#' Create `utils.R` file containing helper functions.
#' 
#' @param quiet Whether to print messages to the console.
#' 
#' @examples 
#' \dontrun{create_utils()}
#' 
#' @importFrom cli cli_alert_success
#' 
#' @export 
create_utils <- function(quiet = FALSE){
	check_is_leprechaun()
	outfile <- c("R", "leprechaun-utils.R")
	infile <- pkg_file("template", outfile)
	copy_file(infile, outfile)
	lock_r("leprechaun-utils")

	if(!quiet)
		cli_alert_success("Creating {.file R/leprechaun-utils.R}")
	
	invisible()
}

#' Create Image directory
#' 
#' Create the image directory within `inst`
#' 
#' @param quiet Whether to print messages to the console.
#' 
#' @examples 
#' \dontrun{create_dir_img()}
#' 
#' @importFrom cli cli_alert_success
#' @importFrom fs dir_create file_create
#' 
#' @noRd 
#' @keywords internals
create_dir_img <- function(quiet = FALSE){
	check_is_leprechaun()
	dir_create("inst/img", recurse = TRUE)
	file_create("inst/img/.gitkeep")

	if(!quiet)
		cli_alert_success("Creating {.file inst/img}")

	invisible()
}

#' Create Assets directory
#' 
#' Create the assets directory within `inst`
#' to store CSS, and JavaScript files.
#' 
#' @param quiet Whether to print messages to the console.
#' 
#' @examples 
#' \dontrun{create_dir_assets()}
#' 
#' @importFrom cli cli_alert_success
#' @importFrom fs dir_create file_create
#' 
#' @noRd 
#' @keywords internals
create_dir_assets <- function(quiet = FALSE){
	check_is_leprechaun()
	dir_create("inst/assets", recurse = TRUE)
	file_create("inst/assets/.gitkeep")

	if(!quiet)
		cli_alert_success("Creating {.file inst/assets}")

	invisible()
}

#' Create Dev directory
#' 
#' Create dev directory to store (optional)
#' development helper scripts.
#' 
#' @param quiet Whether to print messages to the console.
#' 
#' @examples 
#' \dontrun{create_dir_dev()}
#' 
#' @importFrom cli cli_alert_success
#' @importFrom fs dir_create file_create
#' 
#' @noRd 
#' @keywords internals
create_dir_dev <- function(quiet = FALSE){
	check_is_leprechaun()
	dir_create("inst/dev", recurse = TRUE)
	file_create("inst/dev/.gitkeep")

	if(!quiet)
		cli_alert_success("Creating {.file inst/dev}")

	invisible()
}

#' Create Run Directory
#' 
#' Create the image directory within `inst`
#' 
#' @param quiet Whether to print messages to the console.
#' 
#' @examples 
#' \dontrun{create_dir_run()}
#' 
#' @importFrom cli cli_alert_success
#' @importFrom fs dir_create file_copy
#' 
#' @noRd 
#' @keywords internals
create_dir_run <- function(quiet = FALSE){
	check_is_leprechaun()
	dir_create("inst/run/", recurse = TRUE)
	file_copy(
		pkg_file("run", "dev.R"),
		c("inst/run/app.R")
	)

	if(!quiet)
		cli_alert_success("Creating {.file inst/run/app.R}")

	invisible()
}

#' Disable Autoload
#' 
#' Adds the `_disable_autoload.R` file.
#' 
#' @param quiet Whether to print messages to the console.
#' 
#' @examples 
#' \dontrun{create_disable_autoload()}
#' 
#' @importFrom cli cli_alert_success
#' 
#' @noRd 
#' @keywords internal
create_disable_autoload <- function(quiet = FALSE){
	check_is_leprechaun()
	outfile <- c("R", "_disable_autoload.R")
	infile <- pkg_file("template", outfile)
	copy_file(infile, outfile)

	if(!quiet)
		cli_alert_success("Creating {.file R/_disable_autoload.R}")

	invisible()
}

#' Create Input Handlers
#' 
#' Create input handlers functions and file `inputs-handlers.R`.
#' 
#' @param quiet Whether to print messages to the console.
#' 
#' @examples 
#' \dontrun{create_input_handlers()}
#' 
#' @importFrom cli cli_alert_success
#' 
#' @export 
create_input_handlers <- function(quiet = FALSE){
	check_is_leprechaun()
	outfile <- c("R", "input-handlers.R")
	infile <- pkg_file("template", outfile)
	tmp_read_replace_write(infile, outfile)
	lock_r("inputs")

	if(!quiet)
		cli_alert_success("Creating {.file R/input-handlers.R}")

	invisible()
}