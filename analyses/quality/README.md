## Quality Evaluation

In this step, quality evaluations are performed for all genomes for which a Gold Standard is present using the SimGIC2, TC_AUCPCR, and Fmax metrics.
We're using the implementations from https://bitbucket.org/plyusnin/ads/src/master/ which is included as a sub-repository in `analyses/shared/ads`. 
Extracting and combining all the different scores into a table manually would be a lot of work so we recommend you run this step using our Rake script: `rake quality`.
The script will then automatically determine for which genomes a Gold Standard is present and evaluate the quality of all other datasets concerning this genome.
This should still work if you add or remove prediction sets, genomes, or Gold Standards, you just might have to run it twice.
