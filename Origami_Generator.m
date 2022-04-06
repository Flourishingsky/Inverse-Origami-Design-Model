function varargout = Origami_Generator(varargin)
% UNTITLED MATLAB code for untitled.fig

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Origami_Generator_OpeningFcn, ...
                   'gui_OutputFcn',  @Origami_Generator_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before untitled is made visible.
function Origami_Generator_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitled (see VARARGIN)

% Choose default command line output for untitled

handles.output = hObject;
Logo= imread('title.png');
warning off;
javaImage = im2java(Logo);
newIcon = javax.swing.ImageIcon(javaImage);
figFrame = get(handles.figure1,'JavaFrame'); %取得Figure的JavaFrame。
figFrame.setFigureIcon(newIcon); %修改图标
% set(fig.ToolBar,'tag','figMenuFile'),'BackGroundColor',[1/255 1/255 1/255]);
% guidata(hObject, handles); 

% Update fig
guidata(hObject, handles);
axes(handles.axes2); 
imshow('cityu.jpeg');
axes(handles.axes1);
imshow('specification.png');
%off button x
set(handles.pushbutton8,'visible','off');

% UIWAIT makes untitled wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Origami_Generator_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;

function edit1_Callback(hObject, eventdata, handles)


function edit1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit2_Callback(hObject, eventdata, handles)



% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit3_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% ---Input shape parameters to get the regular origami shapes
function pushbutton1_Callback(hObject, eventdata, handles)
% read the input parameters.
L=str2double(get((handles.edit1),'String'));
W=str2double(get((handles.edit2),'String'));
n=str2double(get((handles.edit3),'String'));
sliderValue2 = get(handles.slider2,'Value');
layer=str2double(get((handles.edit4),'String'));

global h b sita d k a p
a=[];b=[];sita=[];d=[];
axes(handles.axes1); 
cla reset;
box(handles.axes1,'on');
axis equal;
view(90,0);
set(handles.pushbutton8,'visible','off');

%% Rectangle  
if (n==4) 
%	Calculate the basic parameters
    for K=1:1:1000
        if ((L/W*(K+1))==fix(L/W*(K+1)))
            break;
        end
    end
%     K=K+2;
    M=L/W*(K+1)-1;
    h=L/(M+1)/sqrt(2);
    for i=1:1:2*M+1
        sita0(i)=45;
    end
    for i=2*M+2:1:2*M+1+2*K+1
        sita0(i)=135;
    end
    sita=[sita0,sita0,45,45];      %add one facet in the last
    k=length(sita)-1;
    Parameters();
%     H=h*sind(45);             % Passive thickness

%   Draw the whole facets to build the origami
    Draw(layer,sliderValue2);
end
%% Triangle
if (n==3)
%	Calculate the basic parameters
    Q=L;               %The actual Length = 2(Q+1)W/tand(60).
    for i=1:1:2*Q+1
        sita(i)=60;
    end
    for i=2*Q+2:1:(2*Q+1)*2
        sita(i)=120;
    end
    for i=(2*Q+1)*2+1:1:(2*Q+1)*3
        sita(i)=60;
    end
    sita(i+1)=120;
    sita(i+2)=120;
    h=2*W*cosd(60);
    k=length(sita)-1;
    Parameters();
    
%	Draw the whole facets to build the origami
    Draw(layer,sliderValue2);
end
%% Regular polygon (n>4)   
if (n>4)
%	Calculate the basic parameters
    rapha=90-(n-2)/n*90;
    if (2*W/L<=sind(rapha))
        disp("ERROR #### ");
    end
    x4=atan((2*W/L-sind(rapha))/cosd(rapha))/pi*180;
    x3=x4+rapha;        %adjacent angle    
    h=L*sind(x3); 
    for i=1:1:n       %add one facet in the last
        sita(2*i-1)=x3;sita(2*i)=x4;
    end
    sita(2*n+1)=x3;
    sita(2*n+2)=x4;
    k=length(sita)-1;
    Parameters();
    
