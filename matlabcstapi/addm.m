function addm(mws,Name1,Com1,Name2,Com2)
sCommand='';
sCommand=[sCommand 'Solid.Add "',Com1,':',Name1,'", "',Com2,':',Name2,'"']
%boolean add shapes:component1:solid,component1:solid2
%Solid.Add "component1:solid1", "component1:solid2" 
invoke(mws, 'AddToHistory',['boolean add shapes:',Com1,':',Name1,',',Com2,':',Name2], sCommand);
end