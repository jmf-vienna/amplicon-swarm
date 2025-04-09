rule swarm:
    input:
        "{name}.dereplicated.fna",
    output:
        "{name}.cluster_representatives.fna",
    shell:
        "swarm"
        " --threads {threads}"
        " --fastidious"
        " --usearch-abundance"
        " --seeds {output}"
        " {input}"
