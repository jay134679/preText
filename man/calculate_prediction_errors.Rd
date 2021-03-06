% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/calculate_prediction_errors.R
\name{calculate_prediction_errors}
\alias{calculate_prediction_errors}
\title{Calculate mean prediction error for preprocessing decisions.}
\usage{
calculate_prediction_errors(positions_list, preprocessing_choices)
}
\arguments{
\item{positions_list}{A list of scaled document positions generated by the
`scaling_comparison()` functions and returned from that function in the
`$scaled_positions` slot in the list object.}

\item{preprocessing_choices}{A data frame containing binary indicators of
wether each preprocessing decision was applied for each dfm. This is returned
by the `factorial_preprocessing()` function as part of its output.}
}
\value{
A vector of mean prediction errors.
}
\description{
Use scaled positions to predict preprocessing decisions.
}
\examples{
\dontrun{
# *** This function is used automatically inside of the preText() function.
# load the package
library(preText)
# load in the data
data("UK_Manifestos")
# preprocess data
preprocessed_documents <- factorial_preprocessing(
    UK_Manifestos,
    use_ngrams = TRUE,
    infrequent_term_threshold = 0.02,
    verbose = TRUE)
# scale documents
scaling_results <- scaling_comparison(preprocessed_documents$dfm_list,
                                      dimensions = 2,
                                      distance_method = "cosine",
                                      verbose = TRUE)
# get prediction errors
pred_errors <- calculate_prediction_errors(
     scaling_results$scaled_positions,
     preprocessed_documents$choices)
}
}

