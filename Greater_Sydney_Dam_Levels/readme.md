This product is currently:

[![damlevel\_scrape.r](https://github.com/snazzyandy/Modelling-and-EDA/actions/workflows/greatersydscraper.yml/badge.svg)](https://github.com/snazzyandy/Modelling-and-EDA/actions/workflows/greatersydscraper.yml)

Why Scrape Greater Sydney Dam Levels?
-------------------------------------

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

Why Not use water insights?
---------------------------

[The WNSW app Water
insights](https://waterinsights.waternsw.com.au/12964-sydney-drinking-water-catchment/#!)
is a great product for most users but doesnt solve my daily data point
query. Instead it offers weekly, monthly and yearly data series. For
those looking for longitudinal data this is very useful!

Where can i access the data?
----------------------------

All these daily data extracts are available in the data folder. Open
sourcing (MIT Licence) for those who are interested \#OpenData!

How has this product been performing
------------------------------------

    ## How has the scraper performed over the last week?
    # Testing next to see if its deployed in the markdown on deploy



    Percentage_Of_complete_daily_reads

![](readme_files/figure-markdown_strict/graph-1.png) \#\# What is the
key inference from this data

Collecting daily data allows us to produce more granular rolling average
estimates. These averages trend either upwards or downwards. When dam
levels trend towards 100% it means we are approaching ‘Spillover Day’.
Spillover day means that any addtional water introduced to this dam will
be redirected to either the floodgates or the spillway that connects to
local rivers or communities.

Inversely, when dam levels are trending downwards it means storage
capacity is reaching zero. This means that the communities that are
serviced by the dam are more likely to suffer drought restrictions and
water utilities will have to treat more turbid water due to higher
sediment levels at the bottom of these dams. It is highly unlikely that
these dams will actually reach zero as government intervention requires
the construction of desalination to artifically reduce this depletion
rate - a method that was highly effective in the 2016 and 2020 droughts
- however that is outside of the scope of this tool.

Using the current storage level and the rolling averages sampled at
1,7,30,60,90 and 120 days can estimate the “Spillover” and “Day Zero”
days based off the most recent data.

    #Based off yesterdays reading we estimate the following day zeros

    knitr::kable(Yesterdays_day_zeros)

<table>
<colgroup>
<col style="width: 8%" />
<col style="width: 14%" />
<col style="width: 15%" />
<col style="width: 15%" />
<col style="width: 14%" />
<col style="width: 14%" />
<col style="width: 15%" />
</colgroup>
<thead>
<tr class="header">
<th style="text-align: left;">Variable</th>
<th style="text-align: left;">Estimated_Day_zero_daily_depletion_rate</th>
<th style="text-align: left;">Estimated_Day_zero_weekly_depletion_rate</th>
<th style="text-align: left;">Estimated_Day_zero_monthly_depletion_rate</th>
<th style="text-align: left;">Estimated_Day_zero_60day_depletion_rate</th>
<th style="text-align: left;">Estimated_Day_zero_90day_depletion_rate</th>
<th style="text-align: left;">Estimated_Day_zero_120day_depletion_rate</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;">Avon Dam</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">2024-03-14</td>
<td style="text-align: left;">2025-06-21</td>
<td style="text-align: left;">2033-10-23</td>
<td style="text-align: left;">2031-04-25</td>
<td style="text-align: left;">2034-05-21</td>
</tr>
<tr class="even">
<td style="text-align: left;">Blue Mountains Dams</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">NA</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Cataract Dam</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">NA</td>
</tr>
<tr class="even">
<td style="text-align: left;">Cordeaux Dam</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">2024-01-09</td>
<td style="text-align: left;">2024-05-18</td>
<td style="text-align: left;">2026-08-30</td>
<td style="text-align: left;">2025-12-27</td>
<td style="text-align: left;">2026-09-10</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Fitzroy Falls Reservoir</td>
<td style="text-align: left;">2024-01-16</td>
<td style="text-align: left;">2024-09-21</td>
<td style="text-align: left;">2024-06-14</td>
<td style="text-align: left;">2026-05-09</td>
<td style="text-align: left;">2026-04-28</td>
<td style="text-align: left;">2027-12-22</td>
</tr>
<tr class="even">
<td style="text-align: left;">Nepean Dam</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">2024-05-16</td>
<td style="text-align: left;">2029-11-13</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">2072-05-04</td>
<td style="text-align: left;">2429-06-23</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Prospect Reservoir</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">2024-05-17</td>
<td style="text-align: left;">2025-06-29</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">2145-12-05</td>
<td style="text-align: left;">2043-09-01</td>
</tr>
<tr class="even">
<td style="text-align: left;">Tallowa Dam</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">NA</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Warragamba Dam</td>
<td style="text-align: left;">2024-03-15</td>
<td style="text-align: left;">2024-04-20</td>
<td style="text-align: left;">2025-12-02</td>
<td style="text-align: left;">2029-10-25</td>
<td style="text-align: left;">2031-01-13</td>
<td style="text-align: left;">2033-12-12</td>
</tr>
<tr class="even">
<td style="text-align: left;">Wingecarribee Reservoir</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">2024-02-06</td>
<td style="text-align: left;">2024-09-23</td>
<td style="text-align: left;">2028-05-29</td>
<td style="text-align: left;">2027-07-18</td>
<td style="text-align: left;">2029-05-20</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Woronora Dam</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">2024-03-13</td>
<td style="text-align: left;">2025-05-11</td>
<td style="text-align: left;">2029-10-20</td>
<td style="text-align: left;">2029-11-24</td>
<td style="text-align: left;">2031-12-12</td>
</tr>
</tbody>
</table>

    #Based off yesterdays reading we estimate the folling spill over days
    knitr::kable(yesterdays_spillover_days)

<table>
<colgroup>
<col style="width: 9%" />
<col style="width: 17%" />
<col style="width: 18%" />
<col style="width: 17%" />
<col style="width: 17%" />
<col style="width: 18%" />
</colgroup>
<thead>
<tr class="header">
<th style="text-align: left;">Variable</th>
<th style="text-align: left;">Estimated_spillover_day_daily_capacity_rate</th>
<th style="text-align: left;">Estimated_spillover_day_weekly_capacity_rate</th>
<th style="text-align: left;">Estimated_spillover_day_60day_capacity_rate</th>
<th style="text-align: left;">Estimated_spillover_day_90day_capacity_rate</th>
<th style="text-align: left;">Estimated_spillover_day_120day_capacity_rate</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;">Avon Dam</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">NA</td>
</tr>
<tr class="even">
<td style="text-align: left;">Blue Mountains Dams</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">2024-01-08</td>
<td style="text-align: left;">2029-01-24</td>
<td style="text-align: left;">2030-09-14</td>
<td style="text-align: left;">2028-03-02</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Cataract Dam</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">2024-07-26</td>
<td style="text-align: left;">2026-09-12</td>
<td style="text-align: left;">2028-06-12</td>
<td style="text-align: left;">2031-05-18</td>
</tr>
<tr class="even">
<td style="text-align: left;">Cordeaux Dam</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">NA</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Fitzroy Falls Reservoir</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">NA</td>
</tr>
<tr class="even">
<td style="text-align: left;">Nepean Dam</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">2037-02-04</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">NA</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Prospect Reservoir</td>
<td style="text-align: left;">2023-12-27</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">2024-12-31</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">NA</td>
</tr>
<tr class="even">
<td style="text-align: left;">Tallowa Dam</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">2023-12-15</td>
<td style="text-align: left;">2023-12-15</td>
<td style="text-align: left;">2023-12-15</td>
<td style="text-align: left;">2023-12-15</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Warragamba Dam</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">NA</td>
</tr>
<tr class="even">
<td style="text-align: left;">Wingecarribee Reservoir</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">NA</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Woronora Dam</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">NA</td>
</tr>
</tbody>
</table>

    # We can also visualize the spillover/day zero estimates using trend charts out to 2060 and 2030.
    # As the lines converge, there is more mean reversion between the current depletion rate and the future rate
    # As the lines diverge, it is more likely the recent data is an outlier to the historical average
    # Note the most recent severe droughts had a 13% and 20% system depletion rate estimating the system runs out of water by 7.7 and 5 years respectively.

    gg_dam_forecast_60

![](readme_files/figure-markdown_strict/graph%202-1.png)

    gg_dam_forecast_30

    ## Warning: Removed 1 row containing missing values (`geom_line()`).

![](readme_files/figure-markdown_strict/graph%202-2.png)
