<<<<<<< HEAD
use_valid=0;
makebatches_mnist;
numbatches_valid=size(testbatchdata,3);
correct = zeros(1,numbatches_valid);
for tt= 1:numbatches_valid
    data_val = testbatchdata(:,:,tt);
    targets_val = testbatchtargets(:,:,tt);
    p_zy_v_valid = P_yz_v(data_val,J,numclasses,M_hid_visMax,M_hid_yMax,M_hidbiasesMax,M_ybiases,beta,beta0 );
    PP_y_v_val = sum( p_zy_v_valid ); %%% 1*C*M  %%%
    P_y_v_val = squeeze(PP_y_v_val);  %%% C*M
    [P_max,target]=max(P_y_v_val);
    [one,TstLbls]=max(targets_val');
    if use_gpu
        TstLbls=gpuArray(TstLbls);
    end
    correct(tt)=sum ( gather(target==TstLbls) );
    
    
end
TestAccuracy=sum(correct)/10000;
=======
use_valid=0;
makebatches_mnist;
numbatches_valid=size(testbatchdata,3);
correct = zeros(1,numbatches_valid);
for tt= 1:numbatches_valid
    data_val = testbatchdata(:,:,tt);
    targets_val = testbatchtargets(:,:,tt);
    p_zy_v_valid = P_yz_v(data_val,J,numclasses,hid_visMax,hid_yMax,hidbiasesMax,ybiases,beta,beta0 );
    PP_y_v_val = sum( p_zy_v_valid ); %%% 1*C*M  %%%
    P_y_v_val = squeeze(PP_y_v_val);  %%% C*M
    [P_max,target]=max(P_y_v_val);
    [one,TstLbls]=max(targets_val');
    if use_gpu
        TstLbls=gpuArray(TstLbls);
    end
    correct(tt)=sum ( gather(target==TstLbls) );
    
    
end
TestAccuracy=sum(correct)/10000;
>>>>>>> origin/master
fprintf(1, 'Classification error on test set: %6.4f  \n', 1-TestAccuracy);