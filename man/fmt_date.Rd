% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/format_data.R
\name{fmt_date}
\alias{fmt_date}
\title{Format values as dates}
\usage{
fmt_date(data, columns, rows = NULL, date_style = 2)
}
\arguments{
\item{data}{A table object that is created using the \code{\link[=gt]{gt()}} function.}

\item{columns}{The columns to format. Can either be a series of column names
provided in \code{\link[=vars]{vars()}}, a vector of column indices, or a helper function
focused on selections. The select helper functions are: \code{\link[=starts_with]{starts_with()}},
\code{\link[=ends_with]{ends_with()}}, \code{\link[=contains]{contains()}}, \code{\link[=matches]{matches()}}, \code{\link[=one_of]{one_of()}}, and \code{\link[=everything]{everything()}}.}

\item{rows}{Optional rows to format. Not providing any value results in all
rows in \code{columns} being formatted. Can either be a vector of row captions
provided \code{\link[=c]{c()}}, a vector of row indices, or a helper function focused on
selections. The select helper functions are: \code{\link[=starts_with]{starts_with()}},
\code{\link[=ends_with]{ends_with()}}, \code{\link[=contains]{contains()}}, \code{\link[=matches]{matches()}}, \code{\link[=one_of]{one_of()}}, and \code{\link[=everything]{everything()}}.
We can also use expressions to filter down to the rows we need (e.g.,
\verb{[colname_1] > 100 & [colname_2] < 50}).}

\item{date_style}{The date style to use. Supply a number (from \code{1} to \code{14})
that corresponds to the preferred date style. Use \code{\link[=info_date_style]{info_date_style()}} to
see the different numbered and named date presets.}
}
\value{
An object of class \code{gt_tbl}.
}
\description{
Format input date values that are either of the \code{Date} type, or, are
character-based and expressed according to the ISO 8601 date format
(\code{YYYY-MM-DD}). Once the appropriate data cells are targeted with \code{columns}
(and, optionally, \code{rows}), we can simply apply a preset date style to format
the dates. The following date styles are available for simpler formatting of
ISO dates (all using the input date of \code{2000-02-29} in the example output
dates):
\enumerate{
\item iso: \code{2000-02-29}
\item wday_month_day_year: \verb{Tuesday, February 29, 2000}
\item wd_m_day_year: \verb{Tue, Feb 29, 2000}
\item wday_day_month_year: \verb{Tuesday 29 February 2000}
\item month_day_year: \verb{February 29, 2000}
\item m_day_year: \verb{Feb 29, 2000}
\item day_m_year: \verb{29 Feb 2000}
\item day_month_year: \verb{29 February 2000}
\item day_month: \verb{29 February}
\item year: \code{2000}
\item month: \code{February}
\item day: \code{29}
\item year.mn.day: \code{2000/02/29}
\item y.mn.day: \code{0/02/29}
}
We can use the \code{\link[=info_date_style]{info_date_style()}} function for a useful reference on all of
the possible inputs to \code{date_style}.
}
\details{
Targeting of values is done through \code{columns} and additionally by \code{rows} (if
nothing is provided for \code{rows} then entire columns are selected). A number of
helper functions exist to make targeting more effective. Conditional
formatting is possible by providing a conditional expression to the \code{rows}
argument. See the Arguments section for more information on this.
}
\section{Figures}{

\if{html}{\figure{man_fmt_date_1.png}{options: width=100\%}}

\if{html}{\figure{man_fmt_date_2.png}{options: width=100\%}}
}

\section{Function ID}{

3-5
}

\examples{
# Use `exibble` to create a gt table;
# keep only the `date` and `time` columns;
# format the `date` column to have
# dates formatted as `month_day_year`
# (date style `5`)
tab_1 <-
  exibble \%>\%
  dplyr::select(date, time) \%>\%
  gt() \%>\%
  fmt_date(
    columns = vars(date),
    date_style = 5
  )

# Use `exibble` to create a gt table;
# keep only the `date` and `time` columns;
# format the `date` column to have mixed
# date formats (dates after April will
# be different than the others)
tab_2 <-
  exibble \%>\%
  dplyr::select(date, time) \%>\%
  gt() \%>\%
  fmt_date(
    columns = vars(date),
    rows =
      as.Date(date) > as.Date("2015-04-01"),
    date_style = 6
  ) \%>\%
  fmt_date(
    columns = vars(date),
    rows =
      as.Date(date) <= as.Date("2015-04-01"),
    date_style = 7
  )

}
\seealso{
Other Format Data: 
\code{\link{data_color}()},
\code{\link{fmt_currency}()},
\code{\link{fmt_datetime}()},
\code{\link{fmt_markdown}()},
\code{\link{fmt_missing}()},
\code{\link{fmt_number}()},
\code{\link{fmt_passthrough}()},
\code{\link{fmt_percent}()},
\code{\link{fmt_scientific}()},
\code{\link{fmt_time}()},
\code{\link{fmt}()},
\code{\link{text_transform}()}
}
\concept{Format Data}
