box::use(
  shiny[...],
  magrittr[`%>%`],
  glue[glue],
  openxlsx[...],
  bs4Dash[...],
  shinycssloaders[withSpinner],
)

#' @export
ui <- function(id) {
  ns <- NS(id)
  tabItem(
    tabName = "rna_seq_clustering",
    "rna_seq_clustering"
  )
}

#' @export
server <- function(id) {
  moduleServer(id, function(input, output, session) {
  })
}
