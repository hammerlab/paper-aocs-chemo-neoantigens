library(deconstructSigs)
library(reshape)

raw_my_signatures <- read.csv("~/sinai/git/ovarian-paired-analyses/data/derived/all_signatures_for_deconstructsigs.csv",
                          check.names = F,
                          row.names = 1)
my_signatures <- subset(raw_my_signatures, select=colnames(signatures.cosmic))

raw_input <- read.csv("~/sinai/git/ovarian-paired-analyses/data/derived/mutation_contexts_counts_extended.csv", check.names = F)
rownames(raw_input) <- paste(raw_input$source_id, raw_input$kind, sep=" ")
input <- subset(raw_input, select=colnames(randomly.generated.tumors))

result <- list()
for(sample in rownames(input)) {
  print(sample)
  output <- whichSignatures(input,
                            sample,
                            contexts.needed = TRUE,
                            tri.counts.method = "genome",
                            signatures.ref = my_signatures)
  makePie(output, sub=sample)
  output$weights['Sample'] <- sample
  result[[sample]] <- output$weights
}

final = reshape::merge_all(result)
write.csv(final, '~/sinai/git/ovarian-paired-analyses/data/derived/deconstructsigs_output_extended.csv')
