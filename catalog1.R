
eng <- tesseract("eng")
text <- ocr_data("/Users/sukhmandeepkaur/Documents/UCD/Data Fest - Wine 2018/UCD_Lehmann_0036.jpg",engine = eng)

filtered = text[which(text$confidence > 70 & text$word!="." & text$word != "-" & text$word != "--" & text$word !=".."),]
filtered1 = separate(filtered, bbox, into = c("xstart","ystart","xend","yend"))
filtered1$xstart = as.numeric(filtered1$xstart)
filtered1$xend = as.numeric(filtered1$xend)
filtered1$ystart = as.numeric(filtered1$ystart)
filtered1$yend = as.numeric(filtered1$yend)
filtered$bottleprice = filtered1[which(filtered1$xstart >= 1269 & filtered1$xend <= 1421),]
filtered_name = filtered1[which(filtered1$xstart >= 466 & filtered1$xend <= 1732),]
#str(filtered_name)
#cut(filtered_name$ystart,60)
#hist(filtered_name$ystart)

arr = c(2)
for(i in 2:114)
{
  if((filtered_name$ystart[i+1] - filtered_name$ystart[i]) > 45)
    arr = c(arr,i)
}
arr2 = filtered_name[arr,]

