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



test2 <- fisher.test(dat)
test2

test2$p.value
