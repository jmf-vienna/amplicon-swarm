def get_config():
    return config["default"]


def get_maxee_rate():
    try:
        return get_config()["filter"]["fastq"]["ee rate"]
    except KeyError:
        return 1.0


def get_min_unique_size():
    try:
        return get_config()["filter"]["fastq"]["count sum"]
    except KeyError:
        return 2
