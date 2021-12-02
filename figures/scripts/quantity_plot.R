d = read.csv("analyses/quantity/results/quantity_table.csv")[c("genome", "dataset", "annotations_a", "annotations_p", "annotations_f", "annotations_c")]
# Re-Order genome levels from GOMAP most annotations to least
gomap.anns = d[d$dataset == "GOMAP",]
gomap.anns = gomap.anns[order(-gomap.anns$annotations_a),]
d = d[-c(3)]
names(d) = c("genome", "dataset", "BP", "MF", "CC")
d = d[d$dataset != "GoldStandard",]
d$genome = factor(d$genome, levels=gomap.anns$genome)
library(ggplot2)
library(reshape2)
library(RColorBrewer)
melted = melt(d, id=c("genome", "dataset"))
melted$value = melted$value * (-1)
pdf("figures/FigureS1_quantity_plot.pdf", 9, 7)
p <- ggplot(melted, aes(x = dataset, y = value, fill = variable)) + 
  geom_bar(stat = 'identity', position = 'stack') + ylab("Number of Annotations") + facet_grid(~ genome) +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) +
  theme(strip.text.x = element_text(angle = 90)) + scale_fill_manual(values=c("#56B4E9", "#E69F00", "#009E73"))
print(p)
dev.off()

