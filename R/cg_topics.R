#' @title Compute the center of gravity of the clusters
#'
#' @description This function computes the center of gravity for each cluster
#' by taking weighted mean of each component of features where the weights
#' are determined from the theta matrix of the topic model fit.
#'
#' @param theta The cluster probability distribution/theta matrix obtained
#' from the GoM model fitting (it is a G x K matrix where G is number
#' of features, K number of topics)
#' @param feature.comp the numeric matrix (G x L) comprising of values
#' for each feature g and feature metadata l.
#'
#' @return Returns a matrix of cluster centers of gravity for the L
#' feature metadata.
#'
#' @examples
#' N=360;
#' M=560;
#' lat <- rep(1:N, M);
#' long <- rep(1:M, each=N)
#' comp <- cbind(lat, long);
#' data(AbundanceGoM)
#' center_gravity <- cg_topics(AbundanceGoM$theta, comp);
#'
#' @export
#'
cg_topics <- function(theta, feature.comp)
{
    gravity_center_list <-
        lapply(1:dim(theta)[2],
               function(l) return(t(theta[,l]) %*% feature.comp))
    return(gravity_center_list)
}
