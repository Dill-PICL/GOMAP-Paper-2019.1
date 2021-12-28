## Generated Trees

In this folder, `treebuilding.rb` will perform the creation of (jackknifed) binary and distance matrices and then run PHYLIP to generate (consensus) trees.

The files generated can include (depending on what you specify in your recipe):
- `binary_matrix_<ASPECT>.phy`: Binary matrix of the non-jackknifed input dataset for the specified aspect in PHYLIP format (C = cellular component, P = biological process, F = molecular function, A = all terms)
- `binary_matrix_<ASPECT>.csv`: The same file in CSV format including headers in case you want to do further analyses with it.
- `binary_matrix_jackknifed_<ASPECT>_<JACKKNIFING-LEVEL>.phy`: If you've specified jackknifing in your recipe, these are the resulting binary matrices.
- `distance_matrix_<ASPECT>.phy` and `distance_matrix_<ASPECT>_<JACKKNIFING-LEVEL>.phy` analogous to the ones above.
- `nj_<ASPECT>.tree`: neighbor-joining tree in newick format built on the corresponding `distance_matrix_<ASPECT>.phy` file (non-jackknifed).
- `nj_jackknifed_<ASPECT>_<JACKKNIFING-LEVEL>.tree`: neighbor-joining tree built on the corresponding jackknifed distance matrices using PHYLIP's consense. Please be aware that branch lengths in this tree are branch support values and not really distances.
- `nj_jackknifed_<ASPECT>_<JACKKNIFING-LEVEL>.all.tree`: All the individual trees (one per jackknifed dataset) that were the input for consense to determine branch support and a consensus tree. Here branch lengths are still distances. 
- parsimony-based trees analogous to the ones above (but built on the binary matrices).

The analyses performed for our manuscript are included here as well:
- `all-species.tar.gz`: NJ- and parsimony-based trees of all species + jackknifing analysis for the threshold included in our manuscript (Figure 3)
- `separate-aspects.tar.gz`: NJ- and parsimony-based trees of all species built separately on either aspect of the Gene Ontology, without jackknifing analysis (in reponse to a reviewer).
- `restore-known-topology.tar.gz`: NJ- and parsimony-based trees of all species except *G. max, C. sativa*, and *B. distachyon* in order to restore the expected taxonomic topology (Figure 4).
- `topology-restoration-attempts.tar.gz` contains code used to generate a topology leaving out all possible combinations of 1 to 5 genomes from the input and automatically comparing it to the expected topology in order to find the minimum number of species to remove in order to restore the expected topology above. More information can be found in the README inside the archive.
