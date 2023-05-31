# Shape_Representation_in_Images
Project 6 on Digital Image Processing

**Part I:** You are given one binary image, (‘airplane.bmp’), do the following tasks:

I.1 Extract the boundary and use the Hotelling transform to align the shape. 
  
I.2 Use the Fourier descriptors to reconstruct the boundaries with different orders (i.e., the number top non-zero DFT coefficients used). Discuss your findings in terms of the accuracy of shape reconstruction.  
  
I.3 Given the N-pixel boundary, create sampled boundaries with M points (e.g., M=N/50, N/20, N/10) by using the Fourier shape descriptors. Please note that you will need to apply a scaling factor (M/N) after IDFT to ensure the reconstructed boundary covers the same area. Moreover, you need the dilation to make the sampled boundaries more visible. 
  
 I.4 Create an ellipse to fit the object.A test code (‘test_ellipse.m’) is provided for your reference along with two Matlab functions (‘fitellipse.m’ and ‘plotellipse’) for ellipse-based shape approximation. 

Bonus (+1): You can find a couple more binary images to repeat above shape analysis. 

**Part II:**  Researchers in plant science look for a quick and efficient method to measure tiny objects, such as wheat embryos. Four pictures of wheat embryos partly are given (with a dime, diameter 18mm)) which are scanned at the resolution of 600dpi (dots per inch), do the following tasks: 

II.1 For each image, segment each embryo by thresholding and morphological processing. 

II.2 In each image, use an ellipse to represent each embryo in an image (the figure below). 

II.3 Find the average area, length (the major axis) and width (the minor axis) of all embryos in terms of pixels and mm according to pixel counts and the ellipse representation. 

II.4 Find the average shape for all embryos in an image (PCA shape alignment is needed). 

Bonus (+1): The embryos can be further adjusted by having the narrow end on the top before averaging all shapes. 


