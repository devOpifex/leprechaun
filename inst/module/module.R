#' #MODULE# UI
#' 
#' @param id Unique id for module instance.
#' 
#' @keywords internal
#MODULE#UI <- function(id){
	ns <- NS(id)

	tagList(
		h2("#MODULE#")
	)
}

#' #MODULE# Server
#' 
#' @param id Unique id for module instance.
#' 
#' @keywords internal
#MODULE#_server <- function(id){
	moduleServer(
		id,
		function(
			input, 
			output, 
			session
			){
				
				ns <- session$ns
				send_message <- make_send_message(session)

				# your code here
		}
	)
}

# UI
# #MODULE#UI('id')

# server
# #MODULE#_server('id')
