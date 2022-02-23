function subtractm(mws,Name1,Com1,Name2,Com2)
sCommand='';
sCommand=[sCommand 'Solid.Subtract "',Com1,':',Name1,'", "',Com2,':',Name2,'"']
%boolean subtract shapes:component1:solid,component1:solid2
%Solid.Subtract "component1:solid1", "component1:solid2" 
invoke(mws, 'AddToHistory',['boolean subtract shapes:',Com1,':',Name1,',',Com2,':',Name2], sCommand);
end