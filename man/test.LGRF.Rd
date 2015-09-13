\name{test.LGRF}
\alias{test.LGRF}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Test the association between an outcome variable and a region/gene by LGRF
}
\description{
Once the model under the null model is fitted using "null.LGRF()", this function tests a specifc region/gene.
}
\usage{
test.LGRF(Z, result.null, Gsub.id=NULL, interGXT = FALSE, similarity = "GR",
impute.method="fixed")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{Z}{
Genetic variants in the target region/gene, an m*q matrix where m is the subject ID and q is the total number of genetic variables. Note that the number of rows in Z should be same as the number of subjects.
}
  \item{result.null}{
The output of function "null.LGRF()"
}
  \item{Gsub.id}{
The subject id corresponding to the genotype matrix, an m dimensional vector. This is in order to match the phenotype and genotype matrix. The default is NULL, where the order is assumed to be matched with Y, X and time.
}
  \item{interGXT}{
Whether to incorperate the gene-time interaction effect. Incorperating this effect can improve power if there is any gene-time interaction, but has slight power loss otherwise. The default is FALSE. *Please note that the second column of time should be included as a covairate when interGXT is TRUE. 
}
  \item{similarity}{
Choose the similarity measurement for the genetic variants. Can be either "GR" for genetic relationship or "IBS" for identity by state. The default is "GR" for better computational efficiency.
}
  \item{impute.method}{
Choose the imputation method when there is missing genotype. Can be "random", "fixed" or "bestguess". Given the estimated allele frequency, "random" simulates the genotype from binomial distribution; "fixed" uses the genotype expectation; "Best guess" uses the genotype with highest probability.
}
}
%\details{
%%  ~~ If necessary, more details than the description above ~~
%}
\value{
  \item{p.value}{
p-value of the LGRF test.
}
  \item{n.marker}{
number of tested SNPs in the SNP set.
}
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
## null.LGRF fits the null model. 
# Input: Y, time, X (covariates)
## test.LGRF tests a region and give p-value. 
# Input: Z (genetic variants) and result of null.longGRF

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

# The LGRF-G test
pLGRF_G<-test.LGRF(Z,result.null)

# The LGRF-GT test
pLGRF_GT<-test.LGRF(Z,result.null,interGXT=TRUE)

# The LGRF-G test using the IBS similarity
pLGRF_G_IBS<-test.LGRF(Z,result.null,similarity="IBS")

# The LGRF-GT test, main effect is modeled using the IBS similarity
pLGRF_GT_IBS<-test.LGRF(Z,result.null,interGXT=TRUE,similarity="IBS")
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{test}
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
