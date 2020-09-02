from nbconvert.preprocessors import Preprocessor
from nbformat import NotebookNode
from os.path import join


class AddBinderComponent(Preprocessor):

    def preprocess(self, notebook, resources):
        filepath = join(resources['metadata']['path'], resources['metadata']['name']) + '.ipynb'
        notebook.cells.append(NotebookNode(
            cell_type='markdown',
            metadata={},
            source=f'<Binder filepath="{filepath}" />'
        ))
        return notebook, resources
