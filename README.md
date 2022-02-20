<img src="https://www.fatalerrors.org/images/blog/31f3de3f0d648286735ea05b863fdb98.jpg" width="60" height="60"> 

# Eigensystem-and-Principal-Component-Analysis (PCA)
Given these 8-band satellite image, construct a matrix of Rx8, where R=MxN with M and N being the dimensions of the input image I, with 8 representing the 8 dimensions or the spectral wavebands. Hence the rows of this matrix correspond to observations and columns correspond to variables.
<ul>
<li> Compute the covariance matrix-This should be an 8x8 covariance matrix. </li>
<li> Determine the eigenvalues and eigenvectors of the covariance matrix. </li>
<li> Through the inverse PCA,
  <ol type = "a">
<li>	Reconstruct the original image by keeping each of the Principal Component (PC) (one at a time) starting from the first to the eighth PC and see what you get in each of the reconstructed mages. </li>
<li>	Reconstruct the input image from the eigenvectors with the highest 4 eigenvalues </li>
<li> Reconstruct the input image from the eigenvectors of the lowest 4 eigenvalues</li>
<li> Subtract the original image from the reconstructed image you obtained in (b) </li>
<li> Subtract the original image from the reconstructed image you obtained in (c) </li>
</ol>
</li>
</ul>
<br>

## Covariance matrix, eigenvalues and eigenvectors
PCA is very interesting unsupervised algorithm which is used for dimensionality reduction. The algorithm is based on a multispectral satellite Image with 8 color bands. 

### Satellite Image

![image](https://user-images.githubusercontent.com/98129458/154811198-45a8c7a7-18b9-46ab-beeb-c1ebbd868afb.png)

N.B. Spectral bands: Coastal band [400–450 nm], Blue [450–510 nm], Green (510–580 nm), Yellow [585–625 nm], Red [630–690 nm], Red-edge [705–745 nm], Near-infrared 1, NIR1 [770–895 nm], Near-infrared 2, NIR2; [860–1040 nm] 
<br>
The above problem is approached by computing covariance matrix. After the calculation, the 8x8 matrix is found as,
<br>
### Covariance Matrix

![image](https://user-images.githubusercontent.com/98129458/154811287-96eef010-f5a7-4403-bf91-13a510769fcd.png)

<br>
Eigenvalues and eigenvectors of this covariance matrix are found as, <br>

### Eigenvalues in Ascending Order (From Left to Right)

![image](https://user-images.githubusercontent.com/98129458/154811362-8b176b86-7865-4e56-a786-88f8e901399a.png)

<br>

### Eigenvectors of the Covariance Matrix

![image](https://user-images.githubusercontent.com/98129458/154811433-9367c1f2-34f9-4f14-aa66-38311712bd6c.png)

## One Component at a time
Principal component analysis has been run for this image. There are 8 principal component existing on that image. The first component give much information. However, fourth and fifth component give few amount of the pixel information about the satellite image.

### First Principal Component

![image](https://user-images.githubusercontent.com/98129458/154811503-517a00af-3ced-4437-91e0-6cc696c5c420.png)


### Second Principal Component

![image](https://user-images.githubusercontent.com/98129458/154811527-979b9841-c78f-46b9-b394-e46d86f30e60.png)

<br>
Similarly, second principal component contains less information than first component. Figure below shows the image with third principal. Third principal component of image seems to contain no information. However, the information can be useful for other purpose. However, if the image is zoomed, there might be some information. <br>

### Third Principal Component

![image](https://user-images.githubusercontent.com/98129458/154811652-852b9ee9-7250-40bf-b1d0-753af120e05f.png)

### Third Principal Component (Zoomed Version)

![image](https://user-images.githubusercontent.com/98129458/154811681-1b18173a-b1a3-4cd6-8293-880df926776d.png)

### Third Principal Component (Another Zoomed Version)

![image](https://user-images.githubusercontent.com/98129458/154813557-34a217e7-d5e8-4dfb-a6df-12648785415e.png)

The above figure proves that the information is not worthless. The edge of the stadium outdoor is clearly visible in the image.  Fourth principal component does not also contain any significant information. There are some other edges of house observed in this image.

### Fourth Principal Component

![image](https://user-images.githubusercontent.com/98129458/154813658-8384f338-762a-425d-aa8f-eb7b89989985.png)

### Fifth Principal Component

![image](https://user-images.githubusercontent.com/98129458/154813679-f492acc1-f938-4fa9-bd6f-05818e1d5d8d.png)

### Sixth Principal Component

![image](https://user-images.githubusercontent.com/98129458/154813703-d3f1beca-99c2-41ff-b920-21d433b96b51.png)

### Seventh Principal Component

![image](https://user-images.githubusercontent.com/98129458/154813725-5390ac4e-5c90-48ee-b1b1-027177a04dcd.png)

### Eighth Principal Component

![image](https://user-images.githubusercontent.com/98129458/154813788-7f90eaa3-795c-4cbf-8a0d-d2457eaaa923.png)

<br> Fifth to eighth eigenvectors do not contain any significant information. However, some edges are observed if the image is zoomed.

## Reconstructing Image with Eigenvectors corresponding to Highest Four Eigenvalues

The scenario considers first 4 highest eigenvalues to get the image. Figure 37 shows the image with highest information that can be contained by these eigenvectors. <br>

![image](https://user-images.githubusercontent.com/98129458/154813988-da3e3967-7024-4c4a-9920-60d9d2822020.png)

## Reconstructing Image with Eigenvectors corresponding to Lowest Four Eigenvalues:

In this scenario, eigenvectors corresponding to lowest four eigenvalues are used to reconstruct the image. The image contains less information than previous image. However, some strong edges are captured by these eigenvalues. <br>

![image](https://user-images.githubusercontent.com/98129458/154814073-1889e409-4f5c-46bd-9a11-0fa9783bf82d.png)


## Subtraction of Original Image from the Reconstructed Image using Four Highest Eigenvalues: 
The subtraction yields small amount of information as the reconstructed image contains most information. <br>

![image](https://user-images.githubusercontent.com/98129458/154825675-5c5eb79d-e435-4fe4-b50f-43c474783949.png)

## Subtraction of Original Image from the Reconstructed Image using Four Lowest Eigenvalues:  

As the eigenvectors corresponding to lowest eigenvalues contain small amount of information, subtraction gives significant knowledge about the original image.

![image](https://user-images.githubusercontent.com/98129458/154825704-a4c11154-a4ac-4e66-965c-20a749a4d5e4.png)

<br> **Remarks:** The first PCA component with satellite image gives vast amount of information about the image. On the other hand, second and third PCA contains small amount of information about edge. Other PCA components contain very low amount of information. Besides, highest four eigenvalues contain around 90 percent information about pixels. Whereas, lowest four eigenvalues do not contain significant information. That is the reason the subtraction with reconstructed image for lowest four eigenvalues provide large amount of data for the image.


