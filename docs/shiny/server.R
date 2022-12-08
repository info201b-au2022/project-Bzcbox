#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/

source("../../source/table.R")

library(shiny)
library(ggplot2)
library(plotly)
library(dplyr)

server <- function(input, output) {
  
  output$intro <- renderText({
    paste0("Evidence suggests that the effects of different kinds of disease are not experienced equally 
    among different races of the US population – Minority and low-income communities suffer from the biased 
    policies such that their rights to be treated equally have been violated. High population density,
    more frequent use of public transportation, exposure to an environment with bad air quality, 
    different educational and financial status, and constant pressure from society, 
    all these factors can lead to a more serious outcome for both physical and mental health of those who suffer from social injustice. 
    In this project, we will mainly focus on how social and environmental injustice affects minorities’ physical health across the United States.
")
  })
  
  output$problem <- renderText({
    paste0("Project framing") +
    paste0("One governmental issue is the fact that the environment of minority and low-income communities are harmed by governmental policies. 
    The injustice policies stem from institutional racism, “Institutional racism continues to affect policy decisions related to pollution and other forms of environmental degradation”, 
    stated Robert D. Bullard and Beverly Hendrix Wright (1986). For example, minority communities might be targeted to be used as places for heavy industries,
    therefore, their living environment could be heavily affected by pollution compared to other communities.
    Distributive injustice leads to another social issue of environmental injustice. Income inequality increases the vulnerability of 
    low-income communities while facing pollution and climate change at the individual level compared to other communities. This indicates that as opposed to 
    upper-middle classes residents who take more precautions, like “restricting time outdoors, using indoor air purifiers”
    (Parris, Hegtvedt, & Johnson, 2020), people who cannot afford better protection from pollution are yet, receiving more pollution burden. ") +
    paste0("Human values") +
    paste0("Our human values include factors such as environmental justice, health safety, and access to resources.
    Oftentimes, pollution may go overlooked as it is not something we can physically see, but can be deadly for communities who do not have
    access to insurance, are unable to seek medical attention due to their history of medical bills, and much more. If these individuals are already 
    disadvantaged financially, something must be done to address the disproportionate pollution levels based on the varying income levels and population 
    of minorities in a community. 
") + 
    paste0("Direct stakeholders") +
    paste0("Direct stakeholders of our research are communities that suffer from environmental injustice. 
    The living environment of minority and low-come communities are damaged by disproportionate exposure to pollution. 
    A study shows that black residents absorb about 1.5 times the air pollution burden of the population at large (ALEJANDRA BORUNDA, 2021).
    Drawing more attention from society and raising public awareness of environmental injustice would help to build a larger data set,
    and more analyses can be done to solve this problem. The indirect stakeholders of our research are policymakers.
    Due to the injustice of environmental policies, minority and low-income communities are exposed to a greater danger of pollution which 
    leads to serious health issues. Government institutions and policymakers could be more aware of the discrimination happening toward communities 
    with lower political power and end the injustice at a social level.
")
    
  })
  
  output$question <- renderText({
    paste0("How do environmental issues disproportionately impact lower income POC communities? ") +
      paste0("How were minorities affected by environmental injustice and biased institutional policies during the COVID-19 pandemic?
")
  })
  
  output$finding <- renderText({
    paste0("How do environmental issues disproportionately impact lower income POC communities? ") +
    paste0("The state that has the greatest number of low income non-white population weighted concreation was New York, 
    and this was the same for the high income white population. From these results, we believe that New York was the outcome for both findings
    due to the fact that New York consumes more fossil fuels in its buildings than any other states in the country. To explain the outcome between 
    the two opposite demographics, it may be reliant on the fact that New York is the fifth-most diverse state but also has one of the greatest income gaps.
    For these reasons, the combination of diversity in race and income results in New York.
") +
    paste0("How were minorities affected by environmental injustice and biased institutional policies during the COVID-19 pandemic?") +
    paste0("In total, there were 3710 rows of covid observations. Of these observations, it was found that the greatest number of deaths when observed 
           by race were non-hispanic white individuals. This was an interesting finding, but could be impacted by numerous factors such as oppression. 
           Oftentimes, people of color may not seek medical attention due to legal or financial reasons, and omissions of these minorities may go unrecorded.
           We also looked at the race that has the maximum deaths ratio. Because the number of non-white hispanic individuals who were recorded in data was so large, 
           there was also a large number of deaths. Upon looking at the proportions, Non-Hispanic American Indian or Alaska Native and Non-Hispanic Black individuals had 
           the highest proportion of deaths due to covid. Because they are minorities, there are many injustices that result in this outcome such as environmental, healthcare,
           rights, and much more. With these minorities having the highest deaths ratio, we should take into consideration the fact that as a minority group, they may live in areas of low SES,
           where dumping and polluting industries reside. This may increase the deaths ratio as COVID 19 is a respiratory disease, and when coupled with prior exposure to high pollution levels, 
           the likeliness of deaths may increase. ")
  }) 
  
  output$plot1 <- renderPlotly({
    p1 <-covid_by_race %>%
        filter(race %in% input$data_c) %>%
        ggplot(aes(x = race, y = proportion_of_covid_death, fill = race)) +
        geom_col() +
        labs(title = "COVID-19 Deaths by Race Ratio",
             x = "Race",
             y = "Proportion of COVID Death") + theme(axis.text.x=element_blank())
    p <- ggplotly(p1)
    p
  })
  
}
