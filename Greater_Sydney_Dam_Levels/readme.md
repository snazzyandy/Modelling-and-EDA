Welcome to the Greater Sydney Dam Levels Daily Data Scraper
-----------------------------------------------------------

This product is currently:

[![damlevel\_scrape.r](https://github.com/snazzyandy/Modelling-and-EDA/actions/workflows/greatersydscraper.yml/badge.svg)](https://github.com/snazzyandy/Modelling-and-EDA/actions/workflows/greatersydscraper.yml)

What Can we learn from the most recent readings
-----------------------------------------------

    ## How has the scraper performed over the last week?
    # Testing next to see if its deployed in the markdown on deploy

    Percentage_Of_complete_daily_reads

![](readme_files/figure-markdown_strict/graph-1.png)

    #Based on a 120 day rolling average what date is warragamba likely to overflow or hit zero.
    gg_dam_forecast_60

![](readme_files/figure-markdown_strict/graph%202-1.png)

    gg_dam_forecast_30

    ## Warning: Removed 2 rows containing missing values (`geom_line()`).

![](readme_files/figure-markdown_strict/graph%202-2.png)

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
