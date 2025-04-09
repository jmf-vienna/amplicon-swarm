rule convert_fastq_to_fasta:
    input:
        "{path}.fastq",
    output:
        temp("{path}.fna"),
    shell:
        """
        seqkit fq2fa --threads {threads} {input} > {output}
        """
