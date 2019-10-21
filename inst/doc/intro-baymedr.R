## ---- include = FALSE----------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
set.seed(123456789)

data <- data.frame(
  condition = rep(x = c("con", "exp"),
                  c(150, 180)),
  dv = c(rnorm(n = 150,
               mean = 7.3,
               sd = 3.4),
         rnorm(n = 180,
               mean = 8.9,
               sd = 3.1))
)

data[c(1:5, 151:155), ]

## ---- message = FALSE, echo = FALSE--------------------------------------
library(baymedr)

## ------------------------------------------------------------------------
mod_super_raw <- super_bf(
  x = data$dv[data$condition == "con"],
  y = data$dv[data$condition == "exp"]
)

mod_super_raw

get_bf(object = mod_super_raw)

## ---- message = FALSE, echo = FALSE--------------------------------------
library(baymedr)

## ------------------------------------------------------------------------
mod_super_sum <- super_bf(
  n_x = 201,
  n_y = 203,
  mean_x = 68.1,
  mean_y = 63.6,
  ci_margin = (15.5 - (-6.5)) / 2,
  ci_level = 0.95,
  direction = "low",
  alternative = "one.sided"
)

mod_super_sum

get_bf(object = mod_super_sum)

## ---- message = FALSE, echo = FALSE--------------------------------------
library(baymedr)

## ------------------------------------------------------------------------
mod_equiv_raw <- equiv_bf(
  x = data$dv[data$condition == "con"],
  y = data$dv[data$condition == "exp"],
  interval = 0.1,
)

mod_equiv_raw

get_bf(object = mod_equiv_raw)

## ---- message = FALSE, echo = FALSE--------------------------------------
library(baymedr)

## ------------------------------------------------------------------------
mod_equiv_sum <- equiv_bf(
  n_x = 560,
  n_y = 538,
  mean_x = 8.683,
  mean_y = 8.516,
  sd_x = 3.6,
  sd_y = 3.6
)

mod_equiv_sum

get_bf(object = mod_equiv_sum)

## ---- message = FALSE, echo = FALSE--------------------------------------
library(baymedr)

## ------------------------------------------------------------------------
mod_infer_raw <- infer_bf(
  x = data$dv[data$condition == "con"],
  y = data$dv[data$condition == "exp"],
  ni_margin = 1.5,
  ni_margin_std = FALSE
)

mod_infer_raw

get_bf(object = mod_infer_raw)

## ---- message = FALSE, echo = FALSE--------------------------------------
library(baymedr)

## ------------------------------------------------------------------------
mod_infer_sum <- infer_bf(
  n_x = 33,
  n_y = 32,
  mean_x = 17.1,
  mean_y = 13.6,
  sd_x = 8,
  sd_y = 9.8,
  ni_margin = 2,
  ni_margin_std = FALSE,
  direction = "low"
)

mod_infer_sum

get_bf(object = mod_infer_sum)

