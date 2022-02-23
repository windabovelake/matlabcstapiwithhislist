function LumpedSetm(mws,Name,R,L,C,RangeP1,RangeP2)
Str_Name=Name;
sCommand='';
sCommand=[sCommand 'With LumpedElement'];
sCommand=[sCommand 10 '.Reset'];
sCommand=[sCommand 10 '.SetName "',Str_Name,'"'];
sCommand=[sCommand 10 '.Folder "Folder1"'];
sCommand=[sCommand 10 '.SetType "RLCSerial"'];
sCommand=[sCommand 10 '.SetR  "',num2str(R),'"'];
sCommand=[sCommand 10 '.SetL  "',num2str(L),'e-9"'];
sCommand=[sCommand 10 '.SetC  "',num2str(C),'e-12"'];
sCommand=[sCommand 10 '.SetGs "0"'];
sCommand=[sCommand 10 '.SetI0 "1e-14"'];
sCommand=[sCommand 10 '.SetT  "300"'];
sCommand=[sCommand 10 '.SetP1 "False", "',num2str(RangeP1(1),'%.5f'),'", "',num2str(RangeP1(2),'%.5f'),'", "',num2str(RangeP1(3),'%.5f'),'"'];
sCommand=[sCommand 10 '.SetP2 "False", "',num2str(RangeP2(1),'%.5f'),'", "',num2str(RangeP2(2),'%.5f'),'", "',num2str(RangeP2(3),'%.5f'),'"'];
sCommand=[sCommand 10 '.SetInvert "False"'];
sCommand=[sCommand 10 '.SetMonitor "True"'];
sCommand=[sCommand 10 '.SetRadius "0.0"'];
sCommand=[sCommand 10 '.Wire ""'];
sCommand=[sCommand 10 '.Position "end1"']; 
sCommand=[sCommand 10 '.CircuitFileName ""']; 
sCommand=[sCommand 10 '.CircuitId "1"']; 
sCommand=[sCommand 10 '.UseCopyOnly "True"']; 
sCommand=[sCommand 10 '.UseRelativePath "False"']; 
sCommand=[sCommand 10 '.Create'];
sCommand=[sCommand 10 'End With'];
invoke(mws, 'AddToHistory',['define lumped element:Folder1:',Name], sCommand);
end

%{
With LumpedElement
     .Reset 
     .SetName "element1" 
     .Folder "Folder1" 
     .SetType "RLCSerial" 
     .SetR  "80" 
     .SetL  "1.114e-9" 
     .SetC  "1.111e-12" 
     .SetGs "0" 
     .SetI0 "1e-14" 
     .SetT  "300" 
     .SetP1 "False", "1", "2", "3" 
     .SetP2 "False", "4", "5", "6" 
     .SetInvert "False" 
     .SetMonitor "True" 
     .SetRadius "0.0" 
     .Wire "" 
     .Position "end1" 
     .CircuitFileName "" 
     .CircuitId "1" 
     .UseCopyOnly "True" 
     .UseRelativePath "False" 
     .Create
End With
%}