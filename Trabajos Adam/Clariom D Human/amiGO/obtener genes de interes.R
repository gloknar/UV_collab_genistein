# Leemos tabla de resultados del análisis en limma
DEG_limma <- readRDS("tabla_resultados_total.rds")
View(DEG_limma)

# Leemos la lista de genes con actividad antioxidante de acuerdo a amiGO2 (la 2a
# columna es el nombre oficial, y la 3a son los sinónimos)
df_genes_antioxidantes <- read.table("Genes homo sapiens anotados actividad anbtioxidante.txt", fill = T)

# Ídem para genes que regulan actividad antioxidante
df_genes_regular_antioxidantes <- read.table("reguladores actividad antioxidante.txt", fill = T)
df_genes_regular_antioxidantes <- df_genes_regular_antioxidantes[-42,]

View(DEG_limma)
DEG_limma[df_genes_antioxidantes$V2,]
DEG_limma$SYMBOL %in% df_genes_antioxidantes$V2
View(DEG_limma[DEG_limma$SYMBOL %in% df_genes_antioxidantes$V2,])


View(DEG_limma[DEG_limma$SYMBOL %in% df_genes_regular_antioxidantes$V2,])

