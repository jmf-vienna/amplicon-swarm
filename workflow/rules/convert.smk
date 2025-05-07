rule convert_fastq_to_fasta:
    input:
        "{path}.fastq",
    output:
        temp("{path}.fna"),
    log:
        "{path}.convert_fastq_to_fasta.log",
    shell:
        "vsearch"
        " --threads {threads}"
        " --fasta_width 0"
        " --fastq_qmax 50"
        " --relabel_sha1"
        " --eeout"
        " --fastq_filter {input}"
        " --fastaout {output}"
        " 2> {log}"
