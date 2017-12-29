# TryMarkdown

This app is inspired by and based on [@daroczig](https://github.com/daroczig)'s [gist](https://gist.github.com/daroczig/2812971d0c2613ceb669).

I added the ability to download a text version of the markdown input as well as a pdf viewer of Markdown basics.

## Running the TryMarkdown app locally

### Via the runGitHub command
```r
library(shiny)
shiny::runGitHub('TryMarkdown', 'sdhutchins')
```

### Via cloning the repository
1. Clone or download the git repository.
```bash
git clone https://github.com/sdhutchins/TryMarkdown.git
```

2. Open RStudio or Rconsole and type:
```r
library(shiny)
runApp('path/to/TryMarkdown')
```
## Dependencies
The dependencies are `shiny` and `shinythemes`. Ensure you have the latest versions installed and the latest version of R.