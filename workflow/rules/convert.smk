rule filter_and_convert_fastq_to_fasta:
    input:
        "{dir}/{file}.fastq",
    output:
        temp("{dir}/{file}.fna"),
    log:
        "{dir}/{file}.convert_fastq_to_fasta.log",
    params:
        maxee_rate=get_maxee_rate(),
    shell:
        "vsearch"
        " --threads {threads}"
        " --fasta_width 0"
        " --fastq_qmax 50"
        " --relabel_sha1"
        " --sample {wildcards.file}"
        " --eeout"
        " --lengthout"
        " --fastq_maxee_rate {params.maxee_rate}"
        " --fastq_filter {input}"
        " --fastaout {output}"
        " 2> {log}"
