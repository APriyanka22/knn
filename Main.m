clear all
clc
close

load MNIST_digit_data

N=1000;
k=5;

rndm_thousnd_ind = randperm(N);

rndm_thousnd_ind = sortrows(rndm_thousnd_ind);

images_test_new_thousnd = images_test(rndm_thousnd_ind,:);

labels_test_new_thousnd = labels_test(rndm_thousnd_ind,1);

[acc,acc_avg]=kNN(images_train,labels_train,images_test_new_thousnd,labels_test_new_thousnd,k);

for acc_idx = 1:10
    fprintf('Accuracy for value %d is %f\n',acc_idx-1,acc(acc_idx));
end

fprintf('\n\nThe Average Accuracy for the Test Data Set for numbers 0 to 9 is %f',acc_avg);





