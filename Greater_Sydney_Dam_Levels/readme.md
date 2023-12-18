Todays Greater Sydney Dam Report
================
Last updated on 18 December, 2023

This product is currently:

[![damlevel\_scrape.r](https://github.com/snazzyandy/Modelling-and-EDA/actions/workflows/greatersydscraper.yml/badge.svg)](https://github.com/snazzyandy/Modelling-and-EDA/actions/workflows/greatersydscraper.yml)

## Why Scrape Greater Sydney Dam Levels?

A friend of mine mentioned that WaterNSW updated their website. However,
like with most web facelifts, the websites’s functionality took a hit.
You used to be able to get all the daily historic data output as a csv,
now you have these lovely pictures of the dams.

As a policy maker hes very interested in the daily releases of dam
levels as a historic dataset. Rather than him visiting the site each day
and recording the data manually I wrote this basic script with github
actions to scrape the site every day then kick it out as a csv.

The data we are borrowing is from [this page on Water NSW’s
site](https://www.waternsw.com.au/nsw-dams/nsw-storage-levels/greater-sydney-dam-levels)\!
![Image](Images/WNSWScreenshot.png)

## Why Not use water insights?

[The WNSW app Water
insights](https://waterinsights.waternsw.com.au/12964-sydney-drinking-water-catchment/#!)
is a great product for most users but doesnt solve my daily data point
query. Instead it offers weekly, monthly and yearly data series. For
those looking for longitudinal data this is very useful\!

## Where can i access the data?

All these daily data extracts are available in the data folder. Open
sourcing (MIT Licence) for those who are interested \#OpenData\!

## How has this product been performing

``` r
## How has the scraper performed over the last week?

Percentage_Of_complete_daily_reads
```

![](readme_files/figure-gfm/graph-1.png)<!-- -->

## What are the key inferences we can derive from this data

Collecting daily data allows us to produce more granular rolling average
estimates. These averages trend either upwards or downwards.

When dam levels trend towards 100% it means we are approaching
‘Spillover Day’. Spillover day means that any additional water
introduced to this dam will be redirected to either the floodgates or
the spillway that connects to local rivers or communities.

Inversely, when dam levels are trending downwards 0% it means we are
approaching “Day Zero”. This means that the communities that are
serviced by the dam are more likely to suffer drought restrictions and
water utilities will have to treat more turbid water due to higher
sediment levels at the bottom of these dams. While it is highly unlikely
that these dams will actually reach zero as government intervention
requires the construction of desalination to intervene in the depletion
rate this estimate speaks to how soon these events may happen based off
the latest data.

Using the current storage level and the rolling averages sampled at
1,7,30,60,90 and 120 days can estimate the “Spillover” and “Day Zero”
days using a range of rolling average estimates. Users worried about
drought should focus on the 7 and 30 day forecasts as they imply the
most recent rate of decay. Users can also take solace knowing there is a
degree of mean reversion when it comes to dams. Looking at the 90 and
120 day averages speak to a more conservative estimate.

As this scraper becomes more rich longer rolling averages may be
introduced.

``` r
#Based off yesterdays reading we estimate the following day zeros

knitr::kable(Yesterdays_day_zeros)
```

| Variable                | Estimated\_Day\_zero\_daily\_depletion\_rate | Estimated\_Day\_zero\_weekly\_depletion\_rate | Estimated\_Day\_zero\_monthly\_depletion\_rate | Estimated\_Day\_zero\_60day\_depletion\_rate | Estimated\_Day\_zero\_90day\_depletion\_rate | Estimated\_Day\_zero\_120day\_depletion\_rate |
| :---------------------- | :------------------------------------------- | :-------------------------------------------- | :--------------------------------------------- | :------------------------------------------- | :------------------------------------------- | :-------------------------------------------- |
| Avon Dam                | 2024-03-02                                   | 2024-03-02                                    | 2025-03-20                                     | 2029-10-23                                   | 2029-01-13                                   | 2035-08-31                                    |
| Blue Mountains Dams     | NA                                           | NA                                            | NA                                             | NA                                           | NA                                           | NA                                            |
| Cataract Dam            | 2024-02-22                                   | NA                                            | NA                                             | NA                                           | NA                                           | NA                                            |
| Cordeaux Dam            | 2024-02-18                                   | 2024-01-09                                    | 2024-05-13                                     | 2026-04-08                                   | 2025-09-01                                   | 2028-04-09                                    |
| Fitzroy Falls Reservoir | 2024-01-05                                   | 2024-02-02                                    | 2024-03-24                                     | 2024-10-18                                   | 2024-12-21                                   | 2025-07-30                                    |
| Nepean Dam              | NA                                           | 2024-06-10                                    | 2029-11-15                                     | NA                                           | 2061-02-03                                   | NA                                            |
| Prospect Reservoir      | NA                                           | 2024-10-27                                    | 2026-09-24                                     | NA                                           | NA                                           | NA                                            |
| Tallowa Dam             | NA                                           | NA                                            | NA                                             | NA                                           | NA                                           | NA                                            |
| Warragamba Dam          | NA                                           | 2024-04-22                                    | 2025-12-24                                     | 2030-01-23                                   | 2030-11-23                                   | 2038-04-24                                    |
| Wingecarribee Reservoir | 2024-02-15                                   | 2024-02-02                                    | 2024-08-21                                     | 2027-04-20                                   | 2026-09-22                                   | 2030-07-20                                    |
| Woronora Dam            | NA                                           | 2024-03-15                                    | 2025-06-03                                     | 2030-01-19                                   | 2029-09-30                                   | 2036-08-17                                    |

``` r
#Based off yesterdays reading we estimate the folling spill over days
knitr::kable(yesterdays_spillover_days)
```

| Variable                | Estimated\_spillover\_day\_daily\_capacity\_rate | Estimated\_spillover\_day\_weekly\_capacity\_rate | Estimated\_spillover\_day\_60day\_capacity\_rate | Estimated\_spillover\_day\_90day\_capacity\_rate | Estimated\_spillover\_day\_120day\_capacity\_rate |
| :---------------------- | :----------------------------------------------- | :------------------------------------------------ | :----------------------------------------------- | :----------------------------------------------- | :------------------------------------------------ |
| Avon Dam                | NA                                               | NA                                                | NA                                               | NA                                               | NA                                                |
| Blue Mountains Dams     | NA                                               | 2024-01-09                                        | 2027-10-17                                       | 2030-04-18                                       | 2056-06-05                                        |
| Cataract Dam            | NA                                               | NA                                                | 2030-08-06                                       | 2034-07-26                                       | 2349-03-23                                        |
| Cordeaux Dam            | NA                                               | NA                                                | NA                                               | NA                                               | NA                                                |
| Fitzroy Falls Reservoir | NA                                               | NA                                                | NA                                               | NA                                               | NA                                                |
| Nepean Dam              | NA                                               | NA                                                | 2032-04-28                                       | NA                                               | 2042-05-11                                        |
| Prospect Reservoir      | 2023-12-27                                       | NA                                                | 2024-05-28                                       | 2025-05-09                                       | 2025-11-25                                        |
| Tallowa Dam             | NA                                               | 2023-12-17                                        | 2023-12-17                                       | 2023-12-17                                       | 2023-12-17                                        |
| Warragamba Dam          | NA                                               | NA                                                | NA                                               | NA                                               | NA                                                |
| Wingecarribee Reservoir | NA                                               | NA                                                | NA                                               | NA                                               | NA                                                |
| Woronora Dam            | NA                                               | NA                                                | NA                                               | NA                                               | NA                                                |

``` r
# We can also visualize the spillover/day zero estimates using trend charts out to 2060 and 2030.
# As the lines converge, there is more mean reversion between the current depletion rate and the future rate
# As the lines diverge, it is more likely the recent data is an outlier to the historical average
# Note the most recent severe droughts had a 13% and 20% system depletion rate estimating the system runs out of water by 7.7 and 5 years respectively.

gg_dam_forecast_60
```

![](readme_files/figure-gfm/graph%202-1.png)<!-- -->

``` r
gg_dam_forecast_30
```

    ## Warning: Removed 2 rows containing missing values (`geom_line()`).

![](readme_files/figure-gfm/graph%202-2.png)<!-- -->

# Not all dams were created equal.

The graphic front loaded to this tool shows that capacities of each of
these dams are different. Policy makers therefore tend to hawk over
Warragamba dam levels data points rather than the wider range as it
dwarfs all other dams in this system. An important side note is this
7500mL figure used for Tallowa dam refers to the amount Tallowa
contributes to the wider system as part of the “Shoalhaven transfer
scheme”. Tallowa dam has an actual storage capacity of around 90,000ML

``` r
knitr::kable(dams_capacity)
```

| Dam.Name                | Water Capacity (In Millions of litres) |
| :---------------------- | -------------------------------------: |
| Warragamba Dam          |                                2064680 |
| Avon Dam                |                                 142230 |
| Cataract Dam            |                                  97190 |
| Cordeaux Dam            |                                  93790 |
| Woronora Dam            |                                  69536 |
| Nepean Dam              |                                  67730 |
| Prospect Reservoir      |                                  33330 |
| Wingecarribee Reservoir |                                  29880 |
| Fitzroy Falls Reservoir |                                   9950 |
| Tallowa Dam             |                                   7500 |
| Blue Mountains Dams     |                                   2890 |
