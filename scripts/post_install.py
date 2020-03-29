import os
from system_ops import create_and_symlink


if __name__ == '__main__':
    home_dir = os.path.expanduser('~')

    create_and_symlink(
        src=f'{home_dir}/dotfiles/custom_snippets',
        dst=f'{home_dir}/.vim/plugged/ultisnips/custom_snippets'
    )
    create_and_symlink(
        src=f'{home_dir}/dotfiles/ftplugin',
        dst=f'{home_dir}/.vim/ftplugin'
    )
