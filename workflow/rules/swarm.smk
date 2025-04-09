rule swarm:
    input:
        "{path}.dereplicated.fna",
    output:
        clusters="{path}.clusters.txt",
        seeds="{path}.cluster_representatives.fna",
        stats="{path}.swarm_stats.tsv",
    log:
        "{path}.swarm.log",
    shell:
        "swarm"
        " --threads {threads}"
        " --fastidious"
        " --usearch-abundance"
        " --output {output.clusters}"
        " --seeds {output.seeds}"
        " --statistics-file {output.stats}"
        " --log {log}"
        " {input}"
