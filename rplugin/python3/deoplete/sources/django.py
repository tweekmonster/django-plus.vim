from .base import Base


class Source(Base):
    def __init__(self, vim):
        super(Source, self).__init__(vim)
        self.name = 'django'
        self.mark = ''
        self.filetypes = ['python', 'htmldjango']
        self.input_pattern = '.\.\w*$|\|\w*$|\{%\s+\w*$'

    def get_complete_position(self, context):
        return self.vim.call('djangoplus#complete', 1, '')

    def gather_candidates(self, context):
        return self.vim.call('djangoplus#complete', 0,
                             context['complete_str'])
