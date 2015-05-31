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

#'@title Access Descriptions of PDB Files
#'@description \code{get_pdb_description} allows you to
#'access metadata about a particular PDB file, including what structures it
#'contains, when it was released, and what resolution the underlying data has.
#'For obsolete files, the metadata is instead the ID of the file that replaced
#'it.
#'
#'@param file_ids a character vector of file IDs. If you don't have them to hand,
#'these can be retrieved with \code{\link{list_pdbs}}.
#'
#'@param ... further arguments to pass to httr's GET.
#'
#'@examples
#'
#'#Return metadata about obsolete and non-obsolete PDB files
#'pdb_metadata <- get_pdb_description(c("116L","100D","14PS"))
#'
#'@export
get_pdb_description <- function(file_ids, ...){

  #Check and format
  file_ids <- format_multiple(file_ids)
  url <- paste0("getEntityInfo?structureId=", file_ids)
  return(pdb_query(url, ...))
}