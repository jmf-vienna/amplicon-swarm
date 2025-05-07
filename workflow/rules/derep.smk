rule dereplicate_reads:
    input:
        "{path}.fna",
    output:
        temp("{path}.dereplicated.fna"),
    log:
        "{path}.vsearch_derep.log",
    shell:
        "vsearch"
        " --threads {threads}"
        " --derep_fulllength {input}"
        " --xee"
        " --sizeout"
        " --fasta_width 0"
        " --output {output}"
        " 2> {log}"
