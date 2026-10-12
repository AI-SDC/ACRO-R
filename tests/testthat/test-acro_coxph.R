test_data <-  lung

test_that("acro_coxph without initialising ACRO object first", {
  acroEnv$ac <- NULL
  expect_error(acro_coxph(Surv(time, status) ~ age + sex, data = test_data), "ACRO has not been initialised. Please first call acro_init()")
})

test_that("acro_coxph throws an error with multi-state arguments", {
  acro_init()
  expect_error(
    acro_coxph(Surv(time, status) ~ age + sex, data = test_data, istate = 1),
    "Multi-state models utilizing 'istate' or 'statedata' are not supported at the moment."
  )
  expect_error(
    acro_coxph(Surv(time, status) ~ age + sex, data = test_data, statedata = test_data),
    "Multi-state models utilizing 'istate' or 'statedata' are not supported at the moment."
  )
})

test_that("acro_coxph validates the left side of the formula uses Surv() function", {
  acro_init()
  expect_error(
    acro_coxph(time ~ age + sex, data = test_data),
    "The left-hand side of the formula must use Surv\\(\\)"
  )
})

test_that("acro_coxph works", {
  acro_init()

  # R survival model
  r_model <- survival::coxph(Surv(time, status) ~ age + sex, data = test_data)
  r_coefs <- stats::coef(r_model)

  # ACRO model
  acro_model <- acro_coxph(Surv(time, status) ~ age + sex, data = test_data)

  # Compare the coefficients
  expect_equal(
    py_to_r(unname(acro_model$params_["age"])),
    unname(r_coefs["age"]),
    tolerance = 0.05
  )
  expect_equal(
    py_to_r(unname(acro_model$params_["sex"])),
    unname(r_coefs["sex"]),
    tolerance = 0.05
  )
})

test_that("acro_coxph with subsetting", {
  acro_init()

  # R survival model
  r_model <- survival::coxph(Surv(time, status) ~ age + sex, data = test_data, subset = age > 50)
  r_coefs <- stats::coef(r_model)

  # ACRO model
  acro_model <- acro_coxph(Surv(time, status) ~ age + sex, data = test_data, subset = age > 50)

  # Compare the coefficients
  expect_equal(
    py_to_r(unname(acro_model$params_["age"])),
    unname(r_coefs["age"]),
    tolerance = 0.05
  )
  expect_equal(
    py_to_r(unname(acro_model$params_["sex"])),
    unname(r_coefs["sex"]),
    tolerance = 0.05
  )
})

test_that("acro_coxph with na.action", {
  acro_init()

  # R survival model
  r_model <- survival::coxph(Surv(time, status) ~ age + sex, data = test_data, na.action = na.pass)
  r_coefs <- stats::coef(r_model)

  # ACRO model
  acro_model <- acro_coxph(Surv(time, status) ~ age + sex, data = test_data, na.action = na.pass)

  # Compare the coefficients
  expect_equal(
    py_to_r(unname(acro_model$params_["age"])),
    unname(r_coefs["age"]),
    tolerance = 0.05
  )
  expect_equal(
    py_to_r(unname(acro_model$params_["sex"])),
    unname(r_coefs["sex"]),
    tolerance = 0.05
  )
})

test_that("acro_coxph with unvalid status options(eg. having a status as 4)", {
  acro_init()
  test_data$status[test_data$status == 1] <- 4

  expect_error(
    acro_coxph(Surv(time, status) ~ age + sex, data = test_data),
    "In Surv\\(time, status\\) : Invalid status values"
  )
})

test_that("acro_coxph with weights as a column from the dataset", {
  acro_init()

  #add a weight column in the dataset
  test_data$my_weights <- runif(nrow(test_data), 0.8, 1.2)

  # R survival model
  r_model <- survival::coxph(Surv(time, status) ~ age + sex, data = test_data, weights = my_weights)
  r_coefs <- stats::coef(r_model)

  acro_model <- acro_coxph(Surv(time, status) ~ age + sex, data = test_data, weights = my_weights)

  # Compare the coefficients
  expect_equal(
    py_to_r(unname(acro_model$params_["age"])),
    unname(r_coefs["age"]),
    tolerance = 0.05
  )
  expect_equal(
    py_to_r(unname(acro_model$params_["sex"])),
    unname(r_coefs["sex"]),
    tolerance = 0.05
  )
})

