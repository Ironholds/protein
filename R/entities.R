#'@title Access Descriptions of Structures in PDB Files
#'@description \code{get_structure_descriptions} retrieves metadata associated
#'with particular structures found within PDB files, including the taxonomy and a
#'description.
#'
#'@param a character vector of structure IDs. These can be retrieved from
#'file metadata or lists (see \code{\link{list_pdbs}}.)
#'
#'@param ... further arguments to pass to httr's GET.
#'
#'@examples
#'#Get the structure description for 4hhb (hemoglobin)
#'hemo_desc <- get_structure_descriptions("4hhb")
#'
#'@export
get_structure_descriptions <- function(structure_ids, ...){
  amended_ids <- format_multiple(structure_ids)
  url <- paste0("describeMol?structureId=", amended_ids)
  result <- pdb_query(url, ...)
  names(result) <- structure_ids
  return(result)
  return(pdb_query(url, ...))
}

#'@title Access Descriptions of Chemicals in PDB Files
#'
#'@examples
#'#Retrieve the description of NAG - n-acetyl-d-glucosamine
#'nag_desc <- get_chemical_descriptions("NAG")
#'@export
get_chemical_descriptions <- function(chemical_ids, ...){
  amended_ids <- format_multiple(chemical_ids)
  url <- paste0("describeHet?chemicalID=", amended_ids)
  result <- pdb_query(url, ...)
  names(result) <- chemical_ids
  return(result)
}

