list.files()

base_datos_miRNA <- readxl::read_excel(path =  "todos mirna 6632 liberados por las mononuclerares.xls", 
                                       sheet = 2)

str(base_datos_miRNA)
dim(base_datos_miRNA)

head(base_datos_miRNA$p)


p_valores_ajustados <- p.adjust(base_datos_miRNA$p, method = "bonferroni", n = 4571)
min(p_valores_ajustados)




#################



list.files()

base_datos_miRNA <- readxl::read_excel(path =  "todos mirna 6632 liberados por las mononuclerares.xls", 
                                       sheet = 1)

str(base_datos_miRNA)
dim(base_datos_miRNA)[1]

head(base_datos_miRNA$"p-value(GENISTEIN vs. CONTROL)")

p_valores_ajustados <- p.adjust(base_datos_miRNA$"p-value(GENISTEIN vs. CONTROL)", 
                                method = "fdr", n = 6631)
min(p_valores_ajustados)



