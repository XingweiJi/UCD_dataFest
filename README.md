# UCD DataFest
## TeamBravo
### members

Zack Liu				zheliu@ucdavis.edu		Statistics	

Xingwei Ji			xwji@ucdavis.edu		Computer Science		

Sukhmandeep Kaur	sdkkaur@ucdavis.edu	Mathematics		

## Challenges
### Picture noise reduction
Tesseract will detect unnecessary and odd symbols if we don't preprocess the image. Thus, we reduced the noise by croping and rotating the image. As a result, we got rid of most noises and extracted accurate text from the picture.

### Grouping words that are in the same line
Tesseract doesn't extract text line by line. It detects it words by words. So we have to figure out a way to group those words that are in the same line. We tackled this by deciding if the differences of y coordinates of words are greater than 45 pixels. If so, we will seperate the words to next line. We implement this by writing a for loop that iterates through each word and deciding which words belong to next line.

### Seperating prices from texts
We isolated prices of wines by x coordinates of a word called "bottle" or "case". We found a pattern that prices are always under the word "bottle" or "case". So if we can find the coordinates of those two words, we then can find where prices are.

### Rotating tilted images automatically
Some images are tilted. It will make Tesseract harder to extract texts. We use basic geometry to solve this problem. We find a pattern that words "case" and "bottle" are always in the same line. With this in mind, we detect the coordinates of those two words and check if their y coordinates are close. If not, we will use geometric method to calculate the angle and then, we rotate the image using image_rotate from magick.

## Unsolved 
### 
