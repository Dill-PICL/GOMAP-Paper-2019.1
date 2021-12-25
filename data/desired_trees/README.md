## Desired Trees
These YAML files are used as "recipes" to build trees in the `treebuilding` analysis.
They require the `gafs_to_sets.rb` scripts to be run first in order to create the input files, then a YAML file can be passed to the treebuilding script 
(e.g. `ruby analyses/treebuilding/treebuilding.rb data/desired_trees/all-species.yaml`) in order to build the corresponding tree (e.g. at `analyses/treebuilding/results/trees/all-species`).
This is what a YAML file should look like to be used for treebuilding:

```yaml
---
# List the species you want your tree to be built from, their JSON files
# in "with_ancestors" will be used.
species:
  - Arachis_hypogaea
  - Cannabis_sativa
  - Medicago_truncatula.R108
  - Phaseolus_vulgaris
  - Sorghum_bicolor
  - Zea_mays.W22
  
# Specify whether you want to build parsimony-based, distance-based trees or both
parsimony: yes
nj: yes

# Specify whether you want trees to be built only on the GO terms belonging to a 
# specific part of the Gene Ontology:
# C - Cellular Component, F - Molecular Function, P - Biological Process
# A - All of them combined (use all GO terms irrespective of aspect).
aspects: ["C", "F", "P", "A"]

# If you suspect your topology is strongly influenced by a few erroneous terms, you can
# specify them here to have them excluded from the treebuilding sets
exclude_terms:
  - GO:0036203
  - GO:0042659

# If you want to perform jackknifing on the treebuilding sets, specify here how many
# trees you want to build and what percentage(s) of terms you want to be removed
# (in this example there will be two jackknifing analyses done, one with 20% of
# terms removed and one with 45% removed, each with 100 independent trees.)
jackknives: 
  n_trees: 100
  percentages: [20, 45]
...
```

The 3 setups included in this repository are:

- `all-species.yaml`: NJ- and parsimony-based trees of all species + jackknifing analysis for the threshold included in our manuscript.
- `separate-aspects.yaml`: NJ- and parsimony-based trees of all species built separately on either aspect of the Gene Ontology, without jackknifing analysis.
- `restore-known-topology.yaml`: NJ- and parsimony-based trees of all species except *G. max, C. sativa*, and *B. distachyon* in order to restore the expected taxonomic topology.

The corresponding results can be found at `analyses/treebuilding/results/trees`.
