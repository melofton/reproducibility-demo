library(ggplot2)
lake_directory <- here::here()

download.file(url = "https://sandbox.zenodo.org/record/1221469/files/scores.zip?download=1",
              destfile = file.path(lake_directory,"scores.zip"),
              method = "curl")
unzip(file.path(lake_directory,"scores.zip"))

df <- arrow::open_dataset("/Users/quinn/Downloads/reproducibility-demo/scores/ler_ms/reruns") |>
  dplyr::filter(model_id == "GLM",
                variable == "temperature",
                depth == 1,
                reference_datetime == "2021-03-01 00:00:00") |>
  dplyr::collect()

df |> ggplot(aes(x = datetime)) +
  geom_ribbon(aes(ymin = quantile10, ymax = quantile90), fill = "lightblue") +
  geom_line(aes(y = median), color = "blue") +
  geom_point(aes(y = observation))

