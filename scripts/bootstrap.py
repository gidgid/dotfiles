import os
from system_ops import symlink_dir


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
