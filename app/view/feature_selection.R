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
    tabName = "rna_seq_feature_selection",
    "rna_seq_feature_selection"
  )
}

#' @export
server <- function(id) {
  moduleServer(id, function(input, output, session) {
  })
}
