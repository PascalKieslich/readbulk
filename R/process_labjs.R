#' Process lab.js data stored in survey software
#'
#' Process lab.js data stored in survey software by converting them from JSON
#' data to a data.frame in long format. This function is currently in beta mode.
#'
#' @param data a data.frame.
#' @param labjs_column a character string specifying the column in \code{data}
#'   that contains the lab.js data.
#' @param keep a character vector specifying which additional columns in
#'   \code{data} should be kept.
#' @param remove_no_json logical indicating whether rows with no JSON data
#'   should be kept. Only relevant if \code{keep} contains one or more
#'   variables.
#' @param verbose logical indicating whether function should report its
#'   progress.
#' @param ... additional arguments passed on to \link[jsonlite]{fromJSON}.
#'
#' @return A \link{data.frame} containing the processed data.
#'
#' @examples
#' \dontrun{
#' raw_data <- read.csv("raw_data.csv",encoding="UTF-8")
#'
#' dataset <- process_labjs(data=raw_data,
#'   labjs_column = "FB01_01",
#'   keep=c("CASE","SERIAL"),
#'   verbose=TRUE)
#' }
#'
#' @author
#' Felix Henninger (\email{mailbox@@felixhenninger.com})
#'
#' Pascal J. Kieslich (\email{kieslich@@psychologie.uni-mannheim.de})
#'
process_labjs <- function(
  data,
  labjs_column,
  keep = NULL,
  remove_no_json = FALSE,
  verbose=FALSE,
  ...) {

  labjs_data <- as.character(data[,labjs_column])

  complete_data <- data.frame()

  exclude <- c('[object Object]')

  for (i in 1:nrow(data)){

    # CASE: no data
    if (is.na(labjs_data[i])){
      if (remove_no_json==FALSE & is.null(keep)==FALSE){
        current_data <- data[i,keep,drop=FALSE]
        complete_data <- plyr::rbind.fill(complete_data,current_data)
        if (verbose){
          message("Row ",i," in data did not contain any data.")
        }
      }


    } else{
      current_data <- jsonlite::fromJSON(labjs_data[i], flatten=TRUE, ...)

      # CASE: no valid JSON data
      if(class(current_data)!="list") {
        if (remove_no_json==FALSE  & is.null(keep)==FALSE){
          current_data <- data[i,keep,drop=FALSE]
          complete_data <- plyr::rbind.fill(complete_data,current_data)
        }
        if (verbose){
          message("Row ",i," in data did not contain valid JSON data.")
        }

      # CASE: valid JSON data
      } else {
        current_data <- data.frame(current_data$data)
        current_data[,keep] <- data[i,keep]
        complete_data <- plyr::rbind.fill(complete_data,current_data)
      }

    }

  }

  # Reorder columns
  if (is.null(keep)==FALSE){
    columns <- colnames(complete_data)
    complete_data <- complete_data[,c(keep,columns[!columns%in%keep])]
  }

  return(complete_data)

}
