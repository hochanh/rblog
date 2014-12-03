jekyll_it <- function(dir=getwd(), images.dir=dir, images.url='',
                      out_ext='.md', in_ext='.rmd', recursive=FALSE) {
  require(knitr, quietly=TRUE, warn.conflicts=TRUE)
  # Scan folder for .Rmd files
  files <- list.files(path=dir, pattern=in_ext, 
                     ignore.case=TRUE, recursive=FALSE)
  # Check if files converted then not scan
  if (file.exists("knitr.F")) {
    files2 <- readLines("knitr.F")
    for (fil in files2) message(paste("Not scan ", fil, sep=''))
    files <- setdiff(files, files2)
  }
  # Scanning files not converted
  for (fil in files) {
    message(paste("Scanning ", fil, sep=''))
    content <- readLines(fil)
    frontMatter <- which(substr(content, 1, 3) == '---')
    if(length(frontMatter) >= 2 & 1 %in% frontMatter) {
      statusLine <- which(substr(content, 1, 10) == 'published:')
      if(statusLine > frontMatter[1] & statusLine < frontMatter[2]) {
        status <- unlist(strsplit(content[statusLine], ':'))[2]
        status <- sub('[[:space:]]+$', '', status)
        status <- sub('^[[:space:]]+', '', status)
        if (tolower(status) == 'yes') files2 <- c(files2, fil)
        else if (tolower(status) == 'no') {
          files2 <- c(files2, fil)
          message(paste('Processing ', fil, sep=''))
          # Write 'published: yes' to original files 
          # to prevent processing next time
          content[statusLine] <- 'published: yes'
          writeLines( content, fil)
          # Generate content to new files
          content[nchar(content) == 0] <- ' '
          content[statusLine] <- 'converted: yes'
          outFile <- paste0("../_posts/",
                            substr(fil, 1, (nchar(fil)-(nchar(in_ext)))),
                            out_ext, sep='')
          outFig <- paste0("../figures/",
                           substr(fil, 12, (nchar(fil)-(nchar(in_ext)))),
                           "/", sep='')
          render_markdown(strict=TRUE)
          render_jekyll(highlight='pygments')
          opts_knit$set(out.format='markdown')
          opts_knit$set(base.dir=images.dir)
          opts_knit$set(base.url=images.url)
          opts_chunk$set(fig.path=outFig)
          try(knit(text=content, output=outFile), silent=FALSE)
        }
      }
    } 
  }
  # Write converted files to knitr.F
  if (!is.null(setdiff(files, files2))) writeLines(files2, "knitr.F")
  invisible()
}
jekyll_it()