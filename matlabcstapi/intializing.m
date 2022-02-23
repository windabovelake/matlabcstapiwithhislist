function intializing(mws)
%%全局单位初始化
sCommand = '';
sCommand = [sCommand 'With Units' ];
sCommand = [sCommand 10 '.Geometry "mm"'];
sCommand = [sCommand 10 '.Frequency "ghz"' ];
sCommand = [sCommand 10 '.Voltage "V"' ];
sCommand = [sCommand 10 '.Resistance "Ohm"' ];
sCommand = [sCommand 10 '.Inductance "nH"' ];
sCommand = [sCommand 10 '.Time "ns"'];
sCommand = [sCommand 10 '.Current "A"'];
sCommand = [sCommand 10 '.Conductance "Siemens"'];
sCommand = [sCommand 10 '.Capacitance "pF"'];
sCommand = [sCommand 10 'End With'] ;
invoke(mws, 'AddToHistory','define units', sCommand);
%%全局单位初始化结束

%%工作频率设置
Frq=[7 14];
sCommand = '';
sCommand = [sCommand 'Solver.FrequencyRange '  num2str(Frq(1)) ',' num2str(Frq(2)) ];
invoke(mws, 'AddToHistory','define frequency range', sCommand);
%%工作频率设置结束

%%背景材料设置
sCommand = '';
sCommand = [sCommand 'With Background' ];
sCommand = [sCommand 10 '.ResetBackground'];
sCommand = [sCommand 10 '.Type "Normal"' ];
sCommand = [sCommand 10 'End With'] ;
invoke(mws, 'AddToHistory','define background', sCommand);
%%背景材料设置结束

%%使Bounding Box显示,这段代码不用保存进历史树
plot = invoke(mws, 'Plot');
invoke(plot, 'DrawBox', 'True');
%%使Bounding Box显示结束

%%floquet端口设置
sCommand = '';
sCommand = [sCommand 'With FloquetPort'];
sCommand = [sCommand 10 '.Reset'];
sCommand = [sCommand 10 '.SetDialogTheta "0"'];
sCommand = [sCommand 10 '.SetDialogPhi "0"'];
sCommand = [sCommand 10 '.SetSortCode "+beta/pw"'];
sCommand = [sCommand 10 '.SetCustomizedListFlag "False"'];
sCommand = [sCommand 10 '.Port "Zmin"'];
sCommand = [sCommand 10 '.SetNumberOfModesConsidered "2"'];
sCommand = [sCommand 10 '.Port "Zmax"'];
sCommand = [sCommand 10 '.SetNumberOfModesConsidered "2"'];
sCommand = [sCommand 10 'End With'];
sCommand = [sCommand 10];
sCommand = [sCommand 10 'MakeSureParameterExists "theta", "0"'];
sCommand = [sCommand 10 'SetParameterDescription "theta", "spherical angle of incident plane wave"'];
sCommand = [sCommand 10 'MakeSureParameterExists "phi", "0"'];
sCommand = [sCommand 10 'SetParameterDescription "phi", "spherical angle of incident plane wave"'];
invoke(mws, 'AddToHistory','define ports', sCommand);
%%floquet端口设置结束


end