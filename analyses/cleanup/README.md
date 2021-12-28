## Cleanup

This step cleans up the GO annotation sets at `data/go_annotation_sets` by 

1. Removing obsolete annotations
2. Removing all annotations with non-empty qualifiers (NOT, contributes_to, colocalizes_with), and
3. Merging all 'alternative ids' to the main id and removing duplicates discovered this way

Statistics about how many annotations were removed this way are saved to `./results/cleanup_table.csv`.
This step is implemented in [Crystal](https://crystal-lang.org/) which is a compiled language for performance.
A compiled binary is shipped with the repository that has worked with all setups we've tested, otherwise the compiler is included in the singularity container as well.
