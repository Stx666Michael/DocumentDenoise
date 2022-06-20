# Document Denoise

## Background
This is part of the work in **[FURP-1] Research on the Document Text Recognition using OCR Techniques** on summer 2022.

Document Denoising is used in the pre-processing stage of OCR. There are many denoising techniques, this repository implements two _deep learning_ methods - Denoising by **Auto-encoders** and **CycleGAN**.

The work is based on relevant papers and implementations:
- Auto-encoders [[paper](https://ieeexplore.ieee.org/document/8262546)] [[code](https://www.kaggle.com/competitions/denoising-dirty-documents/code)]
- CycleGAN [[paper](https://arxiv.org/abs/1703.10593)] [[code](https://www.tensorflow.org/tutorials/generative/cyclegan)]

The training/testing dataset is downloaded from [Kaggle - Denoising Dirty Documents](https://www.kaggle.com/competitions/denoising-dirty-documents). The zipped dataset is already stored in `./zip/` for use in the notebooks.

Please see the two notebooks [[Auto-encoders](./autoencoders.ipynb)] [[CycleGAN](./cycleGAN.ipynb)] for more details.

## Models

### Auto-encoders
- Model Overview
![](images/autoencoder.png)
- Parameter Settings
    - Epoch: 80
    - Batch size: 12
    - Input/output size: 540*420
    - Data split on training set: 85% training, 15% validation
    - Optimizer: Adam
    - Loss: mean squared error (MSE)
    - Metrics: mean absolute error (MAE)
- Error evolution on epochs
![](images/ae-errors.png)

### CycleGAN
- Model Overview
    - Conversion of original dirty input to its translated clean output
    ![CycleGAN Image 1](https://miro.medium.com/max/1400/1*-7JKDTvulO6o4t4RRU5MJQ.png)
    - Conversion of original clean input to its translated dirty output
    ![CycleGAN Image 2](https://miro.medium.com/max/1400/1*0C34D2bEHmiyTbNzH8o5nQ.png)
- Parameter Settings
    - Epoch: 80
    - Batch size: 6
    - Input/output size: 512*512
    - Data split on training set: 100% training
    - Optimizer: Adam (2e-4, beta_1=0.5)
    - Loss: cycle consistency loss
- Training Process
    - Forward Mapping
    ![forward](images/forward.gif)
    - Backward Mapping
    ![backward](images/backward.gif)

## Comparison

### Training
- Hardware
    - GPU: NVIDIA Tesla T4 (16G)
    - Platform: [Google Colab](https://colab.research.google.com)
- Training Time
    - Auto-encoders: 8s/epoch
    - CycleGAN: 87s/epoch
- Prediction Time
    - Auto-encoders: <1s/image
    - CycleGAN: <1s/image

### Results
- Performance on [test set](https://www.kaggle.com/competitions/denoising-dirty-documents/data)
![compare1](images/compare1.png)
- Preformance on [invoice images](https://www.google.com/search?q=noisy+invoice&tbm=isch&sxsrf=ALiCzsYRG6sIvU0n92yRWrcYLenFaEWeig%3A1655730210306&source=hp&biw=1438&bih=823&ei=InCwYqfwENDXgQajyauwBQ&iflsig=AJiK0e8AAAAAYrB-MsEzgLgBBgGm8KyXcYTcnNoH_Cs1&oq=&gs_lcp=CgNpbWcQAxgBMgcIIxDqAhAnMgcIIxDqAhAnMgcIIxDqAhAnMgcIIxDqAhAnMgcIIxDqAhAnMgcIIxDqAhAnMgcIIxDqAhAnMgcIIxDqAhAnMgcIIxDqAhAnMgcIIxDqAhAnUABYAGC9D2gBcAB4AIABAIgBAJIBAJgBAKoBC2d3cy13aXotaW1nsAEK&sclient=img)
![compare2](images/compare2.png)