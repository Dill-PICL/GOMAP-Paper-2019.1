GOMAP-Paper-2019.1
==============================

Data, code, and results for our paper *Standardized genome-wide function prediction enables comparative functional genomics: a new application area for Gene Ontologies in plants* (https://doi.org/10.1093/gigascience/giac023).
If you use any of our code or results in a scientific publication, we would be grateful if you cite the paper.

Repository Organization
------------
The respository is organized in 4 overall folders with the following subfolders.
Every folder contains an individual README file with more information which you can access by following the links below.

- [data](https://github.com/Dill-PICL/GOMAP-Paper-2019.1/tree/master/data) - input datasets and recipes for the trees to build and term sets to generate; the files in this folder are provided by us/the user and remain unchanged by any analysis.
  - [go_annotation_sets](https://github.com/Dill-PICL/GOMAP-Paper-2019.1/tree/master/data/go_annotation_sets) - GO annotation sets generated by GOMAP or downloaded from Gramene or Phytozome, as they are published there.
  - [go.obo.gz](https://github.com/Dill-PICL/GOMAP-Paper-2019.1/blob/master/data/go.obo.gz) - Gene Ontology downloaded from http://geneontology.org/docs/download-ontology/ .
  - [goa_arabidopsis.gaf.gz](https://github.com/Dill-PICL/GOMAP-Paper-2019.1/blob/master/data/goa_arabidopsis.gaf.gz) - Arabidopsis GOA file used in the quality evaluation, downloaded from https://www.ebi.ac.uk/GOA/arabidopsis_release .
  - [n_genes_per_genome](https://github.com/Dill-PICL/GOMAP-Paper-2019.1/blob/master/data/n_genes_per_genome.csv) - Number of gene models in each genome as per the number of sequences in the FASTA file used to generate the annotations, used for the quantity evaluation.
  - [desired_trees](https://github.com/Dill-PICL/GOMAP-Paper-2019.1/tree/master/data/desired_trees) - Instructions/Recipes on which dendrograms to generate. These are used as the input for the treebuilding script which then gathers the appropriate annotation sets and performs distance- and character-based dendrogram construction.
  - [set_operations](https://github.com/Dill-PICL/GOMAP-Paper-2019.1/tree/master/data/set_operations) - Recipes for GO annotation set operations to answer questions such as "Which terms are present in all legumes as well as in cotton but not present in cannabis". These files are used as input for the `set_arithmetics.rb` script (in the treebuilding analysis).
- [analyses](https://github.com/Dill-PICL/GOMAP-Paper-2019.1/tree/master/analyses) - code and results for all the analyses carried out for the paper. Any scripts have to be run from the root folder of the repository (the one this README is in) in order for the relative paths to work. Every analysis contains a `results` folder with the results published in the paper.
  - [cleanup](https://github.com/Dill-PICL/GOMAP-Paper-2019.1/tree/master/analyses/cleanup) - first step of our analysis pipeline: redundant and obsolete annotations are removed from the input datasets.
  - [quantity](https://github.com/Dill-PICL/GOMAP-Paper-2019.1/tree/master/analyses/quantity) - quantitative evaluation for all cleaned up input datasets, used in Table II and Figure S1.
  - [quality](https://github.com/Dill-PICL/GOMAP-Paper-2019.1/tree/master/analyses/quality) - quality evaluation for all cleaned up input datasets where a Gold Standard is present, used in Table III and Figure S2.
  - [treebuilding](https://github.com/Dill-PICL/GOMAP-Paper-2019.1/tree/master/analyses/treebuilding) - algorithms and scripts to build neighbor-joining and parsimony-based trees from the cleaned up GOMAP datasets. Trees shown in the manuscript are also included in `results/trees`.
  - [genomeqc](https://github.com/Dill-PICL/GOMAP-Paper-2019.1/tree/master/analyses/genomeqc) - genome assembly and annotation GenomeQC scores used in Tables IV,V, and SI.
  - [busco](https://github.com/Dill-PICL/GOMAP-Paper-2019.1/tree/master/analyses/busco) - genome assembly and annotation BUSCO scores used for Figures 6 and 7.
  - [mesquite](https://github.com/Dill-PICL/GOMAP-Paper-2019.1/tree/master/analyses/mesquite) - results from our mesquite analysis to retrace character gain and loss over the generated trees.
  - [shared](https://github.com/Dill-PICL/GOMAP-Paper-2019.1/tree/master/analyses/shared) - resources that are external and/or shared between multiple analyses (not an analysis itself).
- [figures](https://github.com/Dill-PICL/GOMAP-Paper-2019.1/tree/master/figures) - Figures shown in the paper in PDF format.
  - [scripts](https://github.com/Dill-PICL/GOMAP-Paper-2019.1/tree/master/figures/scripts) - R scripts to generate the Figures from the `results` files of our analyses (such as the quality heatmap Figure S2 from `analyses/quality/results/quality_table.csv`).
- [specs](https://github.com/Dill-PICL/GOMAP-Paper-2019.1/tree/master/spec) - Unit tests for the parts of the analyses that are performed in the [Crystal](https://crystal-lang.org/) programming language.

Reproducing this paper or using part of the software
------------
To make it all easy for you, we have bundled everything that's required to run our analyses in a [singularity container](https://sylabs.io/) (now renamed to Apptainer).
You may also just want to use our software for your own data or play around with our data to explore it for yourself.
Please [install singularity](https://sylabs.io/guides/3.3/user-guide/quick_start.html#quick-installation-steps) and then follow these steps:

```bash
# 1. Download the git repository and its submodules
git clone --recurse-submodules https://github.com/Dill-PICL/GOMAP-Paper-2019.1.git

# 2. Change into the newly downloaded folder
cd GOMAP-Paper-2019.1

# 3. Pull the singularity container
singularity pull library://merlin/default/gomap-paper-2019.1

# 4a. To re-perform all analyses (e.g. after you've modified data or scripts)
./gomap-paper-2019.1_latest.sif # OR
singularity run gomap-paper-2019.1_latest.sif

# 4b. To perform steps manually or use the installed software for something else, enter the container
singularity shell gomap-paper-2019.1_latest.sif
# You can now either run analyses manually as described in their respective READMEs or use rake to run specific analyses. You can type rake -T for a list of all available tasks.
```
