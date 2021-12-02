library(ComplexHeatmap)
library(data.table)
library(stringr)
library(circlize)

d = read.csv("analyses/quality/results/quality_table.csv")

row.names(d) = paste0(d$genome, "_", d$dataset)
row.meta = d[1:2]
d = d[3:ncol(d)]

col.meta = data.frame(metric = str_split_fixed(names(d), "\\.", 2)[,1],
                      aspect = str_split_fixed(names(d), "\\.", 2)[,2])

d.simgic = d[1:3]
d.tc_aucpcr = d[4:6]
d.fmax = d[7:9]

col_simgic = colorRamp2(c(min(d.simgic), max(d.simgic)), c("white", "black"))
col_tc_aucpcr = colorRamp2(c(min(d.tc_aucpcr), max(d.tc_aucpcr)), c("white", "black"))
col_fmax = colorRamp2(c(min(d.fmax), max(d.fmax)), c("white", "black"))

row.meta$dataset = as.factor(row.meta$dataset)
annotation.right = rowAnnotation(dataset = row.meta$dataset, col=list(dataset=c("Gramene63"="#F0E442", "GOMAP"="#0072B2", "Phytozome12"="#D55E00")))

# This first heatmap is only used to allow clustering across all metrics, it is not drawn
# (see https://jokergoo.github.io/ComplexHeatmap-reference/book/a-list-of-heatmaps.html#automatic-adjustment-to-the-main-heatmap )
h0 = Heatmap(as.matrix(d), cluster_columns=F, name="main", width = unit(0, "cm"), show_column_names = F, show_heatmap_legend = F)
# Now we draw one heatmap per metric
h1 = Heatmap(as.matrix(d.simgic), cluster_columns=F, name="SimGIC2", row_dend_width = unit(3, "cm"),
             column_title="SimGIC2", col=col_simgic, column_labels = col.meta$aspect[7:9], column_names_rot = 0,
             rect_gp = gpar(col = "white", lwd = 1))
h2 = Heatmap(as.matrix(d.tc_aucpcr), cluster_columns=F, name="TC_AUCPCR", column_title="TC_AUCPCR",
             col=col_tc_aucpcr, column_labels = col.meta$aspect[4:6], column_names_rot = 0, rect_gp = gpar(col = "white", lwd = 1))
h3 = Heatmap(as.matrix(d.fmax), name="Fmax", cluster_columns=F, right_annotation = annotation.right, 
             column_title="Fmax", row_labels=row.meta$genome, column_labels = col.meta$aspect[1:3], col=col_fmax,
             column_names_rot = 0, rect_gp = gpar(col = "white", lwd = 1))

pdf("figures/FigureS2_quality_heatmap.pdf", 10, 7)
h0 + h1 + h2 + h3
dev.off()