%	Draw the whole facets to build the origami
    Draw(layer,sliderValue2);
end


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%%%%Save Pattern
% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
layer=str2double(get((handles.edit4),'String'));
global p

axes(handles.axes1); 
cla reset;
axis equal;

P=p;
for i=1:1:length(P)
    P(i)=0;
end

draft(layer,P);

%axis off;
set(gcf,'color','w');
xlabel('x (mm)');ylabel('y (mm)');
set(gca,'FontName','Gill Sans MT','Fontsize',8);
title('Origami pattern','Fontsize',10);
view(90,-90);

new_f_handle=figure('visible','off');
new_axes=copyobj(handles.axes1,new_f_handle); 
set(new_axes,'units','default','position','default');

%输出图形到文件
[filename,pathname,fileindex]=uiputfile({'*.png';'*.tif';'*.pdf'},'save picture as');
if ~filename
     return
else
      file=strcat(pathname,filename);
      switch fileindex %根据不同的选择保存为不同的类型
      case 1
                  print(new_f_handle,'-dpng',file, '-r1200');
      case 2
                  print(new_f_handle,'-dtif',file, '-r600');
      case 3
                  print(new_f_handle,'-dpdf',file, '-r600');
      end
end
delete(new_f_handle);

% --- Executes during object creation, after setting all properties.
function axes2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes2


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% 
global h b sita d a  k
a=[];b=[];sita=[];d=[];
layer=str2double(get((handles.edit4),'String'));
h=str2double(get((handles.edit7),'String'));
beta1=str2double(get((handles.edit8),'String'));
beta2=str2double(get((handles.edit12),'String'));
sliderValue = get(handles.slider1,'Value');
sliderValue2 = get(handles.slider2,'Value');

Preprocessing(sliderValue,beta1,beta2);
Parameters();

k=length(sita)-1;

[AZ,EL] = view;
axes(handles.axes1); 
cla reset;
box(handles.axes1,'on');
axis equal;

if (AZ==90&&EL==0)
    set(handles.pushbutton8,'visible','off');
else
    set(handles.pushbutton8,'visible','on');
end

%Draw all the facets
Draw(layer,sliderValue2);

view(AZ,EL);

% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% ---Load Custome shape.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% clear all; clc;
global h b sita d a k 
a=[];b=[];sita=[];d=[];
image_read();
layer=str2double(get((handles.edit4),'String'));
h=str2double(get((handles.edit7),'String'));
beta1=str2double(get((handles.edit8),'String'));
beta2=str2double(get((handles.edit12),'String'));
sliderValue = get(handles.slider1,'Value');
sliderValue2 = get(handles.slider2,'Value');

Preprocessing(sliderValue,beta1,beta2);
Parameters();

k=length(sita)-1;

axes(handles.axes1); 
cla reset;
box(handles.axes1,'on');
axis equal;

Draw(layer,sliderValue2);

view(90,0);
function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double
if (get((handles.edit7),'String')~=""&&get((handles.edit8),'String')~="")
      slider1_Callback(hObject, eventdata, handles);
end


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double
if (get((handles.edit7),'String')~=""&&get((handles.edit8),'String')~="")
      slider1_Callback(hObject, eventdata, handles);
end

% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
layer=str2double(get((handles.edit4),'String'));
global p
X_min_max=get(gca,'Xlim');
Y_min_max=get(gca,'Ylim');
Z_min_max=get(gca,'Zlim');
[AZ,EL] = view;
axes(handles.axes1); 
cla reset;
box(handles.axes1,'on');
axis equal;
% ylim manual;xlim manual;zlim manual;

draft(layer,p);

box(handles.axes1,'on');
xlim(X_min_max);ylim(Y_min_max);zlim(Z_min_max);
view(AZ,EL);




% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
layer=str2double(get((handles.edit4),'String'));
sliderValue2 = get(handles.slider2,'Value');
set((handles.text32),'String',strcat(num2str(round(sliderValue2*100)),'%'));
[AZ,EL] = view;
if (AZ==90&&EL==0)
    set(handles.pushbutton8,'visible','off');
else
    set(handles.pushbutton8,'visible','on');
end
axes(handles.axes1); 
cla reset;
box(handles.axes1,'on');
axis equal;

Draw(layer,sliderValue2);

view(AZ,EL);


    


% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
view(90,0);


% --- Executes during object creation, after setting all properties.
function pushbutton8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.edit1, 'String', '');
set(handles.edit2, 'String', '');
set(handles.edit3, 'String', '');
% set(handles.edit4, 'String', '');
% set(handles.edit7, 'String', '');
% set(handles.edit8, 'String', '');


% --- Appearance-Face.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% slider2_Callback(hObject, eventdata, handles);
global p k
layer=str2double(get((handles.edit4),'String'));
[AZ,EL] = view;
axes(handles.axes1); 
X_min_max=get(gca,'Xlim');
Y_min_max=get(gca,'Ylim');
Z_min_max=get(gca,'Zlim');
cla reset;
box(handles.axes1,'on');
axis equal;
xlim(X_min_max);ylim(Y_min_max);zlim(Z_min_max);
% ylim manual;xlim manual;zlim manual;
facet1=Rotate_Matrix(1,p)*basic_facet(1); 
for j=1:1:layer
    for i=1:1:k
       hand(j,i)=patch(2*(j-1)*facet1(1,2)+facet1(1,:),facet1(2,:),facet1(3,:),[82/256,122/256,175/256]);hold on;
       hand2(j,i)=patch(2*(j-1)*facet1(1,2)-facet1(1,:),facet1(2,:),facet1(3,:),[82/256,122/256,175/256]);hold on;
    end
end
for i=1:1:k
    facet=Rotate_Matrix(i,p)*basic_facet(i);
    for j=1:1:layer
        facet2=[2*(j-1)*facet(1,2)+facet(1,:);facet(2,:);facet(3,:);facet(4,:)];
        set(hand(j,i),'Faces',[1,2,3,4],'Vertices',[facet2(1:3,1)';facet2(1:3,2)';facet2(1:3,3)';facet2(1:3,4)'],'FaceColor',[82/256,122/256,175/256]);
        facet2=[2*(j-1)*facet(1,2)-facet(1,:);facet(2,:);facet(3,:);facet(4,:)];
        set(hand2(j,i),'Faces',[1,2,3,4],'Vertices',[facet2(1:3,1)';facet2(1:3,2)';facet2(1:3,3)';facet2(1:3,4)'],'FaceColor',[82/256,122/256,175/256]);
    end
end
view(AZ,EL);
axis equal; rotate3d on;
xlim(X_min_max);ylim(Y_min_max);zlim(Z_min_max);
set(gcf,'color','w');
xlabel('x(mm)','FontAngle','italic');ylabel('y(mm)','FontAngle','italic');zlabel('z(mm)','FontAngle','italic');
title('Origami folding simulator');
set(gca,'FontName','Gill Sans MT','Fontsize',10);


function edit12_Callback(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit12 as text
%        str2double(get(hObject,'String')) returns contents of edit12 as a double


% --- Executes during object creation, after setting all properties.
function edit12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function uipushtool1_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to uipushtool1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename,pathname]=uiputfile({'*.jpg','JPEG(*.jpg)';...
                                             '*.png','PNG(*.png)';...
                                             '*.tif','TIF(*.tif)';...
                                             '*.*',  'All Files (*.*)'},...
                                             'Save Picture','Untitled');

if filename==0
      return;
else
    pathfile=[pathname filename];
    output_figure=getframe(handles.axes1);
    imwrite(output_figure.cdata,pathfile);
end


% --- Executes during object creation, after setting all properties.
function uipanel1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uipanel1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
