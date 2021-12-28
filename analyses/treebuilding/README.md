## Treebuilding

This folder includes all the code and results related to dendrogram construction and analysis, written in Ruby.
The first step that needs to be performed is to convert the cleaned up GAF files to JSON GO term sets ordered by aspect, with and without added ancestral terms.
This can be done by simply calling `ruby analyses/treebuilding/gafs_to_sets.rb`.
The result of this step with our datasets are also included in the repository at [./results/sets](https://github.com/Dill-PICL/GOMAP-Paper-2019.1/tree/master/analyses/treebuilding/results/sets).

Then trees can be built from specified recipes using the `treebuilding.rb` script.
Examples and an explanation of what the recipes look like can be found at [data/desired_trees](https://github.com/Dill-PICL/GOMAP-Paper-2019.1/tree/master/data/desired_trees).
Additionally, differences between clades can be examined using the `set_operations.rb` script as described in [data/set_operations](https://github.com/Dill-PICL/GOMAP-Paper-2019.1/tree/master/data/set_operations).

Lastly, [./results/trees](https://github.com/Dill-PICL/GOMAP-Paper-2019.1/tree/master/analyses/treebuilding/results/trees) includes all the dendrograms (Newick format), distance matrices and binary matrices referred to in our manuscript.

