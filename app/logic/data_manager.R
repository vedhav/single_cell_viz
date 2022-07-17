box::use(
  shiny[...],
  magrittr[`%>%`],
  glue[glue],
  shinycssloaders[withSpinner],
)

#' @export
init <- function(id) {
  moduleServer(id, function(input, output, session) {
    state <- do.call(reactiveValues, list(
      raw_matric_data = NULL,
      gene_expression_object = NULL,
      enable_qc = FALSE,
      enable_filtering = FALSE,
      enable_normalization = FALSE,
      enable_feature_selection = FALSE,
      enable_scaling = FALSE,
      enable_dim_reduction = FALSE,
      emable_clustering = FALSE
    ))
    return(state)
  })
}
