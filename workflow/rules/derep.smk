rule dereplicate_reads:
    input:
        "{path}.fna",
    output:
        temp("{path}.dereplicated.fna"),
    log:
        "{path}.vsearch_derep.log",
    params:
        min_unique_size=get_min_unique_size(),
    shell:
        "vsearch"
        " --threads {threads}"
        " --derep_fulllength {input}"
        " --minuniquesize {params.min_unique_size}"
        " --minseqlength 50"
        " --relabel_sha1"
        " --sizeout"
        " --fasta_width 0"
        " --output {output}"
        " 2> {log}"
