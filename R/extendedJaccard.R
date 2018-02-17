#' @title Extended Jaccard Method for Approximate Text String Comparison
#'
#' @description This algorithm extracts tokens (words sererated by whitespace) from the two input strings and then find the best matching pair of tokens in the set of tokens using a secondary similarity function.
#' @param string1 character string to be matched
#' @param string2 character string to be matched against
#' @param method Secondary string comparision method to be used
#' @param threshold numeric vector of probabilities with values in [0,1]
#' @import stringdist stringr
#' @return Returns a comparision score in the range of 0 to 1 for the two strings,where 0 indicates no similarity between the two strings and 1 indicates a match between the 2 strings.
#' @examples
#' #Calculating extendedJaccard comparision score using jarowinkler and threshold of 0.85
#' extendedJaccard("kaspersky is awesome","kasper are antivirus","jw",0.85)
#' @export
extendedJaccard<-function(string1,string2,method,threshold){

  string1_count <- stringr::str_count(string1, "\\S+")
  string2_count <- stringr::str_count(string2, "\\S+")
  string_mat<-matrix(nrow=string1_count+1,ncol=string2_count+1)

  for (i in (1:(string1_count))) {
    for (j in (1:string2_count)) {
      if ((stringdist::stringsim(unlist(strsplit(string1, "\\s+"))[i],
                                    unlist(strsplit(string2, "\\s+"))[j],
                                    method))>=threshold){
        string_mat[i,j]<-1
      }
      else{
        string_mat[i,j]<-0
      }
    }
  }

  for (i in (1:string1_count)){
    string_mat[i,(string2_count+1)]<-if(sum(string_mat[i,]>0,na.rm = T)>0) 1 else 0
  }

  for (j in (1:string2_count)){
    string_mat[(string1_count+1),j]<-if(sum(string_mat[,j]>0,na.rm = T)>0) 1 else 0
  }

  nu_str1<-sum(string_mat[,string2_count+1],na.rm=T)
  nu_str2<-sum(string_mat[string1_count+1,],na.rm=T)
  (nu_str1+nu_str2)/(nu_str1+nu_str2+(string1_count-nu_str1)+(string2_count-nu_str2))
}

