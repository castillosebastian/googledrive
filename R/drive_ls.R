#' List contents of a folder.
#'
#' @param path Character. A single path on Google Drive whose contents you
#'   want to list.
#' @param pattern Character. If provided, only the files whose names match this
#'   regular expression are returned.
#' @param ... Parameters to pass along to the API query.
#'
#' @template dribble-return
#' @export
#'
#' @examples
#' \dontrun{
#' ## get contents of the folder 'abc' (non-recursive)
#' drive_ls("abc")
#'
#' ## get contents of folder 'abc' that contain the
#' ## letters 'def'
#' drive_ls(path = "abc", pattern = "def")
#' }
drive_ls <- function(path = "~/", pattern = NULL, ...) {

  x <- list(...)
  q_clause <- NULL

  if (!is.null(path)) {
    if (is.character(path)) {
      path <- append_slash(path)
    }
    path <- as_dribble(path)
    path <- confirm_single_file(path)

    q_clause <- paste(sq(path$id), "in parents")
    if (!is.null(x$q)) {
      q_clause <- paste(x$q, "and", q_clause)
    }
  }

  drive_search(pattern = pattern, q = q_clause)
}
