#' @title Devuelve los datos de plazas libres de los parkings del polígono
#'
#' @description Devuelve los datos de plazas libres de los parkings del polígono
#'
#' @return json
#'
#' @examples  apiPlazas()
#'
#' @import httr
#' jsonlite
#' dplyr
#'
#' @export

apiPlazas <- function(){

  URL <- "https://apiparking.sol-fix.es/api/parking?code=pcPMFVeRnjEMyL1QOmPD9f0NnLuGbZsan2uh1ghQsJXkAzFur64Xkw%3D%3D"
  
  formatted_time <- format(Sys.time(), "%Y-%m-%dT%H:%M:%S")
  json <- paste('{"FechaUTC": "',formatted_time,'","Municipio": "Almusaffes","Id_Municipio": 78,"Token": "C.U8gxS!DuFN&HWm]2;M!["}',sep = "")
  
  post <- httr::POST(url = URL,
                     add_headers("Content-Type"="application/json","Accept"="application/json"),
                     body = json,
                     verify= FALSE,
                     encode = "json",verbose()
  )

  df <- jsonlite::fromJSON(rawToChar(post$content))
  datos <- df$datos
  json <- toJSON(datos)

  return(json)
}
