# Analysis notebooks

## Sample and clinical information
<dl>
  <dt><a href="samples.ipynb">samples.ipynb</a></dt>
  <dd>Join several spreadsheets with sample info into one CSV file</dd>
</dl>

## Mutations
Original mutation calls from *Supplementary Table 9.1: High Confidence Coding
Somatic Variants* from Patch et al were copied
[here](../data/patch_et_al_somatic_mutations.csv.bz2), and then processed as
follows.

 * [Varlens](http://github.com/hammerlab/varlens) was used to add columns. This was done in multiple runs with results merged by hand due to reliability issues with computing infrastucture. Final result written [here](../data/derived/annotated_mutations.with_mhc_binders.csv)
 * Notebook used to generate Fig1: [here](neoantigen%20and%20mutation%20counts.ipynb)
 * 


