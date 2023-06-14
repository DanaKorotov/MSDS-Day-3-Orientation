# Dana Korotovskikh 
# DS Orientation Techical Histogram 

# Load Packages 
library(ggplot2)
library(dplyr)
library(tidyverse)
library(hrbrthemes)

# load in file 
survey = read.csv("C:\\Users\\home\\Desktop\\DS MASTERS\\2023-06-13-survey.csv")
# Rename the column names 
survey = survey %>%
  dplyr::rename("CPU_Cycle_Rate_GHz" = "CPU.Cycle.Rate..in.GHz.",
                "CPU_Number_of_Cores" = "CPU.Number.of.Cores..int.",
                "Ram_in_GB" = "RAM..in.GB.",
                "Hard_Drive_Size_GB" = "Hard.Drive.Size..in.GB.",
                "GPU_Short_Description_String" = "GPU..short.description.as.a.string.",
                "GPU_CUDA_Number_of_Cores" = "GPU.CUDA.Number.of.Cores..int.") %>%
  dplyr::filter(!row_number() %in% c(2))

# Plot Hard Drive Size by Operating System
theme_update(plot.title = element_text(hjust = 0.5))

p <- survey %>%
  ggplot( aes(x=Hard_Drive_Size_GB,fill=Operating.System)) +
  geom_histogram( color="#e9ecef", alpha=0.6, position = 'identity', bins = 15) +
  scale_fill_manual(values=c("#69b3a2", "#404080")) +
  theme_ipsum() +
  labs(fill="")

#Titles
p + theme(plot.title = element_text(hjust = 0.5)) + ggtitle("Hard Drive Size Per Operating System") +
  xlab("Hard drive Size (in GB)") + ylab("Count of Operating Systems") + labs(caption = "Row with operating system using Mac and Linux was removed for purposes of this chart.")

