import os


def join(f1, f2):
    return os.path.join(f1, f2)


def create_and_symlink(src, dst):
    os.makedirs(dst, exist_ok=True)

    symlink_dir(
        src_dirname=src,
        dst_dirname=dst,
        as_hidden=False
    )


def srcs_to_dsts(src_dirname, dst_dirname, as_hidden=True):
    src_fnames = os.listdir(src_dirname)
    sources_to_dests = {}
    for fname in src_fnames:
        dst_filename = f'.{fname}' if as_hidden else fname
        source = join(src_dirname, fname)
        dest = join(dst_dirname, dst_filename)
        sources_to_dests[source] = dest
    return sources_to_dests


def symlink_dicts(srcs_to_dst_fnames):
    linked = set()
    didnt_link = set()
    for src, dst in srcs_to_dst_fnames.items():
        try:
            os.symlink(src=src, dst=dst)
            linked.add(f'{dst} -> {src}')
        except FileExistsError:
            didnt_link.add(f'{dst} -> {src}')

    summary_msg = f"""
    Links succeeded: {linked}
    Links failed (already existed): {didnt_link}
    """
    print(summary_msg)


def symlink_dir(src_dirname, dst_dirname, as_hidden=True):
    srcs_to_dst_fnames = srcs_to_dsts(src_dirname, dst_dirname, as_hidden)
    symlink_dicts(srcs_to_dst_fnames)
