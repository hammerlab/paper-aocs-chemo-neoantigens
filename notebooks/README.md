# Analysis notebooks

## Sample and clinical information
<dl>
  <dt><a href="samples.ipynb">samples.ipynb</a></dt>
  <dd>Join several spreadsheets with sample info into one CSV file</dd>
</dl>

## Mutations
Original mutation calls from *Supplementary Table 9.1: High Confidence Coding
Somatic Variants* from Patch et al were copied
[here](../data/patch_et_al_somatic_mutations.csv.bz2), and then processed with [varlens](http://github.com/hammerlab/varlens) to add additional columns. This was done in multiple runs with results merged by hand due to reliability issues with computing infrastucture. Final result written [here](../data/derived/annotated_mutations.with_mhc_binders.csv)



