# Pie chart

Pie chart

## Usage

``` r
acro_pie(
  data,
  column,
  radius = 0.8,
  clockwise = FALSE,
  init.angle = if (clockwise) 90 else 0,
  col = NULL,
  border = NULL,
  lty = NULL,
  filename = "pie.png",
  ...
)
```

## Arguments

- data:

  The object holding the data.

- column:

  The name of the column that will be used to plot the pie chart.

- radius:

  The radius of the pie chart.

- clockwise:

  logical indicating if slices are drawn clockwise or counter clockwise.

- init.angle:

  number specifying the starting angle (in degrees) for the slices.
  Defaults to 0 (i.e., ‘3 o'clock’) unless clockwise is true where
  init.angle defaults to 90 (degrees), (i.e., ‘12 o'clock’).

- col:

  colors to be used in filling or shading the slices

- border:

  The color to draw the border.

- lty:

  The line style.

- filename:

  The name of the file where the pie chart will be saved.

- ...:

  Any other parameters.

## Value

The pie chart