test_that("acro_coxph with weights as a string column name from the dataset", {
  acro_init()

  #add a weight column in the dataset
  test_data$my_weights <- runif(nrow(test_data), 0.8, 1.2)

  # R survival model
  r_model <- survival::coxph(Surv(time, status) ~ age + sex, data = test_data, weights = my_weights)
  r_coefs <- stats::coef(r_model)

  acro_model <- acro_coxph(Surv(time, status) ~ age + sex, data = test_data, weights = "my_weights")

  # Compare the coefficients
  expect_equal(
    py_to_r(unname(acro_model$params_["age"])),
    unname(r_coefs["age"]),
    tolerance = 0.05
  )
  expect_equal(
    py_to_r(unname(acro_model$params_["sex"])),
    unname(r_coefs["sex"]),
    tolerance = 0.05
  )
})

test_that("acro_coxph with weights provided by the user", {
  acro_init()

  #define a vector weight
  my_weights <-  runif(nrow(test_data), 0.8, 1.2)

  # R survival model
  r_model <- survival::coxph(Surv(time, status) ~ age + sex, data = test_data, weights = my_weights)
  r_coefs <- stats::coef(r_model)

  acro_model <- acro_coxph(Surv(time, status) ~ age + sex, data = test_data, weights = my_weights)

  # Compare the coefficients
  expect_equal(
    py_to_r(unname(acro_model$params_["age"])),
    unname(r_coefs["age"]),
    tolerance = 0.05
  )
  expect_equal(
    py_to_r(unname(acro_model$params_["sex"])),
    unname(r_coefs["sex"]),
   tolerance = 0.05
  )
})

test_that("acro_coxph with cluster as a column in the dataset", {
  acro_init()

  # R survival model
  r_model <- survival::coxph(Surv(time, status) ~ age + sex, data = test_data, cluster = inst)
  r_coefs <- stats::coef(r_model)

  acro_model <- acro_coxph(Surv(time, status) ~ age + sex, data = test_data, cluster = inst)

  # Compare the coefficients
  expect_equal(
    py_to_r(unname(acro_model$params_["age"])),
    unname(r_coefs["age"]),
    tolerance = 0.05
  )
  expect_equal(
    py_to_r(unname(acro_model$params_["sex"])),
    unname(r_coefs["sex"]),
    tolerance = 0.05
  )
})

test_that("acro_coxph with cluster as a quoted column name in the dataset", {
  acro_init()

  # R survival model
  r_model <- survival::coxph(Surv(time, status) ~ age + sex, data = test_data, cluster = inst)
  r_coefs <- stats::coef(r_model)

  acro_model <- acro_coxph(Surv(time, status) ~ age + sex, data = test_data, cluster = "inst")

  # Compare the coefficients
  expect_equal(
    py_to_r(unname(acro_model$params_["age"])),
    unname(r_coefs["age"]),
    tolerance = 0.05
  )
  expect_equal(
    py_to_r(unname(acro_model$params_["sex"])),
    unname(r_coefs["sex"]),
    tolerance = 0.05
  )
})

test_that("acro_coxph with cluster provided by the user", {
  acro_init()

  #define a cluster vector
  my_cluster <- sample(1:10, size = nrow(test_data), replace = TRUE)

  # R survival model
  r_model <- survival::coxph(Surv(time, status) ~ age + sex, data = test_data, cluster = my_cluster)
  r_coefs <- stats::coef(r_model)

  acro_model <- acro_coxph(Surv(time, status) ~ age + sex, data = test_data, cluster = my_cluster)

  # Compare the coefficients
  expect_equal(
    py_to_r(unname(acro_model$params_["age"])),
    unname(r_coefs["age"]),
    tolerance = 0.05
  )
  expect_equal(
    py_to_r(unname(acro_model$params_["sex"])),
    unname(r_coefs["sex"]),
    tolerance = 0.05
  )
})

test_that("acro_coxph warns on unused arguments in ...", {
  acro_init()

  expect_warning(
    acro_coxph(Surv(time, status) ~ age, data = test_data, dump_arg = 999),
    "Unused arguments were provided: dump_arg"
  )
})
