\name{null.LGRF}
\alias{null.LGRF}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Fit the null model for longitudinal genetic random field model
}
\description{
Before testing a specific region using a score test, this function fits the longitudinal genetic random field model under the null hypothesis.
}
\usage{
null.LGRF(Y, time, X = NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{Y}{
The outcome variable, an n*1 matrix where n is the total number of observations
}
  \item{time}{
An n*2 matrix describing how the observations are measured. The first column is the subject id. The second column is the measured exam (1,2,3,etc.). 
}
  \item{X}{
An n*p covariates matrix where p is the total number of covariates. 
}
}
%\details{
%%  ~~ If necessary, more details than the description above ~~
%}
\value{
  It returns a list used for function test.LGRF().
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
# Y: outcomes, n by 1 matrix where n is the total number of observations
# X: covariates, n by p matrix
# time: describe longitudinal structure, n by 2 matrix
# Z: genotype matrix, m by q matrix where m is the total number of subjects

data(LGRF.example)
Y<-LGRF.example$Y;time<-LGRF.example$time;X<-LGRF.example$X;Z<-LGRF.example$Z

# Fit the null model
result.null<-null.LGRF(Y,time,X=cbind(X,time[,2]))

# *Please note that the second column of time should be included as a covairate if
# the gene by time interaction effect will be incorperated.  
}

\keyword{null model}
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
