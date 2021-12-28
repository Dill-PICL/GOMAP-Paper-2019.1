These are the analyses that were done for the paper.
If you want to re-run one of them or use them on your own data, access the singularity container as described in the main README and run the scripts by hand or use rake to resolve dependencies for you. All paths are relative to the root folder (`../` from here).
So, for example, to re-run the quantity analysis:
```bash
# Enter the container as described in ../README.md
Rscript analyses/quantity/quantity.R # OR
rake analyses/quantity/results/quantity_table.csv
```

Each of the analyses comes with its own README with more information.

- [cleanup](https://github.com/Dill-PICL/GOMAP-Paper-2019.1/tree/master/analyses/cleanup) - first step of our analysis pipeline: redundant and obsolete annotations are removed from the input datasets.
- [quantity](https://github.com/Dill-PICL/GOMAP-Paper-2019.1/tree/master/analyses/quantity) - quantitative evaluation for all cleaned up input datasets, used in Table II and Figure S1.
- [quality](https://github.com/Dill-PICL/GOMAP-Paper-2019.1/tree/master/analyses/quality) - quality evaluation for all cleaned up input datasets where a Gold Standard is present, used in Table III and Figure S2.
- [treebuilding](https://github.com/Dill-PICL/GOMAP-Paper-2019.1/tree/master/analyses/treebuilding) - algorithms and scripts to build neighbor-joining and parsimony-based trees from the cleaned up GOMAP datasets.
- [genomeqc](https://github.com/Dill-PICL/GOMAP-Paper-2019.1/tree/master/analyses/genomeqc) - genome assembly and annotation GenomeQC scores used in Tables IV,V, and SI.
- [busco](https://github.com/Dill-PICL/GOMAP-Paper-2019.1/tree/master/analyses/busco) - genome assembly and annotation BUSCO scores used for Figures 6 and 7.
- [mesquite](https://github.com/Dill-PICL/GOMAP-Paper-2019.1/tree/master/analyses/mesquite) - results from our mesquite analysis to retrace character gain and loss over the generated trees.
- [shared](https://github.com/Dill-PICL/GOMAP-Paper-2019.1/tree/master/analyses/shared) - resources that are external and/or shared between multiple analyses (not an analysis itself).
