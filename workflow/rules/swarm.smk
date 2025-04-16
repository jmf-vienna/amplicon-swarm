rule swarm:
    input:
        "{path}.dereplicated.fna",
    output:
        clusters=temp("{path}.clusters.txt"),
        seeds=temp("{path}.cluster_representatives.fna"),
        stats=temp("{path}.swarm_stats.tsv"),
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


rule swarm_stats_pretty:
    input:
        "{path}.swarm_stats.tsv",
    output:
        temp("{path}.swarm_stats_pretty.tsv"),
    shell:
        """
        if [ -s {input} ]; then
            qsv rename uniques,count,feature,seed_abundance,singletons,iterations,cumulated_steps --no-headers --output {output} {input}
        else
            echo "uniques\tcount\tfeature\tseed_abundance\tsingletons\titerations\tcumulated_steps" > {output}
        fi
        """
