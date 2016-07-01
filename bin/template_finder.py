import os

exclude_dirs = (
    '.hg',
    '.git',
    '.svn',
    'node_modules',
    '__pycache__',
)


def djangoplus_find_templates(cwd, cmdline=False):
    templates = []

    for file in os.listdir(cwd):
        path = os.path.join(cwd, file)
        if file[0] == '.' or not os.path.isdir(path) or file in exclude_dirs:
            continue
        if not os.path.exists(os.path.join(path, '__init__.py')):
            continue

        for root, dirs, files in os.walk(path):
            dirs[:] = [d for d in dirs if d not in exclude_dirs]
            parts = root.split(os.path.sep)
            if 'templates' not in parts:
                continue

            i = parts.index('templates')
            i += sum(len(x) for x in parts[:i+1]) + 1
            templates.extend(os.path.join(root, x)[i:] for x in files)

    try:
        import vim
        vim.command('let s:template_cache = %s' % repr(templates).replace("u'", "'"))
    except ImportError:
        print('\n'.join(templates))


if __name__ == "__main__":
    djangoplus_find_templates(os.getcwd(), 1)
