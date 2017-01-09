library(deconstructSigs)
library(reshape)

raw.my.signatures <- read.csv(
  "https://raw.githubusercontent.com/hammerlab/paper-aocs-chemo-neoantigens/master/data/derived/all_signatures.csv",
  check.names = F,
  row.names = 1)
my.signatures <- subset(raw.my.signatures, select=colnames(signatures.cosmic))
print(colnames(signatures.cosmic))
print(colnames(my.signatures))
rownames(my.signatures) <- make.names(rownames(my.signatures))
print(my.signatures)

raw.input <- read.csv(
  "https://raw.githubusercontent.com/hammerlab/paper-aocs-chemo-neoantigens/master/data/derived/mutation_contexts_counts.csv",
  check.names = F)
rownames(raw.input) <- paste(raw.input$source_id, raw.input$kind, sep=" ")
raw.input$kind <- NULL
raw.input$source_id <- NULL

result <- list()
for(sample in rownames(raw.input)) {
  print(sample)
  output <- whichSignatures(tumor.ref = raw.input,
                            sample.id = sample,
                            contexts.needed = TRUE,
                            signature.cutoff = 0.00,
                            tri.counts.method = "default",
                            signatures.ref = my.signatures)

  # makePie(output, sub=sample)
  output$weights['Sample'] <- sample
  result[[sample]] <- output$weights
}

final = reshape::merge_all(result)
write.csv(final, '~/sinai/git/paper-201604/data/derived/deconstructsigs_output.csv')
