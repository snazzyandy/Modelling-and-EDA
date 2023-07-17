## Greater Sydney Dam Level Scraper
A friend of mine mentioned that WaterNSW updated their website.
However, like with most web facelifts, the websites's functionality took a hit.
You used to be able to get all the historic data output as a csv, now you have these lovely pictures of the dams.

As a policy maker hes very interested in the daily releases of dam levels as well as the historic dataset.
Rather than him visiting the site each day and recording the data manually I wrote this basic script with github actions to scrape the site every day then kick it out as a csv.

All these daily data extracts are avaiable in the data folder.

Open sourcing (MIT Licence) for those who are interested #OpenData!
The data we are borrowing is from [this graphic](https://www.waternsw.com.au/nsw-dams/nsw-storage-levels/greater-sydney-dam-levels)!
[![damlevel_scrape.r](https://github.com/snazzyandy/Modelling-and-EDA/actions/workflows/greatersydscraper.yml/badge.svg)](https://github.com/snazzyandy/Modelling-and-EDA/actions/workflows/greatersydscraper.yml)
![Image](Images/WNSWScreenshot.png)
