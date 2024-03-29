library(dplyr)
library(rvest)

#Define the Site and the filter Criteria
url <- "https://www.waternsw.com.au/nsw-dams/nsw-storage-levels/greater-sydney-dam-levels"
dams_of_interest <- c("Avon Dam",
                      "Blue Mountains Dams",
                      "Cataract Dam",
                      "Cordeaux Dam",
                      "Fitzroy Falls Reservoir",
                      "Nepean Dam",
                      "Prospect Reservoir",
                      "Tallowa Dam",
                      "Warragamba Dam",
                      "Wingecarribee Reservoir",
                      "Woronora Dam"
                      )
#Scrape Scrape Scrape
page <- xml2::read_html(url)

system_level <- page %>%
  rvest::html_nodes("div.box") %>%
  rvest::html_nodes("div.levels-box") %>%  
  rvest::html_nodes("div.number") %>%
  rvest::html_text() 

Daily_Headline_Figures <- data.frame(Variable= c("How Much Rain have We had?", "How Much Water is in Our Dams?", "How Much Water have we Used"),
                  daily_value = system_level) %>% 
                  mutate(Data_Collection_Time_UTC = format(Sys.time(), tz="UTC")) %>% 
                  mutate(Collection_Date = Sys.Date())
    

daily_value <- page %>%
  rvest::html_nodes("div.box") %>%  
  rvest::html_nodes("span.percentage")%>% 
  rvest::html_text()


Variable <- page %>% 
  rvest::html_nodes("div.box") %>% 
  rvest::html_nodes("h3") %>%  
  rvest::html_text() 

Sample_Level <- data.frame(Variable) %>% 
    filter(Variable %in% dams_of_interest) %>% 
    cbind(daily_value) %>% 
    mutate(Data_Collection_Time_UTC = format(Sys.time(), tz="UTC")) %>%
    mutate(Collection_Date = Sys.Date()) %>% 
    rbind(Daily_Headline_Figures)

#Beep boop out goes data
write.csv(Sample_Level, paste0("data/",format(Sys.time(),  "%Y%m%d_%H%M%S_"),"_GSDL.csv"), row.names = FALSE)

#Nom nom ingest the data
filenames <- paste0("data/", list.files("data/"))

list_data <- lapply(filenames, read.csv)

#Ingest the data !!
master_data <- do.call("rbind",list_data)

#Output the new masterdata:
#Should output around 4k rows a year - will hit the excel max in 256 years on daily data polls - 
# If this overflows and drops starts to drop data you've relied on the scraper for too long LOL
write.csv(master_data, ("Daily_Dam_Readings_Greater_Sydney.csv"), row.names = FALSE)