#Code for plotting alignments with gray fox for project with Middlebury 2023
library(ggplot2)
library(dplyr)
library(tidyverse)
library(pafr)
setwd('~/Documents/Gray_Fox_Project/GrayFox_RefGenomePub/')

canfam4_urocyon <- read_paf('~/Documents/Gray_Fox_Project/Canfam4_urocyon.paf')

filter_c4_uc <- canfam4_urocyon %>%
  filter(as.numeric(alen) > 25000 & as.numeric(tlen) > 25000 & as.numeric(mapq) >= 60) %>%
  filter(tname %in% c('CM021962.1','CM021963.1','CM021964.1','CM021965.1','CM021966.1','CM021967.1','CM021968.1','CM021969.1',
                      'CM021970.1','CM021971.1','CM021972.1','CM021973.1','CM021974.1','CM021975.1','CM021976.1','CM021977.1',
                      'CM021978.1','CM021979.1','CM021980.1','CM021981.1','CM021982.1','CM021983.1','CM021984.1','CM021985.1',
                      'CM021986.1','CM021987.1','CM021988.1','CM021989.1','CM021990.1','CM021991.1','CM021992.1','CM021993.1',
                      'CM021994.1','CM021995.1','CM021996.1','CM021997.1','CM021998.1','CM021999.1','CM022000.1')) %>%
  filter(qname %in% c('Scaffold_1__1_contigs__length_117572690', 'Scaffold_2__1_contigs__length_102603151',
                      'Scaffold_3__1_contigs__length_98526141', 'Scaffold_4__1_contigs__length_96410777',
                      'Scaffold_5__1_contigs__length_91265922', 'Scaffold_6__1_contigs__length_90720172',
                      'Scaffold_7__1_contigs__length_82759371', 'Scaffold_8__1_contigs__length_79079208',
                      'Scaffold_9__1_contigs__length_74450539', 'Scaffold_10__1_contigs__length_73623094',
                      'Scaffold_11__1_contigs__length_73040223', 'Scaffold_12__1_contigs__length_72908785',
                      'Scaffold_13__1_contigs__length_71581588', 'Scaffold_14__1_contigs__length_66704989',
                      'Scaffold_15__1_contigs__length_64818041', 'Scaffold_16__1_contigs__length_63979375',
                      'Scaffold_17__1_contigs__length_59774042', 'Scaffold_18__2_contigs__length_64801261', 
                      'Scaffold_20__1_contigs__length_58983324', 'Scaffold_33__2_contigs__length_63093800', 
                      'Scaffold_21__1_contigs__length_56962569', 'Scaffold_22__1_contigs__length_54392966', 
                      'Scaffold_23__1_contigs__length_53374214', 'Scaffold_24__1_contigs__length_52741366', 
                      'Scaffold_25__2_contigs__length_69993150', 'Scaffold_26__1_contigs__length_49334718', 
                      'Scaffold_27__1_contigs__length_47458807', 'Scaffold_28__2_contigs__length_62992706', 
                      'Scaffold_29__2_contigs__length_79160281', 'Scaffold_30__1_contigs__length_41889812', 
                      'Scaffold_31__1_contigs__length_40660448', 'Scaffold_32__3_contigs__length_92326701',
                      'Scaffold_3__1_contigs__length_98526141','Scaffold_19__3_contigs__length_119168459',
                      'Scaffold_33__2_contigs__length_63093800')) %>%
  select(c('qname','qstart','qend','tname','tstart','tend'))
  
write.csv(filter_c4_uc, "Canfam4_urocyon_minimap_filtered.csv", row.names=FALSE)


# arcticfox_gray fox ------------------------------------------------------


arctic_urocyon <- read_paf('arcticfox-grayfox.paf')

filter_arctic_uc <- arctic_urocyon %>%
  filter(as.numeric(alen) > 25000 & as.numeric(tlen) > 25000 & as.numeric(mapq) >= 60) %>%
  filter(tname %in% c('CM031295.1','CM031296.1', 'CM031297.1','CM031298.1','CM031299.1','CM031300.1',
                      'CM031301.1','CM031302.1','CM031303.1','CM031304.1','CM031305.1','CM031306.1',
                      'CM031307.1','CM031308.1','CM031309.1','CM031310.1','CM031311.1', 'CM031312.1',
                      'CM031313.1','CM031314.1','CM031315.1','CM031316.1','CM031317.1','CM031318.1',
                      'CM031319.1')) %>%
  filter(qname %in% c('Scaffold_1__1_contigs__length_117572690', 'Scaffold_2__1_contigs__length_102603151',
                      'Scaffold_3__1_contigs__length_98526141', 'Scaffold_4__1_contigs__length_96410777',
                      'Scaffold_5__1_contigs__length_91265922', 'Scaffold_6__1_contigs__length_90720172',
                      'Scaffold_7__1_contigs__length_82759371', 'Scaffold_8__1_contigs__length_79079208',
                      'Scaffold_9__1_contigs__length_74450539', 'Scaffold_10__1_contigs__length_73623094',
                      'Scaffold_11__1_contigs__length_73040223', 'Scaffold_12__1_contigs__length_72908785',
                      'Scaffold_13__1_contigs__length_71581588', 'Scaffold_14__1_contigs__length_66704989',
                      'Scaffold_15__1_contigs__length_64818041', 'Scaffold_16__1_contigs__length_63979375',
                      'Scaffold_17__1_contigs__length_59774042', 'Scaffold_18__2_contigs__length_64801261', 
                      'Scaffold_20__1_contigs__length_58983324', 'Scaffold_33__2_contigs__length_63093800', 
                      'Scaffold_21__1_contigs__length_56962569', 'Scaffold_22__1_contigs__length_54392966', 
                      'Scaffold_23__1_contigs__length_53374214', 'Scaffold_24__1_contigs__length_52741366', 
                      'Scaffold_25__2_contigs__length_69993150', 'Scaffold_26__1_contigs__length_49334718', 
                      'Scaffold_27__1_contigs__length_47458807', 'Scaffold_28__2_contigs__length_62992706', 
                      'Scaffold_29__2_contigs__length_79160281', 'Scaffold_30__1_contigs__length_41889812', 
                      'Scaffold_31__1_contigs__length_40660448', 'Scaffold_32__3_contigs__length_92326701',
                      'Scaffold_3__1_contigs__length_98526141','Scaffold_19__3_contigs__length_119168459',
                      'Scaffold_33__2_contigs__length_63093800')) %>%
  select(c('qname','qstart','qend','tname','tstart','tend'))

write.csv(filter_arctic_uc, "arctic_urocyon_minimap_filtered.csv", row.names=FALSE)
