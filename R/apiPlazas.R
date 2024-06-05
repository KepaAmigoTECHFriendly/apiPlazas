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

  URL <- "https://apiparking.sol-fix.es/api/parking?code=q7pF1Fo1kgfOxcN-wwx58lWFvz27EB_wSd23su6ZwOgrAzFux-iKaw%3D%3D"

  json <- '{
  "FechaUTC": "2024-06-05T00:04:20",
  "Municipio": "Almusaffes",
  "Id_Municipio": 78,
  "Token": "AlMu$$a2024ParkinApi"
  }'

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
