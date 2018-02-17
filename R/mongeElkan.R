#' @title Monge-Elkan Method for Approximate Text String Comparison
#'
#' @description This algorithm extracts tokens (words sererated by whitespace) from the two input strings and then find the best matching pair of tokens in the set of tokens using a secondary similarity function.
#' @param string1 character string to be matched
#' @param string2 character string to be matched against
#' @param method Secondary string comparision method to be used
#' @import stringdist stringr
#' @return Returns a comparision score in the range of 0 to 1 for the two strings,where 0 indicates no similarity between the two strings and 1 indicates a match between the 2 strings.
#' @examples
#' #Calculating mongeElkan score using jarowinkler as secondary comparision
#' mongeElkan("kaspersky antivirus","kasper antivirus","jw")
#' @export
mongeElkan <- function(string1, string2,method) {
  string1_count <- stringr::str_count(string1, "\\S+")
  string2_count <- stringr::str_count(string2, "\\S+")

  list1 <- matrix(nrow = string1_count, ncol = string2_count + 1)

  for (i in (1:string1_count)) {
    for (j in (1:string2_count)) {
      list1[i, j] <-
        (stringdist::stringsim(unlist(strsplit(
          string1, "\\s+"
        ))[i], unlist(strsplit(
          string2, "\\s+"
        ))[j], method = method))
    }
    list1[i, j + 1] <- max(list1[i, ], na.rm = T)
  }
  mean(list1[, string2_count + 1])
}
