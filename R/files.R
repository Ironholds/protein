#'@title List Accessible PDB Files
#'@description \code{list_pdbs} returns a list of accessible PDB files that
#'can then be passed into other functions within \code{protein}. You can filter
#'to either current or obsolete files.
#'
#'@param type whether to retrieve current, obsolete or unreleased PDB files.
#'"current" by default.
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
#'available_obsolete_files <- list_pdbs("obsolete")
#'
#'}
#'@export
list_pdbs <- function(type = c("current","obsolete","unreleased"), ...){

  type <- type[1]
  switch(type,
         "current" = {
           url <- "getCurrent"
         },
         "obsolete" = {
           url <- "getObsolete"
         },
         "unreleased" = {
           url <- "getUnreleased"
         },
         {stop("This is not a valid type")})
  #Format and return
  result <- pdb_query(url, ...)
  return(unname(unlist(result)))
}

#'@title Access Descriptions of PDB Files
#'@description \code{get_pdb_description} allows you to
#'access metadata about a particular PDB file, including what structures it
#'contains, when it was released, and what resolution the underlying data has.
#'
#'@param file_ids a character vector of file IDs. If you don't have them to hand,
#'these can be retrieved with \code{\link{list_pdbs}}.
#'
#'@param ... further arguments to pass to httr's GET.
#'
#'@examples
#'
#'#Return metadata about PDB files
#'pdb_metadata <- get_pdb_description(c("116L","100D","14PS"))
#'
#'@export
get_pdb_description <- function(file_ids, ...){

  #Check and format
  file_ids <- format_multiple(file_ids)
  url <- paste0("describePDB?structureId=", file_ids)
  return(pdb_query(url, ...))
}

#'@title Access Information about Entities within PDB Files
#'@description \code{get_pdb_entites} retrieves data about the
#'content of particular PDB files, and the structures within them.
#'For obsolete files, this is largely the ID of the file that replaced
#'it.
#'
#'@param file_ids a character vector of file IDs. If you don't have them to hand,
#'these can be retrieved with \code{\link{list_pdbs}}.
#'
#'@param ... further arguments to pass to httr's GET.
#'
#'@examples
#'
#'#Return metadata about the entities within obsolete and non-obsolete PDB files
#'pdb_metadata <- get_pdb_entities(c("116L","100D","14PS"))
#'
#'@export
get_pdb_entities <- function(file_ids, ...){

  #Check and format
  file_ids <- format_multiple(file_ids)
  url <- paste0("getEntityInfo?structureId=", file_ids)
  return(pdb_query(url, ...))
}