library(haven)
library(tidyverse)

data = read_xpt("./data/DEMO_L.xpt")
data1 = read_xpt("./data/BMX_L.xpt")
data2 = read_xpt("./data/FSQ_L.xpt") # Not used
data3 = read_xpt("./data/ALQ_L.xpt")
data4 = read_xpt("./data/INQ_L.xpt")

total_data= left_join(data, data1)
total_data = left_join(total_data, data3)

total_data <- total_data %>% select(-c(SDDSRVYR,RIDSTATR,RIDAGEMN,RIDRETH3,RIDEXMON,RIDEXAGM,DMQMILIZ,DMDYRUSR,DMDEDUC2,DMDMARTZ,RIDEXPRG,DMDHHSIZ,
                                       DMDHRGND,DMDHRAGZ,DMDHREDZ,DMDHRMAZ,DMDHSEDZ,WTINT2YR,WTMEC2YR,SDMVSTRA,SDMVPSU,INDFMPIR,BMDSTATS,BMIWT,BMXRECUM,
                                       BMIRECUM,BMXHEAD,BMIHEAD,BMIHT,BMDBMIC,BMXLEG,BMILEG,BMXARML,BMIARML,BMXARMC,BMIARMC,BMXWAIST,BMIWAIST,
                                       BMXHIP,BMIHIP,ALQ111,ALQ130,ALQ142,ALQ270,ALQ151,ALQ170,ALQ280))

total_data2 = total_data %>%na.omit(total_data["BMXWT"])

clean_data <- total_data[!is.na(total_data$BMXWT), ]
clean_data$ALQ121[is.na(clean_data$ALQ121)] <- 0

clean_data <- clean_data[!is.na(clean_data$BMXHT), ]



#Body weight, alcohol, smoking, physical activity, income, age, sex , race, 
#potentially for decision tree - food security and obesity rate


