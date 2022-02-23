clc;
clear;
close all;
%初始化设置
cst = actxserver('CSTStudio.application');%首先载入CST应用控件
mws = invoke(cst, 'NewMWS');%新建一个MWS项目
app = invoke(mws, 'GetApplicationName');%获取当前应用名称
ver = invoke(mws, 'GetApplicationVersion');%获取当前应用版本号
%命名
%--------------------------------------------------------------------------
Name2='test';
name(mws,Name2);
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
intializing(mws);
%%CST文件初始化结束
%参数编辑区,利用invoke函数添加参数
%例：
%a=38.6;
%invoke(mws, 'StoreParameter','a',a);
%--------------------------------------------------------------------------
l=5.6;
a=6.5;
t=0.018;
h=2.0;
m=0.525;
d=0.3;
%--------------------------------------------------------------------------
%定义材质
Name='material1';
Epsilon=2.65;
TanD=0.015;
materialdef(mws, Name,Epsilon,TanD);
%--------------------------------------------------------------------------
Name = 'bot';
component = 'component1';
material = 'PEC';
Xrange = [-a*30/2 a*30/2];
Yrange = [-a*30/2 a*30/2];
Zrange = [0 t];
drawbrick(mws, Name, component, material, Xrange, Yrange, Zrange);
NameBot=Name;
for i=1:30
    Name='';
    Name='bot';
    add=int2str(i);
    Name=[Name add];
    cy=-(i-1)*a+14.5*a;
    Xrange=[-a*30/2 a*30/2];
    Yrange=[cy-0.1 cy+0.1];
    Zrange=[0 t];
    drawbrick(mws, Name,component,material,Xrange,Yrange,Zrange);
    subtractm(mws,NameBot,component,Name,component);
end

Name = 'sub';
component = 'component1';
material = 'material1';
Xrange = [-a*30/2 a*30/2];
Yrange = [-a*30/2 a*30/2];
Zrange = [t t+h];
drawbrick(mws, Name, component, material, Xrange, Yrange, Zrange);
NameSub='sub';


for i=1:30
    for j=1:30
        ti=i;
        tj=j;
        cx=(ti-1)*a-14.5*a;
        cy=-(tj-1)*a+14.5*a;

        add= '';
        add = [add 'left',int2str(i),'_',int2str(j)];
%draw top left
        Name1='top';
        Name1=[Name1 add];
        component = 'component1';
        material = 'PEC';
        Xrange = [cx-l/2 cx-0.6];
        Yrange = [cy-l/2 cy+l/2];
        Zrange = [t+h t*2+h];
        drawbrick(mws, Name1, component, material, Xrange, Yrange, Zrange);
%draw hole left
        Name11='hole';
        Name11=[Name11 add];
        material = 'material1';
        Xcenter=cx-0.8;
        Ycenter=cy+l/2-0.2;
        OutR=0.15;
        InnerR=0;
        Zrange2=[t t+h];
        drawcylinder(mws,Name11,component,material,OutR,InnerR,Xcenter,Ycenter,Zrange2);
        subtractm(mws,NameSub,component,Name11,component);
%draw bias left        
        Name12='bias';
        Name12=[Name12 add];
        material = 'PEC';
        Xcenter=cx-0.8;
        Ycenter=cy+l/2-0.2;
        OutR=0.15;
        InnerR=0;
        Zrange2=[t t+h];
        drawcylinder(mws,Name12,component,material,OutR,InnerR,Xcenter,Ycenter,Zrange2);
        addm(mws,NameBot,component,Name12,component);
%perfect top left
        material='PEC';
        Name13='top13';
        Name14='top14';
        Name15='top15';
        Name16='top16';
        Name17='top17';
        Name13=[Name13 add];
        Name14=[Name14 add];
        Name15=[Name15 add];
        Name16=[Name16 add];
        Name17=[Name17 add];
        Xrange=[cx-l/2+m-d cx-l/2+m];
        Yrange=[cy-l/2+0.2 cy+l/2-0.2];
        drawbrick(mws,Name13,component,material,Xrange,Yrange,Zrange);
        Xrange=[cx-l/2+2*m-d cx-l/2+2*m];
        drawbrick(mws,Name14,component,material,Xrange,Yrange,Zrange);
        Xrange=[cx-l/2+3*m-d cx-l/2+3*m];
        drawbrick(mws,Name15,component,material,Xrange,Yrange,Zrange);
        Xrange=[cx-l/2+4*m-d cx-l/2+4*m];
        Yrange=[cy+l/2-0.7 cy+0.4];
        drawbrick(mws,Name16,component,material,Xrange,Yrange,Zrange);
        Yrange=[cy-l/2+0.7 cy-0.4];
        drawbrick(mws,Name17,component,material,Xrange,Yrange,Zrange);
        subtractm(mws,Name1,component,Name13,component);
        subtractm(mws,Name1,component,Name14,component);
        subtractm(mws,Name1,component,Name15,component);
        subtractm(mws,Name1,component,Name16,component);
        subtractm(mws,Name1,component,Name17,component);

