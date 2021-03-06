function varargout = fk_ui(varargin)
% FK_UI MATLAB code for fk_ui.fig
%      FK_UI, by itself, creates a new FK_UI or raises the existing
%      singleton*.
%
%      H = FK_UI returns the handle to a new FK_UI or the handle to
%      the existing singleton*.
%
%      FK_UI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FK_UI.M with the given input arguments.
%
%      FK_UI('Property','Value',...) creates a new FK_UI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before fk_ui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to fk_ui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help fk_ui

% Last Modified by GUIDE v2.5 29-Apr-2017 16:46:38

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @fk_ui_OpeningFcn, ...
                   'gui_OutputFcn',  @fk_ui_OutputFcn, ...
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


% --- Executes just before fk_ui is made visible.
function fk_ui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to fk_ui (see VARARGIN)

% Choose default command line output for fk_ui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes fk_ui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = fk_ui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function theta1_text_Callback(hObject, eventdata, handles)
% hObject    handle to theta1_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of theta1_text as text
%        str2double(get(hObject,'String')) returns contents of theta1_text as a double


% --- Executes during object creation, after setting all properties.
function theta1_text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to theta1_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function theta2_text_Callback(hObject, eventdata, handles)
% hObject    handle to theta2_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of theta2_text as text
%        str2double(get(hObject,'String')) returns contents of theta2_text as a double


% --- Executes during object creation, after setting all properties.
function theta2_text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to theta2_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function theta3_text_Callback(hObject, eventdata, handles)
% hObject    handle to theta3_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of theta3_text as text
%        str2double(get(hObject,'String')) returns contents of theta3_text as a double


% --- Executes during object creation, after setting all properties.
function theta3_text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to theta3_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function theta4_text_Callback(hObject, eventdata, handles)
% hObject    handle to theta4_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of theta4_text as text
%        str2double(get(hObject,'String')) returns contents of theta4_text as a double


% --- Executes during object creation, after setting all properties.
function theta4_text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to theta4_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function theta5_text_Callback(hObject, eventdata, handles)
% hObject    handle to theta5_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of theta5_text as text
%        str2double(get(hObject,'String')) returns contents of theta5_text as a double


% --- Executes during object creation, after setting all properties.
function theta5_text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to theta5_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in move_button.
function move_button_Callback(hObject, eventdata, handles)

    theta1 = get(handles.theta1_text, 'String');
    theta2 = get(handles.theta2_text, 'String');
    theta3 = get(handles.theta3_text, 'String');
    theta4 = get(handles.theta4_text, 'String');
    theta5 = get(handles.theta5_text, 'String');
    
    if(~isempty(theta1) & ~isempty(theta2) & ~isempty(theta3) & ~isempty(theta4) & ~isempty(theta5))
        
        theta1 = str2double(theta1);
        theta2 = str2double(theta2);
        theta3 = str2double(theta3);
        theta4 = str2double(theta4);
        theta5 = str2double(theta5);
        
        load('theta_a.mat', 'theta_a');
        theta_b = [theta1, theta2, theta3, theta4, theta5];
        
        theta_b(5) = calculate_pose_angle(theta1, theta2, theta3, theta4, theta5);
        
        fprintf('Moving\n');
        
        %Move using any motion algorithm
        n0 = 0;
        nf = 100;
        dq0 = 0;
        dqf = 0;
%         move_to_theta_uniform(theta_a, theta_b);
        move_to_theta_cubic(theta_a, theta_b, n0, nf, dq0, dqf, false);


        fprintf('Motion Complete\n');
        
        %Displaying the FK matrix
        fprintf('Forward Kinematics Matrix:\n');
        disp(fkval(theta_b));
        fprintf('-----------------------------\n');
        
        %Updating starting value to prepare for the next set of values
        theta_a = theta_b;
        
        %Saving 
        save('theta_a.mat', 'theta_a');
        
        
        
    else
        
        fprintf('Input angles. \n');
        
    end
    
    
    
    


% --- Executes on button press in set_default_button.
function set_default_button_Callback(hObject, eventdata, handles)

    %Setting default angles for the five text boxes
    
    default_angles = [0 pi/2 pi/2 0 0];
    
    set(handles.theta1_text, 'String', default_angles(1)); 
    set(handles.theta2_text, 'String', default_angles(2)); 
    set(handles.theta3_text, 'String', default_angles(3)); 
    set(handles.theta4_text, 'String', default_angles(4)); 
    set(handles.theta5_text, 'String', default_angles(5)); 
    


