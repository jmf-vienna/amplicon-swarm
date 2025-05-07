rule convert_fastq_to_fasta:
    input:
        "{path}.fastq",
    output:
        temp("{path}.fna"),
    shell:
        "vsearch"
        " --threads {threads}"
        " --fasta_width 0"
        " --fastq_qmax 50"
        " --fastq_filter {input}"
        " --fastaout {output}"
