#!/bin/bash

# This script should be run from the root directory of the checkout.

set -e
set -x

# If needed run:
# bunzip2 -k data/derived/raw_mutations.csv.bz2

IN=data/derived/raw_mutations.csv
OUT=data/derived/annotated_mutations.csv

# Change to path to your grch37 reference fasta.
REFERENCE_FASTA=~ahujaa01/reference_genomes/human_g1k_v37.fasta

time varlens-variants \
    $IN \
    --chunk-rows 10000 \
    --survive-errors \
    --include-effect \
    --include-gene \
    --include-context \
    --reference $REFERENCE_FASTA \
    --hla-file data/external/hla_types.csv \
    --include-read-evidence \
    --read-sources-file data/derived/sources.simple.csv \
    --read-sources-id-column source_id \
    --read-sources-column bam_path_tumor_dna \
    --read-sources-column bam_path_tumor_rna \
    --include-mhc-binding \
    --rename-column bam_path_tumor_dna_count_num_alt dna_alt_reads \
    --rename-column bam_path_tumor_dna_count_num_ref dna_ref_reads \
    --rename-column bam_path_tumor_dna_count_total_depth dna_total_reads \
    --rename-column bam_path_tumor_rna_count_num_alt rna_alt_reads \
    --rename-column bam_path_tumor_rna_count_num_ref rna_ref_reads \
    --rename-column bam_path_tumor_rna_count_total_depth rna_total_reads \
    --out $OUT

bzip2 data/derived/annotated_mutations.csv
