%广告点击预测 逻辑回归 I12缺失数据过多不作为特征
A=[I1,I2,I3,I4,I5,I6,I7,I8,I9,I10,I11,I13];

[m,dim]=size(A);%特征维度

for i=1:m
A(i,dim+1)=1;
end

X=A(:,1:dim+1);%训练集数据
Y=Label;%训练集label
B=zeros(dim+1,1);%初始化参数矩阵
step=0;%迭代步数

Z=X*B;
for j=1:m
        H(j,:)=1/(1+exp(-Z(j,:)));%sigmiod函数
end
E(1,:)=(-1/m)*(Y'*log(H)+(1-Y')*log(1-H));
J=X'*(H-Y)/m;
a=0.05;%learning rate
lambda=10;%正则化系数
for i=1:10000
    sum=0;%正则化项
    Z=X*B;%simoid自变量 m*1维
    for j=1:m
        H(j,:)=1/(1+exp(-Z(j,:)));%sigmiod函数
    end
    
    for j=1:dim
        sum=sum+B(j,:)*B(j,:);
    end
    EC(i,:)=lambda*sum/m;
    E(i,:)=(-1/m)*(Y'*log(H)+(1-Y')*log(1-H))+lambda*sum/m;%Loss Function
    J=X'*(H-Y)/m+lambda*B/m;%梯度
    B=B-a*J;%梯度迭代
end
disp('loss')
E(i)
figure(1);
plot(E);%绘制loss与迭代次数的关系图
figure(2);
plot(EC);%绘制正则化项与迭代次数的关系图