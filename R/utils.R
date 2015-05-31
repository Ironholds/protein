#'@title Base Querying Function for the PDB
#'
#'@importFrom httr GET user_agent stop_for_status content
#'@importFrom XML xmlToList
pdb_query <- function(url, ...){

  query <- paste0("http://www.rcsb.org/pdb/rest/", url)
  result <- httr::GET(query, httr::user_agent("protein - https://github.com/Ironholds/protein"))
  httr::stop_for_status(result)
  return(XML::xmlToList(httr::content(result)))
}