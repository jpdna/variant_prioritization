#!/bin/bash

module load vt/0.5

[ $# -eq 0 ] && \
{ echo -e "\nvt normalizes indels in a VCF\
           \nhttp://bioinformatics.oxfordjournals.org/content/31/13/2202\
           \n\nNeed to select a reference genome: hg19, 1000g_b37, GRCh38\
		   \nUsage: ~/bin/vt_normalize GENOME INPUT.vcf OUTPUT.vcf"; exit 1; }

genome=$1
input=$2
output=$3

if [ "$genome" == "GRCh38" ]; then
    vt normalize $2 -r /data/mcgaugheyd/genomes/GRCh38/hs38DH.fa -o $3
elif [ "$genome" == "hg19" ]; then
    vt decompose -s $2 \
	| vt normalize - -r /fdb/igenomes/Homo_sapiens/UCSC/hg19/Sequence/WholeGenomeFasta/genome.fa -o $3
elif [ "$genome" == "1000g_b37" ]; then
	vt normalize $2 -r /data/mcgaugheyd/genomes/1000g_phase2_v37/human_g1k_v37.fasta -o $3 
else
    echo "Pick either GRCh38, hg19, or 1000g_b37 reference genome"
fi

