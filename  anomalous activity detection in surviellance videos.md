---
layout: page
title:  " anomalous activity detection in surviellance videos"
categories: jekyll update
---

## Requirements

This code requires you have Keras 2 and TensorFlow 1 or greater installed. Please see the `requirements.txt` file. To ensure you're up to date, run:

`pip install -r requirements.txt`

You must also have `ffmpeg` installed in order to extract the video files. If `ffmpeg` isn't in your system path (ie. `which ffmpeg` doesn't return its path, or you're on an OS other than *nix), you'll need to update the path to `ffmpeg` in `data/2_extract_files.py`.

## Getting the data

First, download the dataset from UCF into the `data` folder:

https://webpages.uncc.edu/cchen62/dataset.html`


Then extract it with `unrar e filename.rar`.

Next, create folders (still in the data folder) with `mkdir train && mkdir test && mkdir sequences && mkdir checkpoints`.

Now you can run the scripts in the data folder to move the videos to the appropriate place, extract their frames and make the CSV file the rest of the code references. You need to run these in order. Example:

`python 1_move_files.py`

`python 2_extract_files.py`

## Extracting features

Before you can run the `lstm` and `mlp`, you need to extract features from the images with the CNN. This is done by running `extract_features.py`. On my Dell with a GeFore 960m GPU, this takes about 8 hours. If you want to limit to just the first N classes, you can set that option in the file.

## Training models

The CNN-only method (method #1 in the blog post) is run from `train_cnn.py`.

The rest of the models are run from `train.py`. There are configuration options you can set in that file to choose which model you want to run.

The models are all defined in `models.py`. Reference that file to see which models you are able to run in `train.py`.

Training logs are saved to CSV and also to TensorBoard files. To see progress while training, run `tensorboard --logdir=data/logs` from the project root folder.

## Methods used
# Creating the Model.

1. Move all the videos to structured folders
2. Split the data into train and test sets
3. Extract frames(images) from videos
4. Select 40 keyframes for each video
# Model 1 
5. Extract features using topless inception v3
# Model 2
5. Extract features using topless mobilenet
6. Save the features as npy files
7. Train rnn on npy files
8. Save the Rnn model
# Deploy the Model
1. For new video extract 40 frames
2. Pass frames through topless inceptionv3 to extract features
3. Pass features throught rnn model to get the prediction

# screeshot of the output
![](images/predictions_image.png)

## Demo/Using models



## UCF101 Citation

This project was done as a part of final year capstone project at vit. This project is based on the repository https://github.com/adithyavit/five-video-classification-methods which uses UCF101 dataset. My project builds on this repository by using a related but different algorithm on a different dataset https://webpages.uncc.edu/cchen62/dataset.html to achieve multi class video classification.
