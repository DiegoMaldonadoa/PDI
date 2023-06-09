# PDS
Data generation for comparative study of paper "Supervised Classification Algorithms: Comparative Study"

***** DATABASE

A team of researchers from the University of Escuela Politécnica Nacional, Quito-Ecuador have created a data test for Supervised Classification Algorithm

--- Background ---

A fundamental part of this study consists of the generation of data, which have  been conceived in such a way that they are separated by a rotated polynomial being  used as a decision boundary, which is responsible for dividing each data set into  two classes. From the decision boundary, data sets with different characteristics  were created to test different artificial intelligence algorithms used for classification.  The characteristics that differentiate the training data sets are the amount of training  data, distance from the boundary and imbalance of the data in different degrees of asymmetry.

Additionally, in all cases, two types of sets were considered, one with two classes  and the other with four classes of data for their classification. The characteristics  of each data set generated to answer each research question are detailed below.

-- Files to generate data ---

1)"CreacionDatos.m" 
This program performs the creation of training data. This file contains:
- Creation of training data with different numbers of samples.
- Creation of unbalanced data in 1:2, 1:3, 1:4, 2:3 ratios
- Creation of four training classes with 100, 200, 500, and 700 samples.

2)"CreacionDatos.fig" 
-Graph of the distribution of the data separated by the decision frontier made in Matlab.

3)"CreacionDatos.png" 
-Graph of the distribution of the data separated by the decision frontier in png format.

4)"Entrenamiento.mat" 
Dataset with all the combinations of generated data:
- train2clases_100samples
- train2clases_200samples
- train2clases_500samples
- train2clases_50samples
- train2clases_500samples

- train2clases_ratio_1to2
- train2clases_ratio_1to3
- train2clases_ratio_1to4

- train4clases_100samples
- train4clases_200samples
- train4clases_500samples
- train4clases_700samples

****Formats
    - All the files are in Matlab (.m, .mlx) file format

****Objective
    -  Researchers can use this database to produce useful and impactful scholarly work on supervised classification 
