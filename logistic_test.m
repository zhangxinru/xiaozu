%�����Ԥ��test
dim=12;%����ά��
A=[I1,I2,I3,I4,I5,I6,I7,I8,I9,I10,I11,I13];
[m,n]=size(A);
for i=1:m
A(i,dim+1)=1;
end
X=A;
Z=X*B;%simoid�Ա��� m*1
for j=1:m
        H(j,:)=1/(1+exp(-Z(j,:)));%��������
end
csvwrite('submission.csv',H);