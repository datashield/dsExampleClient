#' Check Validity of Datasources
#'
#' Internal function to validate that the `datasources` argument is a list of `DSConnection` objects.
#'
#' @param datasources A list of objects that should all be of class `DSConnection`.
#' @return This function is called for its side effects. It throws an error if the input is not a
#' valid list of `DSConnection` objects.
#' @keywords internal
#' @importFrom cli cli_abort
#' @importFrom methods is
#' @noRd
.check_datasources <- function(datasources) {
  if(!(is.list(datasources) && all(unlist(lapply(datasources, function(d) {is(d,"DSConnection")}))))){
    cli_abort(
      c(
        "'Datasources' must be a list of objects with class `DSConnection`"
      ), call = NULL
    )
  }
}
