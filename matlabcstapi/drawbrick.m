function drawbrick(mws, Name, component, material, Xrange, Yrange, Zrange)
% Create a brick
%cst = actxserver('CSTStudio.application');%首先载入CST应用控件
%mws = invoke(cst, 'NewMWS');%新建一个MWS项目
%app = invoke(mws, 'GetApplicationName');%获取当前应用名称
%ver = invoke(mws, 'GetApplicationVersion');%获取当前应用版本号
%Name='test';
%component='component1';
%material='PEC';
%Xrange=[-93.6500 -91.4500];
%Yrange=[91.4500,97.0500];
%Zrange=[2.0180 2.0360];

Str_Name=Name;
Str_Component=component;
Str_Material=material;
sCommand = '';
sCommand = [sCommand 'With Brick'];
sCommand = [sCommand 10 '.Reset'];
sCommand = [sCommand 10 '.Name "',Str_Name, '"'];
sCommand = [sCommand 10 '.Component "', Str_Component, '"'];
sCommand = [sCommand 10 '.Material "', Str_Material, '"'];
sCommand = [sCommand 10 '.Xrange ', '"',num2str(Xrange(1),'%.5f'),'","',num2str(Xrange(2),'%.5f'),'"'];
sCommand = [sCommand 10 '.Yrange ', '"',num2str(Yrange(1),'%.5f'),'","',num2str(Yrange(2),'%.5f'),'"'];
sCommand = [sCommand 10 '.Zrange ', '"',num2str(Zrange(1),'%.5f'),'","',num2str(Zrange(2),'%.5f'),'"'];
sCommand = [sCommand 10 '.Create'];
sCommand = [sCommand 10 'End With'] ;
invoke(mws, 'AddToHistory',['define brick:',Str_Component,':',Str_Name], sCommand);
end
