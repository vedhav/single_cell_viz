box::use(
  shiny[...],
  magrittr[`%>%`],
  glue[glue],
  bs4Dash[...],
  shinycssloaders[withSpinner],
  imola[gridPanel],
  reactable[...],
  dplyr[filter, mutate],
)

#' @export
ui <- function(id) {
  ns <- NS(id)
  tabItem(
    tabName = "rna_seq_qc",
    fluidRow(
      align = "center",
      column(12, textOutput(ns("message"))),
      column(12, reactableOutput(ns("metadata_table"))),
      column(2, offset = 3, textInput(ns("mutate_label"), "Mutate Label")),
      column(2, textInput(ns("regex_pattern"), "RegExPattern")),
      column(2, style = "margin-top: 32px;", actionButton(ns("mutate"), "Mutate"))
    )
  )
}

#' @export
server <- function(id, data_state) {
  moduleServer(id, function(input, output, session) {
    ns <- NS(id)
    metadata <- reactiveValues()
    observeEvent(data_state$enable_qc, {
      if (data_state$enable_qc) {
        output$message <- renderText({ "Use this step to QC the data" })
        output$metadata_table <- renderReactable({
          reactable(
            data_state$gene_expression_object@meta.data
          )
        })
      } else {
        output$message <- renderText({
          "This step is only possible after a successful data fetch."
        })
      }
    })
    observeEvent(input$mutate, {
      data_state$gene_expression_object[[input$mutate_label]] <- Seurat::PercentageFeatureSet(
        data_state$gene_expression_object, pattern = input$regex_pattern
      )
    })
  })
}
