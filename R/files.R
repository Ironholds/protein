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

  #Make sure type is singular, and switch
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
  amended_ids <- format_multiple(file_ids)
  url <- paste0("describePDB?structureId=", amended_ids)
  result <- pdb_query(url, ...)
  names(result) <- file_ids
  return(result)
}

#'@title Access Information about Entities Within PDB Files
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
  amended_ids <- format_multiple(file_ids)
  url <- paste0("getEntityInfo?structureId=", amended_ids)
  result <- pdb_query(url, ...)
  names(result) <- file_ids
  return(result)
}

#'@title Retrieve Release Statuses for Entities Within PDB Files
#'@description \code{get_release_status} retrieves information about whether
#'the entities within PDB files have been released or not.
#'
#'@param file_ids a character vector of file IDs. If you don't have them to hand,
#'these can be retrieved with \code{\link{list_pdbs}}.
#'
#'@param ... further arguments to pass to httr's GET.
#'
#'@export
get_release_status <- function(file_ids, ...){
  amended_ids <- format_multiple(file_ids)
  url <- paste0("idStatus?structureId=", amended_ids)
  result <- pdb_query(url, ...)
  names(result) <- file_ids
  return(result)
}

#'@title Retrieve Ligand Information for Entities Within PDB Files
#'@description \code{get_release_status} retrieves information about the
#'ligands found in elements in a particular PDB file.
#'
#'@param file_ids a character vector of file IDs. If you don't have them to hand,
#'these can be retrieved with \code{\link{list_pdbs}}.
#'
#'@param ... further arguments to pass to httr's GET.
#'
#'@export
get_pdb_ligands <- function(file_ids, ...){
  amended_ids <- format_multiple(file_ids)
  url <- paste0("ligandInfo?structureId=", amended_ids)
  result <- pdb_query(url, ...)
  names(result) <- file_ids
  return(result)
}