% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/drive_search.R
\name{drive_search}
\alias{drive_search}
\title{Search for files on Google Drive.}
\usage{
drive_search(pattern = NULL, ..., verbose = TRUE)
}
\arguments{
\item{pattern}{Character. If provided, only the files whose names match this
regular expression are returned.}

\item{...}{Parameters to pass along to the API query.}

\item{verbose}{Logical, indicating whether to print informative messages
(default \code{TRUE}).}
}
\value{
An object of class \code{dribble}, a tibble with
   one row per file.
}
\description{
This will default to the most recent 100 files on your Google Drive. For
example, to get 200 instead, specify the \code{pageSize}, i.e.
\code{drive_ls(pageSize = 200)}.
}
\examples{
\dontrun{
## list "My Drive" w/o regard for folder hierarchy
drive_search()

## search for files located directly in your root folder
drive_search(q = "'root' in parents")

## filter for folders
drive_search(q = "mimeType = 'application/vnd.google-apps.folder'")

## get contents of the folder 'abc' (non-recursive)
## THIS WORKFLOW WILL GET SMOOTHER!
## first, get the folder's id
x <- drive_path("abc")
## now, search for files with this folder as direct parent
q_clause <- paste(shQuote(x$id), "in parents")
drive_search(q = q_clause)

## files whose names match a regex
drive_search(pattern = "jt")

## filter for Google Sheets
drive_search(q = "mimeType='application/vnd.google-apps.spreadsheet'")

## filter for folders
drive_search(q = "mimeType='application/vnd.google-apps.folder'")
}

}
\seealso{
Helpful links for forming queries:
\itemize{
\item \url{https://developers.google.com/drive/v3/web/search-parameters}
\item \url{https://developers.google.com/drive/v3/reference/files/list}
}
}
