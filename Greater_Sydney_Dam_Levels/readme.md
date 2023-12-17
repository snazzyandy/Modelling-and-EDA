Todays Greater Sydney Dam Report
================
Last updated on 17 December, 2023

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

| Variable                | Estimated\_Day\_zero\_daily\_depletion\_rate | Estimated\_Day\_zero\_weekly\_depletion\_rate | Estimated\_Day\_zero\_monthly\_depletion\_rate  | Estimated\_Day\_zero\_60day\_depletion\_rate    | Estimated\_Day\_zero\_90day\_depletion\_rate    | Estimated\_Day\_zero\_120day\_depletion\_rate   |
| :---------------------- | :------------------------------------------- | :-------------------------------------------- | :---------------------------------------------- | :---------------------------------------------- | :---------------------------------------------- | :---------------------------------------------- |
| Avon Dam                | NULL                                         | 19797, 19797, 19797, 19797, 19797             | 20236, 20244, 20253, 20261, 20270, 20280, 20289 | 22930, 23047, 23172, 23307, 23453, 23611, 23783 | 22043, 22088, 22134, 22182, 22232, 22284, 22339 | 26815, 27050, 27302, 27571, 27860, 28171, 28438 |
| Blue Mountains Dams     | NULL                                         | NULL                                          | NULL                                            | NULL                                            | NULL                                            | NULL                                            |
| Cataract Dam            | NULL                                         | NULL                                          | NULL                                            | NULL                                            | NULL                                            | NULL                                            |
| Cordeaux Dam            | NULL                                         | 19732, 19732, 19732, 19732, 19732             | 19854, 19856, 19859, 19862, 19864, 19867, 19870 | 20600, 20632, 20663, 20696, 20731, 20769, 20809 | 20346, 20360, 20374, 20389, 20404, 20419, 20434 | 21511, 21561, 21615, 21672, 21728, 21787, 21850 |
| Fitzroy Falls Reservoir | 19722                                        | 19778, 19781, 19787, 19790, 19785             | 19833, 19832, 19830, 19830, 19831, 19832, 19833 | 20115, 20120, 20127, 20133, 20139, 20145, 20151 | 20207, 20207, 20207, 20207, 20207, 20207, 20207 | 20505, 20516, 20528, 20540, 20552, 20565, 20578 |
| Nepean Dam              | NULL                                         | 19854, 19860, 19867, 19875, 19883             | 21867, 21867, 21867, 21867, 21867, 21867, 21867 | NULL                                            | 28411, 28964, 29762, 30711, 31857, 33270, 35054 | NULL                                            |
| Prospect Reservoir      | NULL                                         | 24068, 19915, 19915, 19915, 19915, 19915      | 20429, 20429, 20429, 20429, 20429, 20429, 20435 | NULL                                            | NULL                                            | NULL                                            |
| Tallowa Dam             | NULL                                         | NULL                                          | NULL                                            | NULL                                            | NULL                                            | NULL                                            |
| Warragamba Dam          | NULL                                         | 19834, 19834, 19834, 19834, 19834             | 20407, 20413, 20419, 20425, 20432, 20438, 20445 | 21767, 21794, 21821, 21848, 21877, 21906, 21936 | 22116, 22140, 22164, 22189, 22214, 22240, 22266 | 24633, 24709, 24786, 24866, 24949, 25034, 25122 |
| Wingecarribee Reservoir | NULL                                         | 19760, 19760, 19760, 19760, 19760             | 19981, 19984, 19987, 19990, 19993, 19996, 19999 | 21142, 21201, 21264, 21334, 21409, 21492, 21584 | 20864, 20886, 20906, 20927, 20948, 20971, 20994 | 22997, 23085, 23179, 23278, 23382, 23493, 23611 |
| Woronora Dam            | NULL                                         | 19796, 19796, 19796, 19796, 19796             | 20201, 20208, 20214, 20220, 20227, 20234, 20241 | 21761, 21788, 21815, 21843, 21872, 21902, 21932 | 21666, 21698, 21732, 21761, 21791, 21821, 21846 | 23965, 24051, 24142, 24236, 24334, 24436, 24543 |

``` r
#Based off yesterdays reading we estimate the folling spill over days
knitr::kable(yesterdays_spillover_days)
```

| Variable                | Estimated\_spillover\_day\_daily\_capacity\_rate | Estimated\_spillover\_day\_weekly\_capacity\_rate | Estimated\_spillover\_day\_60day\_capacity\_rate | Estimated\_spillover\_day\_90day\_capacity\_rate | Estimated\_spillover\_day\_120day\_capacity\_rate |
| :---------------------- | :----------------------------------------------- | :------------------------------------------------ | :----------------------------------------------- | :----------------------------------------------- | :------------------------------------------------ |
| Avon Dam                | NULL                                             | 20834                                             | NULL                                             | NULL                                             | NULL                                              |
| Blue Mountains Dams     | NULL                                             | 19733, 19731, 19730, 19730, 19730                 | 22507, 22107, 21807, 21574, 21387, 21234, 21107  | 21769, 21847, 21888, 21931, 21975, 22021, 22070  | 29307, 29787, 30318, 30907, 31566, 32307, 33147   |
| Cataract Dam            | NULL                                             | 21275, 19931, 19931, 19931, 19931, 19931          | 20659, 20675, 20692, 20709, 20726, 20745, 20764  | 21447, 21424, 21401, 21379, 21358, 21337, 21337  | 23307, 23335, 23364, 23393, 23423, 23453, 23484   |
| Cordeaux Dam            | NULL                                             | 21471                                             | NULL                                             | NULL                                             | NULL                                              |
| Fitzroy Falls Reservoir | NULL                                             | 20377                                             | NULL                                             | NULL                                             | NULL                                              |
| Nepean Dam              | NULL                                             | NULL                                              | 30907, 27461, 25636, 24507, 23739, 23183, 22762  | NULL                                             | 26907, 26781, 26659, 26541, 26427, 26317, 26210   |
| Prospect Reservoir      | 19718                                            | NULL                                              | 19923, 19927, 19931, 19936, 19941, 19947, 19953  | 21992, 21603, 21357, 21192, 21078, 20998, 20945  | 22071, 21938, 21819, 21712, 21615, 21528, 21448   |
| Tallowa Dam             | NULL                                             | 19707, 19707, 19707, 19707, 19707                 | 19707, 19707, 19707, 19707, 19707, 19707, 19707  | 19707, 19707, 19707, 19707, 19707, 19707, 19707  | 19707, 19707, 19707, 19707, 19707, 19707, 19707   |
| Warragamba Dam          | NULL                                             | NULL                                              | NULL                                             | NULL                                             | NULL                                              |
| Wingecarribee Reservoir | NULL                                             | 21618                                             | NULL                                             | NULL                                             | NULL                                              |
| Woronora Dam            | NULL                                             | NULL                                              | NULL                                             | NULL                                             | NULL                                              |

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

    ## Warning: Removed 8 rows containing missing values (`geom_line()`).

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
