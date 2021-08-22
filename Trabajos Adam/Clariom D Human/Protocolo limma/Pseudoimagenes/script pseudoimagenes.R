# Instalación oligo en R 3.6:
# BiocManager::install("oligo")

# Paquete ff versión 2.2.14:
# install.packages("https://cran.r-project.org/src/contrib/Archive/ff/ff_2.2-14.tar.gz", 
#                  repos=NULL, type = "source")

# Paquete RSQLite versión 2.1.4:
# install.packages("https://cran.r-project.org/src/contrib/Archive/RSQLite/RSQLite_2.1.4.tar.gz",
#                  repos=NULL, type = "source")


# Cargamos librerías
library("oligo")
library("ggplot2")
library("dplyr")


ruta_completa_archivos_secuenciado <- list.files(path = "../../Archivos secuenciado/", 
                                                 pattern = "*.CEL", full.names = T)

# Cargamos datos
datos_crudos_microarrays <- read.celfiles(filenames = ruta_completa_archivos_secuenciado)

sampleNames(datos_crudos_microarrays) <- c("Control_1", "Genisteina_1",
                                           "Control_2", "Genisteina_2",
                                           "Control_3", "Genisteina_3",
                                           "Control_4", "Genisteina_4")




# Renombramos la columna "index" a "muestra"
colnames(pData(datos_crudos_microarrays)) <- "muestra"
 
# Añadimos el factor "Condición" a los metadatos de nuestro estudio
pData(datos_crudos_microarrays)$condicion <- as.factor(rep(c("Control", "Genisteina"), times = 4))
 
# Visualizamos los metadatos
pData(datos_crudos_microarrays)





##### Generar fotos de los microarrays
# Generamos paleta de colores verde -> amarillo -> rojo
colores_hibridacion <- rev(RColorBrewer::brewer.pal(n = 11, name = "RdYlGn"))

# Establecemos carpeta de guardado de fotos
setwd("./")

# Reconstruimos la apariencia original de los microarrays hibridados y guardamos
# las imágenes resultantes con resolución 720p
for (i in pData(datos_crudos_microarrays)$muestra) {
  nombre.imagen = paste(sampleNames(datos_crudos_microarrays)[i],".png",sep="")
  png(filename = nombre.imagen, width = 1280, height = 720, units = "px", bg = "black")
  image(x = datos_crudos_microarrays[,i], col = colores_hibridacion)
  dev.off()
}
