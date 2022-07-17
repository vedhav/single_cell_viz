box::use(
  shiny[...],
  magrittr[`%>%`],
  glue[glue],
  bs4Dash[...],
  shinycssloaders[withSpinner],
  imola[gridPanel],
  waiter[...],
)

#' @export
ui <- function(id) {
  ns <- NS(id)
  tabItem(
    tabName = "rna_seq_fetch_data",
    gridPanel(
      columns = c("2fr", "1fr", "1fr"),
      div(
        fileInput(
          ns("user_file"),
          "Gene Expression - Cell Matrix (HDF5)",
          accept = c(".h5", ".hdf5")
        )
      ),
      div(
        numericInput(
          ns("min_cells"),
          "Minimum Number of Cells",
          min = 1,
          max = 100,
          value = 3,
          step = 1
        )
      ),
      div(
        numericInput(
          ns("min_features"),
          "Minimum Number of Features",
          min = 1,
          max = 1000000,
          value = 200,
          step = 100
        )
      )
    )
  )
}

#' @export
server <- function(id, data_state) {
  moduleServer(id, function(input, output, session) {
    observeEvent(input$user_file, {
      w1 <- Waiter$new(html = span("Reading the file"))
      w2 <- Waiter$new(html = span("Constructing the Gene Expression Seurat Object"))
      w1$show()
      data_state$raw_matric_data <- Seurat::Read10X_h5(input$user_file$datapath)
      w1$hide()
      if ("Gene Expression" %in% names(data_state$raw_matric_data)) {
        w2$show()
        data_state$gene_expression_object <- Seurat::CreateSeuratObject(
          counts = data_state$raw_matric_data[["Gene Expression"]],
          project = "Gene Expression",
          min.cells = input$min_cells,
          min.features = input$min_features
        )
        w2$hide()
        data_state$emable_qc <- TRUE
      } else {
        showNotification(
          "Unable to find 'Gene Expression' matrix in the uploaded file",
          "error"
        )
      }
      w1$show()
      data_state$enable_qc <- TRUE
      w1$hide()
    })
  })
}
