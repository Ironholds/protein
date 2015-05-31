#'@title List Accessible PDB Files
#'@description \code{list_pdbs} returns a list of accessible PDB files that
#'can then be passed into other functions within \code{protein}. You can filter
#'to either current or obsolete files.
#'
#'@param obsolete whether to retrieve obsolete PDB files (TRUE) or current files
#'(FALSE). Set to FALSE by default.
#'
#'@param ... further arguments to pass to httr's GET.
#'
#'@examples
#'\dontrun{
#'
#'#Get current files
#'available_pdb_files <- list_pdbs()
#'
#'#Get obsolete files
#'available_obsolete_files <- list_pdbs(TRUE)
#'
#'}
#'@export
list_pdbs <- function(obsolete = FALSE, ...){

  #Check what we should be returning
  if(obsolete){
    url <- "getObsolete"
  } else {
    url <- "getCurrent"
  }

  #Format and return
  result <- pdb_query(url, ...)
  return(unname(unlist(result)))
}

get_file_description <- function(files, ...){

}