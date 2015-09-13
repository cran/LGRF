\name{LGRF.SSD.OneSet_SetIndex}
\alias{LGRF.SSD.OneSet_SetIndex}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
LGRF tests for a single region/gene using SSD format files
}
\description{
Test the association between an outcome variable and one region/gene using SSD format files.
}
\usage{
LGRF.SSD.OneSet_SetIndex(SSD.INFO, SetIndex, result.null, Gsub.id=NULL, interGXT=FALSE, 
similarity='GR', impute.method='fixed', MinP.compare=FALSE, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{SSD.INFO}{
SSD format information file, output of function ``Open_SSD". The sets are defined by this file.
}
  \item{SetIndex}{
Set index. From 1 to the total number of sets.
}
  \item{result.null}{
Output of function ``null.LGRF".
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
  \item{MinP.compare}{
Whether to compare with the GEE based minimum p-value (MinP) test. The default is FALSE. Please note that implementing the GEE based MinP test is time consuming.
  }
  \item{...}{
Other options of the GEE based MinP test. Defined same as in function ``test.MinP".
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

# * Since the Plink data files used here are hard to be included in a R package, 
# The usage is marked by "#" to pass the package check.

#library(LGRF)

##############################################

# Plink data files: File.Bed, File.Bim, File.Fam
# Files defining the sets: File.SetID, File.SSD, File.Info
# For longitudinal data, outcome and covariates are saved in a separate file: Y, time, X. 
# Null model was fitted using function null.LGRF.

# Create the MW File
# File.Bed<-"./example.bed"
# File.Bim<-"./example.bim"
# File.Fam<-"./example.fam"
# File.SetID<-"./example.SetID"
# File.SSD<-"./example.SSD"
# File.Info<-"./example.SSD.info"

# Generate SSD file
# To use binary ped files, you have to generate SSD file first.
# If you already have a SSD file, you do not need to call this function.
# Generate_SSD_SetID(File.Bed, File.Bim, File.Fam, File.SetID, File.SSD, File.Info)

# SSD.INFO<-Open_SSD(File.SSD, File.Info)
# Number of samples
# SSD.INFO$nSample
# Number of Sets
# SSD.INFO$nSets

## Fit the null model
# Y: outcomes, n by 1 matrix where n is the total number of observations
# X: covariates, n by p matrix
# time: describe longitudinal structure, n by 2 matrix
# result.null<-null.LGRF(Y,time,X=cbind(X,time[,2]))

# *Please note that the second column of time should be included as a covairate if
# the gene by time interaction effect will be incorperated. 

## Test a single region
# out_single<-LGRF.SSD.OneSet_SetIndex(SSD.INFO=SSD.INFO, SetIndex=1, 
# result.null=result.null, MinP.compare=F)

# Example result
# $p.value
# [1] 0.6284

# $n.marker
# [1] 94

## Test a single region, and compare with GEE based MinP test
# out_single<-LGRF.SSD.OneSet_SetIndex(SSD.INFO=SSD.INFO, SetIndex=1, 
# result.null=result.null,MinP.compare=T)

# $p.value
#       LGRF MinP
# [1,] 0.6284    1

# $n.marker
# [1] 94

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{plink_test_single}
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
