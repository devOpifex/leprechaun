#' Bundle for Prod
#' 
#' Bundles packer using packer.
packer_bundle <- function(){
	has_packer <- requireNamespace("packer", quietly = TRUE)

	if(!has_packer){
		warning(
			"Requires `packer` package: `install.packages('packer')`\n", 
			"Skipping.",
			call. = FALSE
		)
		return()
	}

	packer::bundle()
}

packer_bundle()
