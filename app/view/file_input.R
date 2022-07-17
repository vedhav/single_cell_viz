box::use(
  shiny[moduleServer, NS, reactive, div, observeEvent, fileInput],
  magrittr[`%>%`],
  glue[glue],
  shinycssloaders[withSpinner],
)

#' @export
ui <- function(id) {
  ns <- NS(id)
  fileInput(ns("excel_file"), "Upload file", accept = ".xlsx")
}

#' @export
server <- function(id) {
  moduleServer(id, function(input, output, session) {
    observeEvent(input$excel_file, {
      print(input$excel_file)
    })
  })
}
