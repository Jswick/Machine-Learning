function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

sweepValues = [0.01, 0.1, 1, 10, 100];


%store the values of C and sigma that produce the least misclassified points
% on the cross validation step.  Doing this to the training data set would
% lead to ridiculous amounts of overfitting.  A better approach may beep
% to store all values of C and sigma, then store them in a ranked list  
% so that the user can decide how much overfitting to tolerate
Cbest = C;
sigmaBest = sigma;

%the best error also needs to be tracked.  For starters set it ridiculously
% high, just like when implementing a sorting algorithm
lowestError = 10^6

for i = 1:size(sweepValues, 2)
  for j = 1:size(sweepValues,2)
    C = sweepValues(i); 
    sigma = sweepValues(j);
    model= svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma));
    %collect all the predictions of the SVM in a prediction vector
    % to use for calculating the error later (fraction of examples
    % that were classified incorrectly).
    predictions = svmPredict(model, Xval);
    
    %error is the fraction of examples in the cross validation set that
    % were classified incorrectly
    error = mean(double(predictions ~= yval))
    
    %if the current values of C and sigma are better than any of the
    % previous values, then record them
    if error < lowestError
      lowestError = error;
      Cbest = C;
      sigmaBest = sigma;
    end
  end
end  

C = Cbest;
sigma = sigmaBest;





% =========================================================================

end
