#!/bin/bash


#load modules
module load biology bwa/0.7.17
module load biology samtools/1.8
module load biology gatk/4.1.4.1

set reference
REFERENCE=greyfox-dovetail-final.fasta
THREADS_BWA=46

bwa index -a bwtsw $REFERENCE
java -jar /oak/stanford/groups/dpetrov/armstrong/applications/picard.jar CreateSequenceDictionary R=greyfox-dovetail-final.fasta O=greyfox-dovetail-final.dict

for file in *_1.fastq.gz;do
	bn=`basename $file _1.fastq.gz`
	bwa mem -t $THREADS_BWA $REFERENCE ${bn}_1.fastq.gz ${bn}_2.fastq.gz | samtools view -bS - | samtools sort - > ${bn}.sorted.bam
	samtools index ${bn}.sorted.bam
	java -jar /oak/stanford/groups/dpetrov/armstrong/applications/picard.jar MarkDuplicates I=${bn}.sorted.bam O=${bn}.sorted.md.bam M=${bn}.metrics.md.txt
	samtools index ${bn}.sorted.md.bam
done
