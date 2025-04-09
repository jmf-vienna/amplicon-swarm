rule dereplicate_reads:
    input:
        "{name}.fna",
    output:
        "{name}.dereplicated.fna",
    shell:
        "vsearch"
        " --threads {threads}"
        " --derep_fulllength {input}"
        " --sizeout"
        " --relabel_sha1"
        " --fasta_width 0"
        " --output {output}"
