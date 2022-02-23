function drawcylinder(mws, Name, component, material, OutR, InnerR, XCenter, YCenter, Zrange)

%cst = actxserver('CSTStudio.application');%首先载入CST应用控件
%mws = invoke(cst, 'NewMWS');%新建一个MWS项目
%app = invoke(mws, 'GetApplicationName');%获取当前应用名称
%ver = invoke(mws, 'GetApplicationVersion');%获取当前应用版本号
%Name='test';
%component='component1';
%material='PEC';
%Xcenter=1.2;
%Ycenter=1.2;
%Zrange=[2.0180 2.0360];
%OutR=1.2;
%InnerR=0;

Str_Name=Name;
Str_Component=component;
Str_Material=material;
sCommand = '';
sCommand = [sCommand 'With Cylinder'];
sCommand = [sCommand 10 '.Reset'];
sCommand = [sCommand 10 '.Name "',Str_Name, '"'];
sCommand = [sCommand 10 '.Component "', Str_Component, '"'];
sCommand = [sCommand 10 '.Material "', Str_Material, '"'];
sCommand = [sCommand 10 '.OuterRadius "',num2str(OutR,'%.5f'), '"'];
sCommand = [sCommand 10 '.InnerRadius "',num2str(InnerR,'%.5f'), '"'];
sCommand = [sCommand 10 '.Axis "z"'];
sCommand = [sCommand 10 '.Zrange ', '"',num2str(Zrange(1),'%.5f'),'","',num2str(Zrange(2),'%.5f'),'"'];
sCommand = [sCommand 10 '.Xcenter "',num2str(XCenter,'%.5f'), '"'];
sCommand = [sCommand 10 '.Ycenter "',num2str(YCenter,'%.5f'), '"'];
sCommand = [sCommand 10 '.Segments "0"'];
sCommand = [sCommand 10 '.Create'];
sCommand = [sCommand 10 'End With'] ;
invoke(mws, 'AddToHistory',['define cylinder:',Str_Component,':',Str_Name], sCommand);

end