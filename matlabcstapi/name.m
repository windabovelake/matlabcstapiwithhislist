function name(mws,Name)
%初始化部分
invoke(mws, 'FileNew');
path=pwd;
filename= '';
filename=[filename '\',Name,'.cst'];
fullname=[path filename];
invoke(mws, 'SaveAs', fullname, 'True');
invoke(mws, 'DeleteResults');
end