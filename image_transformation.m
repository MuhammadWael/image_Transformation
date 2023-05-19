% Read the image file
originalImage = imread('My photo.jpg');

% Create a new figure
figure('Name', 'Geometric Transformations');

% Display the original image
subplot(2, 3, 1);
imshow(originalImage);
title('Original Image');

% Rotation
angle = 45; % Specify the rotation angle in degrees
rotatedImage = imrotate(originalImage, angle, 'crop');

% Display the rotated image
subplot(2, 3, 2);
imshow(rotatedImage);
title('Rotated Image');

% Shear
shearFactor = 0.5; % Specify the shear factor
tform = affine2d([1 shearFactor 0; 0 1 0; 0 0 1]);
shearedImage = imwarp(originalImage, tform);

% Display the sheared image
subplot(2, 3, 3);
imshow(shearedImage);
title('Sheared Image');

% Reflection
reflectionType = 'vertical'; % Choose either 'vertical' or 'horizontal'
reflectedImage = flip(originalImage, 1);
if strcmp(reflectionType, 'horizontal')
    reflectedImage = flip(originalImage, 2);
end

% Display the reflected image
subplot(2, 3, 4);
imshow(reflectedImage);
title('Reflected Image');

% Scaling
scaleFactor = 2; % Scaling factor
scaledImage = imresize(originalImage, scaleFactor);

% Display the scaled image
subplot(2, 3, 5);
imshow(scaledImage);
title('Scaled Image');

% Save the transformed images
imwrite(rotatedImage, 'rotated_image.jpg');
imwrite(shearedImage, 'sheared_image.jpg');
imwrite(reflectedImage, 'reflected_image.jpg');
imwrite(scaledImage, 'scaled_image.jpg');

% Open and display the transformed images
openedRotatedImage = imread('rotated_image.jpg');
openedShearedImage = imread('sheared_image.jpg');
openedReflectedImage = imread('reflected_image.jpg');
openedScaledImage = imread('scaled_image.jpg');

subplot(2, 3, 6);
imshow(openedRotatedImage);
title('Opened Rotated Image');

% Add a title to the figure
sgtitle('Geometric Transformations');

% Remove the unnecessary subplot for the opened original image
delete(subplot(2, 3, 6));

% Save all transformed images automatically
imwrite(rotatedImage, 'Rotated_Image.jpg');
imwrite(shearedImage, 'Sheared_Image.jpg');
imwrite(reflectedImage, 'Reflected_Image.jpg');
imwrite(scaledImage, 'Scaled_Image.jpg');

disp('All transformed images have been saved.');

% Function to save the image
function saveImage(image, imageName)
    imwrite(image, [imageName, '.jpg']);
    disp(['Saved ', imageName, '.jpg']);
end
