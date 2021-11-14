# Leemos tabla de resultados del análisis en limma
DEG_limma <- readRDS("tabla_resultados_total.rds")
View(DEG_limma)

# Leemos la lista de genes con actividad antioxidante de acuerdo a amiGO2
df_genes_asociados_act_antioxidante <- read.table("select.tsv", fill = T, sep = "\t")
View(df_genes_asociados_act_antioxidante)
listado_genes <- unique(df_genes_asociados_act_antioxidante$V3)

# Obtenemos los genes con actividad antioxidante y comprobamos que tenemos todos
genes_antioxidantes_limma <- DEG_limma[DEG_limma$SYMBOL %in% listado_genes,]
View(genes_antioxidantes_limma)
genes_antioxidantes_limma$FC <- as.numeric(lapply(genes_antioxidantes_limma$logFC, function(x) 2**x))


# Guardamos la tabla
str(df_genes_asociados_act_antioxidante)
df_genes_asociados_act_antioxidante <- apply(df_genes_asociados_act_antioxidante, 2, as.character)
write.csv2(genes_antioxidantes_limma, file = "tabla_genes_antioxidante.csv")


# Ídem para los genes que regulan la actividad antioxidante
genes_regulacion_antioxidantes_limma <- DEG_limma[DEG_limma$SYMBOL %in% df_genes_regular_antioxidantes$V2,]
nrow(genes_regulacion_antioxidantes_limma) == nrow(df_genes_regular_antioxidantes)

# Guardamos la tabla
write.csv(genes_regulacion_antioxidantes_limma, file = "tabla_genes_reguladores_antioxidante.csv")

# Genes no encontrados en limma son esos
genes_no_encontrados <- df_genes_regular_antioxidantes[!df_genes_regular_antioxidantes$V2 %in% genes_regulacion_antioxidantes_limma$SYMBOL,]
View(genes_no_encontrados)
