rule swarm:
    input:
        "{path}.dereplicated.fna",
    output:
        clusters="{path}.clusters.txt",
        seeds="{path}.cluster_representatives.fna",
    log:
        "{path}.swarm.log",
    shell:
        "swarm"
        " --threads {threads}"
        " --fastidious"
        " --usearch-abundance"
        " --output {output.clusters}"
        " --seeds {output.seeds}"
        " --log {log}"
        " {input}"
