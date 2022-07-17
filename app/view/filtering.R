box::use(
  shiny[...],
  magrittr[`%>%`],
  glue[glue],
  bs4Dash[...],
  shinycssloaders[withSpinner],
)

#' @export
ui <- function(id) {
  ns <- NS(id)
  tabItem(
    tabName = "rna_seq_filter",
    "rna_seq_filter"
  )
}

#' @export
server <- function(id) {
  moduleServer(id, function(input, output, session) {
  })
}
