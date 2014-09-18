require(knitr)
require(markdown)
setwd("C:/R workspace/getting and cleaning data/UCI HAR Dataset")
knit("run_analysis.Rmd", encoding="ISO8859-1")
markdownToHTML("run_analysis.md", "run_analysis.html")
knit("Codebook.Rmd", output="Codebook.md", encoding="ISO8859-1", quiet=TRUE)
markdownToHTML("Codebook.md", "codebook.html")
#for further information check run_analysis.Rmd