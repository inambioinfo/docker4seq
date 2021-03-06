% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/bwa.R
\name{bwa}
\alias{bwa}
\title{Running bwa, Li and Durbin Bioinformatics, 2009 Jul 15;25(14):1754-60}
\usage{
bwa(group = c("sudo", "docker"), fastq.folder = getwd(),
  scratch.folder = "/data/scratch", genome.folder, seq.type = c("se", "pe"),
  threads = 1, sample.id)
}
\arguments{
\item{group, }{a character string. Two options: \code{"sudo"} or \code{"docker"}, depending to which group the user belongs}

\item{fastq.folder, }{a character string indicating where gzip fastq files are located}

\item{scratch.folder, }{a character string indicating the scratch folder where docker container will be mounted}

\item{genome.folder, }{a character string indicating the folder where the indexed reference genome for bwa is located}

\item{seq.type, }{a character string indicating the type of reads to be trimmed. Two options: \code{"se"} or \code{"pe"} respectively for single end and pair end sequencing}

\item{threads, }{a number indicating the number of cores to be used from the application}

\item{sample.id, }{a character string indicating the unique id to be associated to the bam that will be created}
}
\value{
three files: dedup_reads.bam, which is sorted and duplicates marked bam file, dedup_reads.bai, which is the index of the dedup_reads.bam, and dedup_reads.stats, which provides mapping statistics
}
\description{
This function executes the docker container bwa1 where BWA is installed BWA is a read alignment package that efficiently align short sequencing reads against a large reference sequence This aligner provides optimal results with DNA-seq data
}
\examples{
\dontrun{
    #downloading fastq files
    system("wget http://130.192.119.59/public/test_R1.fastq.gz")
    system("wget http://130.192.119.59/public/test_R2.fastq.gz")
    #running bwa
    bwa(group="sudo",fastq.folder=getwd(), scratch.folder="/data/scratch",
    genome.folder="/data/scratch/hg19_exome", seq.type="pe",
    threads=24, sample.id="exome")

    #running bwa
    bwa(group="docker",fastq.folder=getwd(), scratch.folder="/data/scratch",
    genome.folder="/data/scratch/mm10bwa", seq.type="se",
    threads=24, sample.id="igg")

}
}
