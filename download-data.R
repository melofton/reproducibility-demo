
lake_directory <- here::here()
download.file(url = "https://sandbox.zenodo.org/record/1221469/files/scores.zip?download=1",
              destfile = file.path(lake_directory,"scores.zip"),
              method = "curl")
unzip(file.path(lake_directory,"scores.zip"))

