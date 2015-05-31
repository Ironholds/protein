#Base query function
pdb_query <- function(url, ...){

  query <- paste0("http://www.rcsb.org/pdb/rest/", url)
  result <- httr::GET(query, httr::user_agent("protein - https://github.com/Ironholds/protein"))
  httr::stop_for_status(result)
  return(XML::xmlToList(httr::content(result)))
}

#Turns a character vector of IDs into something consumable by the API
format_multiple <- function(ids){
  if(length(ids) == 1){
    return(ids)
  }

  return(paste(ids, collapse = ","))
}