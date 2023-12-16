Todays Greater Sydney Dam Report
================
Last updated on 16 December, 2023

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
days based off a range of rolling averages. Users worried about drought
should focus on the 7 and 30 day forecasts as measures of the severity
of recent conditions. Users can also take solace knowing there is a
degree of mean reversion via the 90 and 120 day averages.

As this scraper becomes more rich longer rolling averages may be
introduced.

``` r
#Based off yesterdays reading we estimate the following day zeros

knitr::kable(Yesterdays_day_zeros)
```

| Variable                | Estimated\_Day\_zero\_daily\_depletion\_rate | Estimated\_Day\_zero\_weekly\_depletion\_rate | Estimated\_Day\_zero\_monthly\_depletion\_rate | Estimated\_Day\_zero\_60day\_depletion\_rate | Estimated\_Day\_zero\_90day\_depletion\_rate | Estimated\_Day\_zero\_120day\_depletion\_rate |
| :---------------------- | :------------------------------------------- | :-------------------------------------------- | :--------------------------------------------- | :------------------------------------------- | :------------------------------------------- | :-------------------------------------------- |
| Avon Dam                | NA                                           | NA                                            | 2025-06-04                                     | 2033-02-05                                   | 2030-09-24                                   | 2047-02-16                                    |
| Blue Mountains Dams     | NA                                           | NA                                            | NA                                             | NA                                           | NA                                           | NA                                            |
| Cataract Dam            | NA                                           | NA                                            | NA                                             | NA                                           | NA                                           | NA                                            |
| Cordeaux Dam            | NA                                           | NA                                            | 2024-05-12                                     | 2026-06-27                                   | 2025-10-27                                   | 2029-08-25                                    |
| Fitzroy Falls Reservoir | 2024-01-16                                   | NA                                            | 2024-06-18                                     | 2026-03-22                                   | 2026-04-19                                   | 2028-10-28                                    |
| Nepean Dam              | NA                                           | NA                                            | 2029-11-13                                     | NA                                           | 2054-01-30                                   | NA                                            |
| Prospect Reservoir      | NA                                           | 2025-12-03                                    | 2025-06-29                                     | NA                                           | 2089-01-02                                   | 2129-02-02                                    |
| Tallowa Dam             | NA                                           | NA                                            | NA                                             | NA                                           | NA                                           | NA                                            |
| Warragamba Dam          | 2024-03-15                                   | NA                                            | 2025-11-20                                     | 2029-09-01                                   | 2030-10-01                                   | 2038-07-16                                    |
| Wingecarribee Reservoir | NA                                           | NA                                            | 2024-09-17                                     | 2028-01-17                                   | 2027-04-18                                   | 2034-04-27                                    |
| Woronora Dam            | NA                                           | NA                                            | 2025-04-29                                     | 2029-08-26                                   | 2029-07-30                                   | 2036-11-25                                    |

``` r
#Based off yesterdays reading we estimate the folling spill over days
knitr::kable(yesterdays_spillover_days)
```

| Variable                | Estimated\_spillover\_day\_daily\_capacity\_rate | Estimated\_spillover\_day\_weekly\_capacity\_rate | Estimated\_spillover\_day\_60day\_capacity\_rate | Estimated\_spillover\_day\_90day\_capacity\_rate | Estimated\_spillover\_day\_120day\_capacity\_rate |
| :---------------------- | :----------------------------------------------- | :------------------------------------------------ | :----------------------------------------------- | :----------------------------------------------- | :------------------------------------------------ |
| Avon Dam                | NA                                               | NA                                                | NA                                               | NA                                               | NA                                                |
| Blue Mountains Dams     | NA                                               | NA                                                | 2030-07-11                                       | 2030-01-16                                       | 2058-06-14                                        |
| Cataract Dam            | NA                                               | NA                                                | 2026-08-09                                       | 2028-07-13                                       | 2034-03-18                                        |
| Cordeaux Dam            | NA                                               | NA                                                | NA                                               | NA                                               | NA                                                |
| Fitzroy Falls Reservoir | NA                                               | 2024-02-29                                        | NA                                               | NA                                               | NA                                                |
| Nepean Dam              | NA                                               | NA                                                | 2045-03-08                                       | NA                                               | 2042-01-19                                        |
| Prospect Reservoir      | 2023-12-27                                       | NA                                                | 2024-12-09                                       | NA                                               | NA                                                |
| Tallowa Dam             | NA                                               | NA                                                | 2023-12-15                                       | 2023-12-15                                       | 2023-12-15                                        |
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

    ## Warning: Removed 1 row containing missing values (`geom_line()`).

![](readme_files/figure-gfm/graph%202-2.png)<!-- -->
