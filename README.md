# Document Denoise

## Background
This is part of the work in **[FURP-1] Research on the Document Text Recognition using OCR Techniques** on summer 2022.

Document Denoising is used in the pre-processing stage of OCR. There are many denoising techniques, this repository implements two _deep learning_ methods - Denoising by **Auto-encoders** and **CycleGAN**.

The work is based on relevant papers and implementations:
- Auto-encoders [[paper](https://ieeexplore.ieee.org/document/8262546)] [[code](https://www.kaggle.com/code/michalbrezk/denoise-images-using-autoencoders-tf-keras)]
- CycleGAN [[paper](https://arxiv.org/abs/1703.10593)] [[code](https://www.tensorflow.org/tutorials/generative/cyclegan)]

The training/testing dataset is downloaded from [Kaggle - Denoising Dirty Documents](https://www.kaggle.com/competitions/denoising-dirty-documents). The zipped dataset is already stored in `./zip/` for use in the notebooks.

Please see the two notebooks for more details.

## Demo
Below shows the results of each epoch training **CycleGAN**, which could _denoise_ as well as _adding noise_.
- Forward Mapping
![forward](images/forward.gif)
- Backward Mapping
![backward](images/backward.gif)