%---------------------------------------------------------------------------------------------------------
        add= '';
        add = [add 'right',int2str(i),'_',int2str(j)];
%draw top right
        Name2='top';
        Name2=[Name2 add];
        component = 'component1';
        material = 'PEC';
        Xrange = [cx+0.6 cx+l/2];
        Yrange = [cy-l/2 cy+l/2];
        Zrange = [t+h t*2+h];
        drawbrick(mws, Name2, component, material, Xrange, Yrange, Zrange);
%draw hole right
        Name21='hole';
        Name21=[Name21 add];
        material = 'material1';
        Xcenter=cx+0.8;
        Ycenter=cy-l/2+0.2;
        OutR=0.15;
        InnerR=0;
        Zrange2=[t t+h];
        drawcylinder(mws,Name21,component,material,OutR,InnerR,Xcenter,Ycenter,Zrange2);
        subtractm(mws,NameSub,component,Name21,component);
%draw bias right
        Name22='bias';
        Name22=[Name22 add];
        material = 'PEC';
        Xcenter=cx+0.8;
        Ycenter=cy-l/2+0.2;
        OutR=0.15;
        InnerR=0;
        Zrange2=[t t+h];
        drawcylinder(mws,Name22,component,material,OutR,InnerR,Xcenter,Ycenter,Zrange2);
        addm(mws,NameBot,component,Name22,component);
%perfect top left
        material='PEC';
        Name23='top23';
        Name24='top24';
        Name25='top25';
        Name26='top26';
        Name27='top27';
        Name23=[Name23 add];
        Name24=[Name24 add];
        Name25=[Name25 add];
        Name26=[Name26 add];
        Name27=[Name27 add];
        Xrange=[cx+l/2-m cx+l/2-m+d];
        Yrange=[cy-l/2+0.2 cy+l/2-0.2];
        drawbrick(mws,Name23,component,material,Xrange,Yrange,Zrange);
        Xrange=[cx+l/2-2*m cx+l/2-2*m+d];
        drawbrick(mws,Name24,component,material,Xrange,Yrange,Zrange);
        Xrange=[cx+l/2-3*m cx+l/2-3*m+d];
        drawbrick(mws,Name25,component,material,Xrange,Yrange,Zrange);
        Xrange=[cx+l/2-4*m cx+l/2-4*m+d];
        Yrange=[cy+l/2-0.7 cy+0.4];
        drawbrick(mws,Name26,component,material,Xrange,Yrange,Zrange);
        Yrange=[cy-l/2+0.7 cy-0.4];
        drawbrick(mws,Name27,component,material,Xrange,Yrange,Zrange);
        subtractm(mws,Name2,component,Name23,component);
        subtractm(mws,Name2,component,Name24,component);
        subtractm(mws,Name2,component,Name25,component);
        subtractm(mws,Name2,component,Name26,component);
        subtractm(mws,Name2,component,Name27,component);
    end
end
%180deg=1
R14V=2.857;
L14V=0.7;
C14V=0.3061;
%0deg=0
R0V=4.514;
L0V=0.7;
C0V=2.3;
%matr
matr=3;
K=zeros(matr);


for i=1:30
    for j=1:30
        ti=i;
        tj=j;
        cx=(ti-1)*a-14.5*a;
        cy=-(tj-1)*a+14.5*a;
        NameP='Port';
        addp='';
        addp=[addp int2str(i),'_',int2str(j)];
        NameP=[add addp];
        RangeP1=[cx-0.6 cy t*2+h];
        RangeP2=[cx+0.6 cy t*2+h];
        if (K(i,j)==0)
            LumpedSetm(mws,NameP,R0V,L0V,C0V,RangeP1,RangeP2);
        else
            LumpedSetm(mws,NameP,R14V,L14V,C14V,RangeP1,RangeP2);
        end
    end
end
