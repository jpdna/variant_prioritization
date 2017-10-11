# Genomic Variant Prioritization
Worklow post-genotype calling to prioritize disease-causing variants.
https://github.com/davemcg/NGS_genotype_calling

# Input
Multi-sample VCF from GVCF_to_hardFilteredVCF.sh or VCF_to_VQSRfilteredVCF.sh

# Create Gemini DB
sbatch --cpus-per-task 16 GATK_vcf_to_geminiDB.sh your.vcf your.ped name_of_your_to_be_created_gemini.db

# Create custom report for subject
sbatch query_gemini_wrapper.sh name_of_your_to_be_created_gemini.db family_name_from_ped report_name.xls

# Note: If you are only processing a small set of samples (like a trio), then you need to modify query_gemini.py to NOT filter on AF < 0.1
sbatch query_gemini_wrapper.sh name_of_your_to_be_created_gemini.db family_name_from_ped report_name.xls 0.6
