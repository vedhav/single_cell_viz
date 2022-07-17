box::use(
  shiny[...],
  imola[...],
  bs4Dash[...],
)
box::use(
  view / fetch_data,
  view / quality_check,
  view / filtering,
  view / normalizing,
  view / feature_selection,
  view / scaling,
  view / linear_dim_reduction,
  view / clustering,
)

#' @export
ui <- function(id) {
  ns <- NS(id)
  dashboardPage(
    title = "Single Cell RNA-Sequence Vizualization",
    dark = FALSE,
    fullscreen = TRUE,
    scrollToTop = TRUE,
    header = dashboardHeader(
      title = dashboardBrand(
        title = "RNA-Seq Data Analysis",
        color = "white",
        href = "https://appsilon.com/",
        image = "static/appsilon.svg",
        opacity = 0.8
      )
    ),
    sidebar = dashboardSidebar(
      fixed = TRUE,
      collapsed = FALSE,
      skin = "light",
      status = "primary",
      id = "sidebar",
      sidebarMenu(
        id = "current_tab",
        flat = FALSE,
        compact = FALSE,
        childIndent = TRUE,
        sidebarHeader("Single Cell RNA-Seq Data Fetch"),
        menuItem(
          "Fetch Data",
          tabName = "rna_seq_fetch_data",
          icon = icon("cloud-download")
        ),
        menuItem(
          "Quality Check",
          tabName = "rna_seq_qc",
          icon = icon("check-circle")
        ),
        menuItem(
          "Filtering",
          tabName = "rna_seq_filter",
          icon = icon("filter")
        ),
        sidebarHeader("Single Cell RNA-Seq Data Processing"),
        menuItem(
          "Normalize data",
          tabName = "rna_seq_normalize",
          icon = icon("divide")
        ),
        menuItem(
          "Feature Selection",
          tabName = "rna_seq_feature_selection",
          icon = icon("check-double")
        ),
        menuItem(
          "Scaling",
          tabName = "rna_seq_scaling",
          icon = icon("expand")
        ),
        menuItem(
          "Linear dim-reduction",
          tabName = "rna_seq_linear_dim_reduction",
          icon = icon("compress")
        ),
        sidebarHeader("Single Cell RNA-Seq Data Analysis"),
        menuItem(
          "Clustering",
          tabName = "rna_seq_clustering",
          icon = icon("layer-group")
        )
      )
    ),
    body = dashboardBody(
      tabItems(
        fetch_data$ui(ns("fetch_data")),
        quality_check$ui(ns("rna_seq_qc")),
        filtering$ui(ns("rna_seq_filter")),
        normalizing$ui(ns("rna_seq_normalize")),
        feature_selection$ui(ns("rna_seq_feature_selection")),
        scaling$ui(ns("rna_seq_scaling")),
        linear_dim_reduction$ui(ns("rna_seq_linear_dim_reduction")),
        clustering$ui(ns("rna_seq_clustering"))
      )
    )
  )
}

#' @export
server <- function(id) {
  moduleServer(id, function(input, output, session) {
    fetch_data$server("fetch_data")
    quality_check$server("rna_seq_qc")
    filtering$server("rna_seq_filter")
    normalizing$server("rna_seq_normalize")
    feature_selection$server("rna_seq_feature_selection")
    scaling$server("rna_seq_scaling")
    linear_dim_reduction$server("rna_seq_linear_dim_reduction")
    clustering$server("rna_seq_clustering")
  })
}
