# symlinks all files in $HOME
# symlinks custom_snippets & UltiSnips

import os


def join(f1, f2):
    return os.path.join(f1, f2)


def srcs_to_dsts(src_dirname, dst_dirname):
    src_fnames = os.listdir(src_dirname)
    return {join(src_dirname, fname): join(dst_dirname, f'.{fname}')
            for fname in src_fnames}


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


def symlink_dir(src_dirname, dst_dirname):
    srcs_to_dst_fnames = srcs_to_dsts(src_dirname, dst_dirname)
    symlink_dicts(srcs_to_dst_fnames)


def symlink_ultisnips():
    custom_dir = '/Users/gideon/.vim/plugged/ultisnips/custom_snippets'
    os.makedirs(custom_dir, exist_ok=True)

    symlink_dir(
        src_dirname='/Users/gideon/dotfiles/custom_snippets',
        dst_dirname=custom_dir,
    )


if __name__ == '__main__':
    symlink_dir(
        src_dirname='/Users/gideon/dotfiles/configs',
        dst_dirname='/Users/gideon/',
    )

    zshrc_d_dir = '/Users/gideon/.zshrc.d'
    os.makedirs(zshrc_d_dir, exist_ok=True)
    symlink_dir(
        src_dirname='/Users/gideon/dotfiles/zshrc.d',
        dst_dirname=zshrc_d_dir,
    )
