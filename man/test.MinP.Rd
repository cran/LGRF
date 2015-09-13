\name{test.MinP}
\alias{test.MinP}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Test the association between an outcome variable and a region/gene by MinP
}
\description{
If users want to compare LGRF with the minimum p-value (MinP) test, this function tests a specifc region/gene by a GEE based minimum p-value test after fitting "null.LGRF()".
}
\usage{
test.MinP(Z, result.null, Gsub.id=NULL, corstr="exchangeable", MinP.adjust=0.95, 
impute.method="fixed")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{Z}{
Genetic variants in the target region/gene, an m*q matrix where m is the subject ID and q is the total number of genetic variables. Note that the number of rows in Z should be same as the number of subject.
}
  \item{result.null}{
The output of function "null.LGRF()".
}
  \item{Gsub.id}{
The subject id corresponding to the genotype matrix, an m dimensional vector. This is in order to match the phenotype and genotype matrix. The default is NULL, where the order is assumed to be matched with Y, X and time.
}
  \item{corstr}{
The working correlation as specified in 'geeglm'. The following are permitted: '"independence"', '"exchangeable"', '"ar1"', '"unstructured"' and '"userdefined".
}
  \item{MinP.adjust}{
The minimum p-value is adjusted by the number of independent tests. Choose the adjustment thereshold as specified in Gao, et al. (2008) "A multiple testing correction method for genetic association studies using correlated single nucleotide polymorphisms". Values from 0 to 1 are permitted.
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
p-value of the MinP test.
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
## test.MinP tests a region and give p-value. 
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
result.null<-null.LGRF(Y,time,X=X)

# The minimum p-value test based on GEE
pMinP<-test.MinP(Z,result.null,corstr="exchangeable",MinP.adjust=0.95)

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{test}
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
