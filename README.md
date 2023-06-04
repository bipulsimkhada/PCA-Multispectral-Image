# PCA-Multispectral-Image

## Description
In this project, Principal Component Analysis is implemented in the multispectral image. The input image is an 8-band image containing the following spectral brands:

Coastal band [400–450 nm] <br>
Blue [450–510 nm] <br> 
Green [510–580 nm] <br>
Yellow [585–625 nm] <br>
Red [630–690 nm] <br>
Red-edge [705–745 nm]  <br>
Near-infrared 1, NIR1 [770–895 nm] <br>
Near-infrared 2, NIR2; [860–1040 nm] <br>

The input image is 16-bit depth, and the location is Adelaide, Australia. I computed the covariance matrix and determined the eigenvalues and eigenvectors of the covariance matrix. Through the inverse PCA, the original image was reconstructed with each 8 of the principal components, reconstructed with the highest 4 Eigenvalues, and reconstructed with the lowest 4 eigenvalues. 

Reconstruction of the original image with 1st highest eigenvalue contains the most information about the image. Reconstruction of the original image with only the lowest eigenvalue has minimum information about the image but still contains some details that could be important during further evaluation. When all 8 principal components are used in reconstruction, we get the same original image with all the information being retained. 

 
## Libraries 
* Image Processing Toolbox
* Hyperspectral Image Processing


## Tool
* MATLAB

## Input Image
Input Image can be found in the google drive as it was too large to be uploaded in GitHub.
https://drive.google.com/file/d/1Gyy4HEP77qevEpEdN17bKsmS8FjumGTJ/view?usp=sharing

## Method
#### 1.	 Original Image:
Original Image is a multispectral image of Adelaide, Australia. The size of the image is 4277 X 4259 pixels with 8 bands. Multispectral images can be converted to RGC representation using hcube and colorize function of MATLAB. The RGB representation of the original image is given by the image below: 

<img src="https://github.com/bipulsimkhada/Image/blob/main/pca/rgb%20pic.png">

#### 2.	 Covariance Matrix: 
For the covariance matrix, the height and weight of the image is flattened into 1 dimension and is calculated by the formula below:
```
cv = 1/(h*w)*(M_t*M)-(avg_t*avg)
```
where *cv is the covariance matrix, h is the height of the image, w is the width of the image, M_t is the transpose matrix of (h*w,bands=8), and avg_t is the transpose matrix of the average of a matrix (h*w, bands=8)*. 

The covariance matrix for the given multispectral image is given in the table below:

| CV 1 | CV 2 | CV 3 | CV 4 | CV 5 | CV 6 | CV 7 | CV 8 | 
| --- | --- | --- | --- | --- | --- | --- | --- |
| 14590.2826	| 18658.93	| 26768.88	| 31383.49	| 29801.66	| 22482.11	| 19558.75	| 13500.55| 
| 18658.9254	| 26804.17	| 38820.18	| 43220.74	| 43616.81	| 30687.68	| 27560.22	| 17685.58| 
| 26768.8771	| 38820.18	| 58716.57	| 65765.96	| 66479.33	| 49367.02	| 48979.43	| 30949.01
| 31383.4854	| 43220.74	| 65765.96	| 80831.83	| 77383.7	| 59382.15	| 51893.48	| 34737.59| 
| 29801.6627	| 43616.81	| 66479.33	| 77383.7	| 80209.69	| 55979	| 50120.78	| 31074.84| 
| 22482.107	| 30687.68	| 49367.02	| 59382.15	| 55979	| 61428.27	| 80501.42	| 54327.24| 
| 19558.7523	| 27560.22	| 48979.43	| 51893.48	| 50120.78	| 80501.42	| 150263.7	| 96710.26| 
| 13500.5478	| 17685.58	| 30949.01	| 34737.59	| 31074.84	| 54327.24	| 96710.26	| 68567.14| 

#### 3. Eigenvalues and Eigenvectors: 
The eigenvalues and eigenvectors are calculated from the covariance matrix obtained above and are arranged from highest to lowest values. 

