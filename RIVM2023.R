#install packages for stats and to load data
install.packages("igraph")
install.packages("tidyverse")
install.packages("ggplot2")
install.packages("dplyr")
library(tidyverse)
library(igraph)
library(ggplot2)
library(dplyr)

if (!require("BiocManager", quietly = TRUE))
  +     install.packages("BiocManager")
BiocManager::install("Biostrings")

library(Biostrings)

if (!require("BiocManager", quietly = TRUE))
  +     install.packages("BiocManager")
BiocManager::install("phyloseq")

library(phyloseq)

#setting working directory and loading data
#not currently working unsure why
setwd("C:/Users/juliataenzer/Desktop/RIVM Internship/RIVM2023.R")
df <- as.data.frame(sam_data(RIVMrawdata))
view(df)
# calculate number of COPD pos
table(df$COPDcaco)
# gender
table(df$gender)
# age
table(df$agecat)
#gendervCOPD
table(df$COPDcaco,df$gender)

#Calculate bacterial load of qPCR analysis against COPD pos v neg
boxplot(df$qPCR_Ct_value ~ df$COPDcaco, df = df, xlab = "COPD", ylab = "Bacterial Load", main = "COPD and qPCR Ct Value")

#Calculate bacterial load of qPCR analysis against COPD gold
boxplot(df$qPCR_Ct_value ~ df$COPDgold, df = df, xlab = "COPD Grade", ylab = "Bacterial Load per Sample", main = "COPD Grade and qPCR Ct Value")
#Calculate age category versus bacterial load)
boxplot(df$qPCR_Ct_value ~ df$agecat, df = df, xlab = "Age Category", ylab = "Bacterial Load per Sample", main = "Age Category and qPCR Ct Value")
#Calculate farm child v qPCR bac load
boxplot(df$qPCR_Ct_value ~ df$farmchild, df = df, xlab = "Farm Child", ylab = "Bacterial Load", main = "Farm Child and qPCR Ct Value")
#Lung medication v qPCR
boxplot(df$qPCR_Ct_value ~ df$klngmdcn, df = df, xlab = "Medicated", ylab = "Medicated", main = "COPD and qPCR Ct Value")
#Atopy v qPCR
boxplot(df$qPCR_Ct_value ~ df$atopy, df = df, xlab = "Atopy", ylab = "qPCR Value", main = "Atopy v qPCR Value")
# L cattle v qpcr
boxplot(df$qPCR_Ct_value ~ df$farms_1000_cat, df = df, xlab = "L Cattle Farm Nearby", ylab = "qPCR value", main = "Cattle v qPCR values")


