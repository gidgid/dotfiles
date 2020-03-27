import os
from system_ops import symlink_dir


def create_and_symlink(src, dst):
    os.makedirs(dst, exist_ok=True)

    symlink_dir(
        src_dirname='/Users/gideon/dotfiles/custom_snippets',
        dst_dirname=dst,
    )


if __name__ == '__main__':
    create_and_symlink(
        src='/Users/gideon/dotfiles/custom_snippets',
        dst='/Users/gideon/.vim/plugged/ultisnips/custom_snippets'
    )
    create_and_symlink(
        src='/Users/gideon/dotfiles/ftplugin',
        dst='/Users/gideon/.vim/ftplugin'
    )
