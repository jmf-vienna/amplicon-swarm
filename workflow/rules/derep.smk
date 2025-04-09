rule dereplicate_reads:
    input:
        "{path}.fna",
    output:
        "{path}.dereplicated.fna",
    log:
        "{path}.vsearch_derep.log",
    shell:
        "vsearch"
        " --threads {threads}"
        " --derep_fulllength {input}"
        " --sizeout"
        " --relabel_sha1"
        " --fasta_width 0"
        " --output {output}"
        " 2> {log}"
