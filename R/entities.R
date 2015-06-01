#'@title Access Descriptions of Structures in PDB Files
#'
#'@param a character vector of structure IDs. These can be retrieved from
#'file metadata or lists (see \code{\link{list_pdbs}}.)
#'
#'@param ... further arguments to pass to httr's GET.
#'
#'@export
get_structure_descriptions <- function(structure_ids, ...){
  structure_ids <- format_multiple(structure_ids)
  url <- paste0("describeMol?structureId=", structure_ids)
  return(pdb_query(url, ...))
}

#'@title Access Descriptions of Chemicals in PDB Files
#'
#'@export
get_chemical_descriptions <- function(chemical_ids, ...){
  chemical_ids <- format_multiple(chemical_ids)
  url <- paste0("describeMol?chemicalID=", chemical_ids)
  return(pdb_query(url, ...))
}