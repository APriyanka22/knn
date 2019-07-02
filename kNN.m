function [acc,acc_av] = kNN(images_train, labels_train, images_test, labels_test,k)

N=1000;

[img_train_row, ~]= size(images_train);

keyset = {0,1,2,3,4,5,6,7,8,9};
valueset = [0,0,0,0,0,0,0,0,0,0];
mapObj = containers.Map(keyset,valueset);

for i =1:N
    accuracycount = 0;
    x = repmat(images_test(i,:),img_train_row,1); 
    dist = sum((x - images_train).^2,2);
    [~ , index] = sort(dist,'ascend');
    labeltrain = labels_train(index(1:k));
    predctd_label= mode(labeltrain);
    actual_label = labels_test(i);
    if(predctd_label == actual_label)
        mapObj(actual_label) = mapObj(actual_label) + 1;
    end
end

edges_labels = unique(labels_test);
count_labels = hist(labels_test,edges_labels);
mapObjectactuals = containers.Map(edges_labels,count_labels);

acc=[0,0,0,0,0,0,0,0,0,0];
for j = 0:9
   acc(j+1) = (mapObj(j)/mapObjectactuals(j))*100;
end
acc_av = mean(acc);

end