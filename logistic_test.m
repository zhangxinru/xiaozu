%广告点击预测test
dim=12;%特征维度
A=[I1,I2,I3,I4,I5,I6,I7,I8,I9,I10,I11,I13];
[m,n]=size(A);
for i=1:m
A(i,dim+1)=1;
end
X=A;
Z=X*B;%simoid自变量 m*1
for j=1:m
        H(j,:)=1/(1+exp(-Z(j,:)));%激励函数
end
csvwrite('submission.csv',H);