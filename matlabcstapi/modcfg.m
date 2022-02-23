function t=modcfg(mws,Mode)
%Mode='meta_unit_cfg';
path='E:\IT_files\matlab\CST-MATLAB-API-master\CST-MATLAB-API-master\myfunc\cfg';
fullpath=[path '\',Mode,'.txt'];
fid=fopen(fullpath);
t='';
tline=fgetl(fid);
t=[t tline];
while ischar(tline)
    tline=fgetl(fid);
    t=[t 10 tline];
end
fclose(fid);
end

