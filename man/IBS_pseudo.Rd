\name{IBS_pseudo}
\alias{IBS_pseudo}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Generate IBS pseudo variables
}
\description{
If users want to calculate the IBS similarity, this function creates the IBS pseudo variables. This is in order to calculate the IBS similarity in an efficient way.
}
\usage{
IBS_pseudo(x)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{An n by q matrix of genetic variants.
%%     ~~Describe \code{x} here~~
}
}
%\details{
%%  ~~ If necessary, more details than the description above ~~
%}
\value{
It returns an n by 3p matrix of pseudo variables for efficiently calculating IBS similarity.
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
%\references{
%% ~put references to the literature/web site here ~
%}
%\author{
%%  ~~who you are~~
%}
%\note{
%%  ~~further notes~~
%}

%% ~Make other sections like Warning with \section{Warning }{....} ~

%\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
%}
\examples{

library(LGRF)

# Load data example
# Z: genotype matrix, n by q matrix

data(LGRF.example)
Z<-LGRF.example$Z
A<-IBS_pseudo(Z)

# Then the IBS matrix can be calculated by K.IBS<-AA^T.

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{IBS}
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
