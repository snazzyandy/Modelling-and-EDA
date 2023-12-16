Todays Greater Sydney Dam Report
================
Last updated on 16 December, 2023

## Welcome to the Greater Sydney Dam Levels Daily Data Scraper

This product is currently:

[![damlevel_scrape.r](https://github.com/snazzyandy/Modelling-and-EDA/actions/workflows/greatersydscraper.yml/badge.svg)](https://github.com/snazzyandy/Modelling-and-EDA/actions/workflows/greatersydscraper.yml)

## What Can we learn from the most recent readings

``` r
## How has the scraper performed over the last week?
# Testing next to see if its deployed in the markdown on deploy

Percentage_Of_complete_daily_reads
```

![](readme_files/figure-gfm/graph-1.png)<!-- -->

``` r
#Based off the most recent estimates we can derive the following dates the dams will reach empty.
knitr::kable(Yesterdays_day_zeros)
```

| Variable                | Estimated_Day_zero_daily_depletion_rate | Estimated_Day_zero_weekly_depletion_rate | Estimated_Day_zero_monthly_depletion_rate | Estimated_Day_zero_60day_depletion_rate | Estimated_Day_zero_90day_depletion_rate | Estimated_Day_zero_120day_depletion_rate |
|:------------------------|:----------------------------------------|:-----------------------------------------|:------------------------------------------|:----------------------------------------|:----------------------------------------|:-----------------------------------------|
| Avon Dam                | NA                                      | 2024-03-14                               | 2025-07-19                                | 2035-02-11                              | 2032-05-29                              | 2037-09-09                               |
| Blue Mountains Dams     | NA                                      | NA                                       | NA                                        | NA                                      | NA                                      | NA                                       |
| Cataract Dam            | NA                                      | NA                                       | NA                                        | NA                                      | NA                                      | NA                                       |
| Cordeaux Dam            | NA                                      | 2024-01-09                               | 2024-05-26                                | 2026-12-21                              | 2026-04-20                              | 2027-07-07                               |
| Fitzroy Falls Reservoir | 2024-01-16                              | 2024-11-22                               | 2024-06-19                                | 2026-07-25                              | 2026-05-28                              | 2027-11-04                               |
| Nepean Dam              | NA                                      | 2024-06-08                               | 2029-11-13                                | NA                                      | 2201-05-16                              | NA                                       |
| Prospect Reservoir      | NA                                      | 2024-05-17                               | 2025-07-03                                | NA                                      | 2093-08-26                              | 2049-04-12                               |
| Tallowa Dam             | NA                                      | NA                                       | NA                                        | NA                                      | NA                                      | NA                                       |
| Warragamba Dam          | 2024-03-15                              | 2024-04-20                               | 2025-12-22                                | 2030-01-21                              | 2031-07-07                              | 2035-08-22                               |
| Wingecarribee Reservoir | NA                                      | 2024-02-06                               | 2024-10-02                                | 2029-02-03                              | 2028-01-25                              | 2030-11-05                               |
| Woronora Dam            | NA                                      | 2024-03-13                               | 2025-06-01                                | 2030-01-17                              | 2030-05-28                              | 2033-05-30                               |

``` r
#For those values that are NA, we expect the dam to spill over before they begin depleting again 
knitr::kable(yesterdays_spillover_days)
```

| Variable                | Estimated_spillover_day_daily_capacity_rate | Estimated_spillover_day_weekly_capacity_rate | Estimated_spillover_day_60day_capacity_rate | Estimated_spillover_day_90day_capacity_rate | Estimated_spillover_day_120day_capacity_rate |
|:------------------------|:--------------------------------------------|:---------------------------------------------|:--------------------------------------------|:--------------------------------------------|:---------------------------------------------|
| Avon Dam                | NA                                          | NA                                           | NA                                          | NA                                          | NA                                           |
| Blue Mountains Dams     | NA                                          | 2024-01-07                                   | 2027-10-15                                  | 2032-02-15                                  | 2031-09-23                                   |
| Cataract Dam            | NA                                          | 2024-07-26                                   | 2026-11-06                                  | 2028-08-15                                  | 2032-04-23                                   |
| Cordeaux Dam            | NA                                          | NA                                           | NA                                          | NA                                          | NA                                           |
| Fitzroy Falls Reservoir | NA                                          | NA                                           | NA                                          | NA                                          | NA                                           |
| Nepean Dam              | NA                                          | NA                                           | 2032-04-26                                  | NA                                          | 2049-08-17                                   |
| Prospect Reservoir      | 2023-12-27                                  | NA                                           | 2025-02-15                                  | NA                                          | NA                                           |
| Tallowa Dam             | NA                                          | 2023-12-15                                   | 2023-12-15                                  | 2023-12-15                                  | 2023-12-15                                   |
| Warragamba Dam          | NA                                          | NA                                           | NA                                          | NA                                          | NA                                           |
| Wingecarribee Reservoir | NA                                          | NA                                           | NA                                          | NA                                          | NA                                           |
| Woronora Dam            | NA                                          | NA                                           | NA                                          | NA                                          | NA                                           |

``` r
#Based on a 120 day rolling average what date is warragamba likely to overflow or hit zero.
gg_dam_forecast_60
```

![](readme_files/figure-gfm/graph%202-1.png)<!-- -->

``` r
gg_dam_forecast_30
```

    ## Warning: Removed 3 rows containing missing values (`geom_line()`).

![](readme_files/figure-gfm/graph%202-2.png)<!-- -->

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
site](https://www.waternsw.com.au/nsw-dams/nsw-storage-levels/greater-sydney-dam-levels)!
![Image](Images/WNSWScreenshot.png)

## Why Not use water insights?

[The WNSW app Water
insights](https://waterinsights.waternsw.com.au/12964-sydney-drinking-water-catchment/#!)
is a great product for most users but doesnt solve my daily data point
query. Instead it offers weekly, monthly and yearly data series. For
those looking for longitudinal data this is very useful!

## Where can i access the data?

All these daily data extracts are available in the data folder. Open
sourcing (MIT Licence) for those who are interested \#OpenData!
