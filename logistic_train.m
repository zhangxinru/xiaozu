%�����Ԥ�� �߼��ع� I12ȱʧ���ݹ��಻��Ϊ����
A=[I1,I2,I3,I4,I5,I6,I7,I8,I9,I10,I11,I13];

[m,dim]=size(A);%����ά��

for i=1:m
A(i,dim+1)=1;
end

X=A(:,1:dim+1);%ѵ��������
Y=Label;%ѵ����label
B=zeros(dim+1,1);%��ʼ����������
step=0;%��������

Z=X*B;
for j=1:m
        H(j,:)=1/(1+exp(-Z(j,:)));%sigmiod����
end
E(1,:)=(-1/m)*(Y'*log(H)+(1-Y')*log(1-H));
J=X'*(H-Y)/m;
a=0.05;%learning rate
lambda=10;%����ϵ��
for i=1:10000
    sum=0;%������
    Z=X*B;%simoid�Ա��� m*1ά
    for j=1:m
        H(j,:)=1/(1+exp(-Z(j,:)));%sigmiod����
    end
    
    for j=1:dim
        sum=sum+B(j,:)*B(j,:);
    end
    EC(i,:)=lambda*sum/m;
    E(i,:)=(-1/m)*(Y'*log(H)+(1-Y')*log(1-H))+lambda*sum/m;%Loss Function
    J=X'*(H-Y)/m+lambda*B/m;%�ݶ�
    B=B-a*J;%�ݶȵ���
end
disp('loss')
E(i)
figure(1);
plot(E);%����loss����������Ĺ�ϵͼ
figure(2);
plot(EC);%��������������������Ĺ�ϵͼ