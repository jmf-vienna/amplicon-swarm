rule convert_fastq_to_fasta:
    input:
        "{dir}/{file}.fastq",
    output:
        temp("{dir}/{file}.fna"),
    log:
        "{dir}/{file}.convert_fastq_to_fasta.log",
    shell:
        "vsearch"
        " --threads {threads}"
        " --fasta_width 0"
        " --fastq_qmax 50"
        " --relabel_sha1"
        " --sample {wildcards.file}"
        " --eeout"
        " --lengthout"
        " --fastq_filter {input}"
        " --fastaout {output}"
        " 2> {log}"
