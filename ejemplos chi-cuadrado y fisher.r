dat <- data.frame(
  "smoke_no" = c(7, 0),
  "smoke_yes" = c(2, 5),
  row.names = c("Athlete", "Non-athlete"),
  stringsAsFactors = FALSE
)

colnames(dat) <- c("Non-smoker", "Smoker")

dat



test <- chisq.test(dat)
test

test$expected



test2 <- fisher.test(dat, alternative = "two.sided")
test2

test2$p.value


# Rechazamos la hipótesis nula del test exacto de Fisher, existe una relación
# significativa entre los dos factores (hábito de fumar y estar en forma). Saber
# si el paciente fuma o no ayuda a predecir si estará en forma o no.