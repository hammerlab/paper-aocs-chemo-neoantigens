library(deconstructSigs)
library(reshape)

raw_my_signatures <- read.csv(
  "~/sinai/git/paper-201604/data/all_signatures.csv",
  check.names = F,
  row.names = 1)
my_signatures <- subset(raw_my_signatures, select=colnames(signatures.cosmic))
rownames(my_signatures) <- make.names(rownames(my_signatures))

raw_input <- read.csv("~/sinai/git/paper-201604/data/mutation_contexts_counts.csv", check.names = F)
rownames(raw_input) <- paste(raw_input$source_id, raw_input$kind, sep=" ")
raw_input$kind <- NULL
raw_input$source_id <- NULL

result <- list()
for(sample in rownames(raw_input)) {
  print(sample)
  output <- whichSignatures(tumor.ref = raw_input,
                            sample.id = sample,
                            contexts.needed = TRUE,
                            tri.counts.method = "default",
                            signatures.ref = my_signatures)
  # makePie(output, sub=sample)
  output$weights['Sample'] <- sample
  result[[sample]] <- output$weights
}

final = reshape::merge_all(result)
write.csv(final, '~/sinai/git/paper-201604/data/deconstructsigs_output.csv')
