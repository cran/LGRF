\name{LGRF.SSD.All}
\alias{LGRF.SSD.All}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
LGRF tests for multiple regions/genes using SSD format files
}
\description{
Test the association between an outcome variable and multiple regions/genes using SSD format files.
}
\usage{
LGRF.SSD.All(SSD.INFO, result.null, Gsub.id=NULL, interGXT=FALSE, similarity='GR', 
impute.method='fixed', MinP.compare=FALSE, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{SSD.INFO}{
SSD format information file, output of function ``Open_SSD". The sets are defined by this file.
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
  \item{results}{
First column contains the set ID; Second column contains the p-values; Third column contains the number of tested SNPs.
}
}
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
%}
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

## Test all regions
# out_all<-LGRF.SSD.All(SSD.INFO, result.null)

# Example result
# out.all$results
#      SetID   P.value N.Marker
# 1  GENE_01 0.6568851       94
# 2  GENE_02 0.1822183       84
# 3  GENE_03 0.3836986      108
# 4  GENE_04 0.1265337      101
# 5  GENE_05 0.3236089      103
# 6  GENE_06 0.9401741       94
# 7  GENE_07 0.1043820      104
# 8  GENE_08 0.6093275       96
# 9  GENE_09 0.6351147      100
# 10 GENE_10 0.5631549      100

## Test all regions, and compare with GEE based MinP test
# out_all<-LGRF.SSD.All(SSD.INFO, result.null,MinP.compare=T)

# Example result
# out.all$results
#      SetID P.value P.value.MinP N.Marker
# 1  GENE_01 0.62842       1.0000       94
# 2  GENE_02 0.06558       0.2718       84
# 3  GENE_03 0.61795       1.0000      108
# 4  GENE_04 0.39667       0.7052      101
# 5  GENE_05 0.17371       0.5214      103
# 6  GENE_06 0.90104       1.0000       94
# 7  GENE_07 0.10143       0.1188      104
# 8  GENE_08 0.78082       0.3835       96
# 9  GENE_09 0.21966       0.5364      100
# 10 GENE_10 0.25468       0.3527      100

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{plink_test_all}
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
