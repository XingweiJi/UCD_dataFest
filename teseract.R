library(tesseract)
library(magick)
library(tidyr)
set.seed(100)
eng <- tesseract("eng")
text <- ocr_data("~/Desktop/DataFest/wine_test.jpg",engine = eng)
# input <- image_read("~/Desktop/DataFest/wine_test.jpg")
# text <- input %>%
#   image_trim(fuzz = 40) %>%
#   image_write(format = 'png', density = '300x300') %>%
#   tesseract::ocr_data()
filtered = text[which(text$confidence > 70 & text$word!="." & text$word != "-" & text$word != "--"),]
filtered1 = separate(filtered, bbox, into = c("xstart","ystart","xend","yend"))
filtered1$xstart = as.numeric(filtered1$xstart)
filtered1$xend = as.numeric(filtered1$xend)
filtered1$ystart = as.numeric(filtered1$ystart)
filtered1$yend = as.numeric(filtered1$yend)
filtered_name = filtered1[which(filtered1$xstart >= 466 & filtered1$xend <= 1732),]

#str(filtered_name)
cut(filtered_name$ystart,60)
hist(filtered_name$ystart)
arr = c()
for(i in 2:116)
{
  if((filtered_name$ystart[i+1] - filtered_name$ystart[i]) > 60)
    arr = c(arr,i)
}
