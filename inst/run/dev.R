# do not deploy from this file
# see leprechaun::add_app_file()
leprechaun::build()

pkgload::load_all(
	path = "../../",
	reset = TRUE,
	helpers = FALSE
)

run()
