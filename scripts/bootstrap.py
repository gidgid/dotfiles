import os
from system_ops import symlink_dir, create_and_symlink


if __name__ == '__main__':
    home_dir = os.path.expanduser('~')

    symlink_dir(
        src_dirname=f'{home_dir}/dotfiles/configs',
        dst_dirname=f'{home_dir}/',
    )
    create_and_symlink(
        src=f'{home_dir}/dotfiles/zshrc.d',
        dst=f'{home_dir}/.zshrc.d'
    )
