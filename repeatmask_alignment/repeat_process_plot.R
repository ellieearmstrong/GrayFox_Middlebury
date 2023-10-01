#Processing repeats for gray fox project
setwd('~/Documents/Gray_Fox_Project/GrayFox_RefGenomePub/')

library(ggplot2)
library(patchwork)
library(tidyr)

#read in file
canid_repeats <- read.csv('repeat_stats_August2023.csv', head = TRUE)

#set palette
safe_colorblind_palette <- c("#88CCEE", "#CC6677", "#DDCC77", "#117733", "#332288", "#AA4499", 
                             "#44AA99", "#999933", "#6699CC")

#rename columns
canid_repeats<- canid_repeats %>%
  rename('DNA Transposons' = 'DNA.Transposons',
         'Small RNA'= 'Small.RNA', 'Simple Repeats' = 'Simple.Repeats',
         'Low Complexity' = 'Low.Complexity')


#convert wide to long
canid_rep_long <- canid_repeats %>%
  pivot_longer(
    cols = c('SINEs','LINEs', 'LTRs', 'DNA Transposons','Unclassified',
             'Small RNA','Satellites','Simple Repeats','Low Complexity'),
    names_to = 'repeat_type',
    values_to = 'percentage'
  )


#reorder species
canid_rep_long$Species <- 
  factor(canid_rep_long$Species, 
         levels = c('Urocyon cinereoargenteus','Urocyon littoralis','Vulpes lagopus',
                    'Vulpes corsac','Vulpes vulpes','Vulpes ferrilata','Nyctereutes procyonoides', 
                    'Otocyon megalotis','Chrysocyon brachyurus','Speothos venaticus', 'Lycaon pictus',
                    'Canis lupus' ,'Canis lupus dingo','Canis lupus familiaris'))

#plot
repeats_canid_v1 <- ggplot(canid_rep_long, aes(x=Species, y=percentage, fill=repeat_type)) + 
  geom_col() +
  scale_fill_manual(values = safe_colorblind_palette) +
  theme_bw() +
  theme(legend.text=element_text(size=12),
        legend.title= element_blank(),
        axis.title.y=element_text(size=14, vjust = 5, color = "black"),
        axis.text.y=element_text(size=12, color = "black"),
        axis.text.x = element_text(angle = 60, vjust = 1, hjust=1, size=12, color="black", face = "italic"), 
        plot.margin = unit(c(0.5, 0.5, 0.5, 0.5),
                           "cm")) +
  labs(x="",y="Proportion of Genome") 

ggsave('~/Documents/Gray_Fox_Project/GrayFox_RefGenomePub/canidrepeats_v1.png', 
       repeats_canid_v1, width = 12, height = 8,dpi = 800)
