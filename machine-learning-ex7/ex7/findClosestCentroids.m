function idx = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1 
%   vector of centroid assignments (i.e. each entry in range [1..K])
%

% Set K - returns row size (,1)
K = size(centroids, 1);

% You need to return the following variables correctly.
idx = zeros(size(X,1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Go over every example, find its closest centroid, and store
%               the index inside idx at the appropriate location.
%               Concretely, idx(i) should contain the index of the centroid
%               closest to example i. Hence, it should be a value in the 
%               range 1..K
%
% Note: You can use a for-loop over the examples to compute this.
%

num_centroids = K;
num_points = size(X,1); %count the rows

for i = 1 : num_points
  %a point is a row in X
  point_loc = X(i,:);
  for j = 1 : num_centroids
    centroid_loc = centroids(j,:); 
    %squared distances from a point to each centroid
    squared_distances(j) = (point_loc - centroid_loc) * (point_loc - centroid_loc)';
  end
  
  [dist, nearest_centroid] = min(squared_distances);
  idx(i) = nearest_centroid;

end


% =============================================================

end

