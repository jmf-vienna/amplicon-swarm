rule convert_fastq_to_fasta:
    input:
        "{name}.fastq",
    output:
        "{name}.fna",
    shell:
        """
        seqkit fq2fa --threads {threads} {input} > {output}
        """
