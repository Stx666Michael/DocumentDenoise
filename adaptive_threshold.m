files = dir('data/to_process/*.JPG');
for i = 1:numel(files)
  filename = files(i).name;
  image = imread("data/to_process/"+ filename);
  image = rgb2gray(image);
  % the key step of Local Adaptive Thresholding
  image = imbinarize(image,'adaptive','ForegroundPolarity','dark','Sensitivity',0.4);
  imwrite(rot90(image*255, 3), "data/processed/"+ filename);
end