|	Eigen val 1	|	Eigen   val 2	|	Eigen   val 3	|	Eigen   val 4	|	Eigen   val 5	|	Eigen   val 6	|	Eigen   val 7	|	Eigen   val 8	|
|	---	|	---	|	---	|	---	|	---	|	---	|	---	|	---	|
|	403714.392	|	0	|	0	|	0	|	0	|	0	|	0	|	0	|
|	0	|	120954	|	0	|	0	|	0	|	0	|	0	|	0	|
|	0	|	0	|	7063.19	|	0	|	0	|	0	|	0	|	0	|
|	0	|	0	|	0	|	4891.885	|	0	|	0	|	0	|	0	|
|	0	|	0	|	0	|	0	|	2514.085	|	0	|	0	|	0	|
|	0	|	0	|	0	|	0	|	0	|	1051.79	|	0	|	0	|
|	0	|	0	|	0	|	0	|	0	|	0	|	934.3221	|	0	|
|	0	|	0	|	0	|	0	|	0	|	0	|	0	|	287.9995	|

|	Eigen Vec 1	|	Eigen Vec 2	|	Eigen Vec 3	|	Eigen Vec 4	|	Eigen Vec 5	|	Eigen Vec 6	|	Eigen Vec 7	|	Eigen Vec 8
|	---	|	---	|	---	|	---	|	---	|	---	|	---	|	---
|	0.153864	|	-0.15565	|	0.090203	|	-0.51686	|	0.346412	|	0.159127	|	0.630198	|	0.366529
|	0.215817	|	-0.2277	|	-0.22944	|	-0.47869	|	0.015101	|	-0.27303	|	0.021146	|	-0.73795
|	0.341209	|	-0.28957	|	-0.33446	|	-0.27648	|	-0.07397	|	-0.17666	|	-0.55118	|	0.520522
|	0.392523	|	-0.37004	|	0.434072	|	0.156604	|	0.306408	|	0.519206	|	-0.30292	|	-0.20207
|	0.38361	|	-0.39209	|	-0.26847	|	0.429575	|	-0.48995	|	0.077678	|	0.443019	|	0.011923
|	0.381308	|	0.05211	|	0.452146	|	0.243812	|	0.19131	|	-0.73312	|	0.091654	|	0.074484
|	0.505718	|	0.611119	|	-0.44506	|	0.157819	|	0.338529	|	0.170026	|	0.026417	|	-0.05989
|	0.333088	|	0.416202	|	0.405397	|	-0.36587	|	-0.62383	|	0.164155	|	-0.03847	|	0.005673



#### 4.	Reconstruction from individual Eigenvectors: 
The original image has been reconstructed from the individual eigenvectors and is given by the images below.

<img src="https://github.com/bipulsimkhada/Image/blob/main/pca/pca%201-2.png">

<img src="https://github.com/bipulsimkhada/Image/blob/main/pca/pca%203.png">

<img src="https://github.com/bipulsimkhada/Image/blob/main/pca/pca%204.png">

<img src="https://github.com/bipulsimkhada/Image/blob/main/pca/pca%205.png">

<img src="https://github.com/bipulsimkhada/Image/blob/main/pca/pca%206.png">

<img src="https://github.com/bipulsimkhada/Image/blob/main/pca/pca%207.png">

<img src="https://github.com/bipulsimkhada/Image/blob/main/pca/pca%208.png">

#### 5.	Reconstruction from All Eigenvectors: 
The original image has been reconstructed from all 8 eigenvectors and is given by the images below.

<img src="https://github.com/bipulsimkhada/Image/blob/main/pca/pca%20all.png">

#### 6.	Reconstruction from the highest 4 eigenvalues: 
The original image has been reconstructed from the highest 4 eigenvalues and is given by the images below. This is the same as subtracting the original image from the reconstructed image from the lowest 4 eigenvalues. 

<img src="https://github.com/bipulsimkhada/Image/blob/main/pca/pca%20top%204.png">


#### 6.	Reconstruction from the lowest 4 eigenvalues: 
The original image has been reconstructed from the lowest 4 eigenvalues and is given by the images below. This is the same as subtracting the original image from the reconstructed image from the highest 4 eigenvalues.


<img src="https://github.com/bipulsimkhada/Image/blob/main/pca/pca%20lowest%204.png">
