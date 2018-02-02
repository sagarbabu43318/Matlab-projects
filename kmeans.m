function [ class, centroid ] = mykmeans( pixels, K )

% Input:
%     pixels: data set. Each row contains one data point. For image
%     dataset, it contains 3 columns, each column corresponding to Red,
%     Green, and Blue component.
%
%     K: the number of desired clusters. 
%
% Output:
%     class: the class assignment of each data point in pixels. 
%
%     centroid: the location of K centroids in your result. With images,
%     each centroid corresponds to the representative color of each
%     cluster.
    
    [row,col]=size(pixels); %Calculating row and column size of pixels
    
    rand_init=randperm(size(pixels,1)); %Random index initialization
    
    for i=1:K
        centroid(i,:)=pixels(rand_init(i),:); %Centroid initialization
    end
    
    temp=zeros(row,1); %Temporary zero column vector
    
    while 1
        distance=pdist2(pixels,centroid); %Calculate distance to nearest cluster
        [min_val,class] = min(distance,[],2);  
        if class==temp
            break; %Stopping condition if cluster membership doesn't change
        else
            temp=class;
        end
        for i=1:K
            membership = find(class==i);
            if membership
                centroid(i,:) = mean(pixels(find(class==i),:),1); %Setting new cluster center
            end
        end
    
end

