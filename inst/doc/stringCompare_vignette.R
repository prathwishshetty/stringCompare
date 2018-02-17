## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
#calculate the similarity between two strings "kaspersky antivirus" and "kasper antivirus"
stringCompare::extendedJaccard("Caspersky is awesome","Casper are antivirus","jw",0.85)

## ------------------------------------------------------------------------
#calculate the similarity between two strings "kaspersky antivirus" and "kasper antivirus"

stringCompare::mongeElkan("Caspersky antivirus","Casper antivirus","jw")

