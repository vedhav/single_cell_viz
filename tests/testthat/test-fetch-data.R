box::use(
  shiny[testServer],
  testthat[...],
)
box::use(
  ../../app/view/fetch_data[...],
)

test_that("Fetch UI works fine", {
  expect_equal(class(ui("a")), "shiny.tag")
})
