function cutter_analysis
clear
clc
close
%% Description
% Author: Yuan-Ray Chang
% Date: 04/18/2016
% Input:
% theta2_s is the start angle of the handle 
% Output:
% avg_ma is the average mechanical advantage throughout the motion that cuts down
% 12 mm 
%=============================================================
%%
global link2 link3 offset degree degree_f degree_s iteration_ei iteration_aei iteration_gs
% initial value
link2=60;
link3=100;
offset=75;
theta2=linspace(105,145,200);
theta2_s=linspace(0,359,360);
% count the iteration through each method
iteration_aei=0;
iteration_ei=0;
iteration_gs=0;
% input diolog
prompt = {'Enter link2 length(mm):','Enter offset(mm):'};
dlg_title = 'Set Up Configureation';
num_lines = 1;
defaultans = {['' num2str(link2) ''],['' num2str(offset) '']};


    function plot_ma(src,evt) % to plot ma vs theta2
        
        ma=cutter_ma(theta2);
        plot(degree,ma);
        xlabel('Angle of the handle (deg)');
        ylabel('MA');
        title('Mechanical Advantage analysis');
        % interpolate the discrete points to a continuous funtion
        theta2vsma = @(new_x) interp1(theta2,ma, new_x);
        
        tic % timer
        [ymax,xmax] = ei_max(theta2vsma,105,145,0.001,0.1,0.01);
        toc % timer
        t_ei=toc % save the elapsed time
        
        tic
        [ymax2, xmax2] = aei_max(theta2vsma, 105, 145,0.001, 0.1);
        toc
        t_aei=toc
        
        tic
        [ymax3, xmax3] = gs_max(theta2vsma, 105, 145, 0.001, 0.1);
        toc
        t_gs=toc
        
        %% annotation box 
        dim = [0.4 0.4 0.3 0.3];
        str={[' Link 2: ' num2str(link2) ' mm'],[' Offset: ' num2str(offset) ' mm'],' EI method:',...
            [' optimum MA = ' num2str(ymax) ', handle angle = ' num2str(xmax) ' deg'],...
            [' iteration = ' num2str(iteration_ei) ', Elapsed time is ' num2str(t_ei) ' seconds'],...
            ' AEI method:',[' optimum MA = ' num2str(ymax2) ', handle angle = ' num2str(xmax2) ' deg'],...
            [' iteration = ' num2str(iteration_aei) ', Elapsed time is ' num2str(t_aei) ' seconds'],...
            ' GS method:',[' optimum MA = ' num2str(ymax3) ', handle angle = ' num2str(xmax3) ' deg'],...
            [' iteration = ' num2str(iteration_gs) ', Elapsed time is ' num2str(t_gs) ' seconds']};
       
        delete(findall(gcf,'Tag','del')); % to revise the annotation box, must delete the previos one 
        annotation('textbox',dim,'String',str,'FitBoxToText','on','Tag','del'); % 'Tag','del' is to let the delete to find this annotation box
        %%
        hold on
        plot(xmax,ymax,'r-o');
        plot(xmax2,ymax2,'r-+');
        plot(xmax3,ymax3,'r-x');
        legend('MA','ei max','aei max','gs max');
        hold off
    end
%% 
    function plot_avg_ma(src,evt) % to plot avg_ma vs start angle of theta2
      avg_ma=cutter_avg_ma(theta2_s);
      if length(degree_s)>0
      plot(degree_s,avg_ma);
        xlabel('Start Angle of the handle (deg)');
        ylabel('Average MA');
        title('Mechanical Advantage analysis');
        % interpolate the discrete points to a continuous funtion
        theta2vsavgma = @(new_x) interp1(degree_s,avg_ma, new_x);
        tic
        [ymax,xmax] = ei_max(theta2vsavgma,degree_s(1),degree_s(length(degree_s)),0.001,0.1,0.01);
        toc
        t_ei=toc
       
        tic
        [ymax2, xmax2] = aei_max(theta2vsavgma, degree_s(1),degree_s(length(degree_s)),0.001, 0.1);
        toc
        t_aei=toc
        
        tic
        [ymax3, xmax3] = gs_max(theta2vsavgma, degree_s(1),degree_s(length(degree_s)), 0.001, 0.1);
        toc
        t_gs=toc
        
        dim = [0.4 0.4 0.3 0.3];
        str={[' Link 2: ' num2str(link2) ' mm'],[' Offset: ' num2str(offset) ' mm'],' EI method:',...
            [' optimum avg MA = ' num2str(ymax) ', handle start angle = ' num2str(xmax) ' deg'],...
            [' iteration = ' num2str(iteration_ei) ', Elapsed time is ' num2str(t_ei) ' seconds'],...
            ' AEI method:',[' optimum avg MA = ' num2str(ymax2) ', handle start angle = ' num2str(xmax2) ' deg'],...
            [' iteration = ' num2str(iteration_aei) ', Elapsed time is ' num2str(t_aei) ' seconds'],...
            ' GS method:',[' optimum avg MA = ' num2str(ymax3) ', handle start angle = ' num2str(xmax3) ' deg'],...
            [' iteration = ' num2str(iteration_gs) ', Elapsed time is ' num2str(t_gs) ' seconds']};
       
        delete(findall(gcf,'Tag','del')); % to revise the annotation box, must delete the previos one 
        annotation('textbox',dim,'String',str,'FitBoxToText','on','Tag','del'); % 'Tag','del' is to let the delete to find this annotation box
        hold on
        plot(xmax,ymax,'r-o');
        plot(xmax2,ymax2,'r-+');
        plot(xmax3,ymax3,'r-x');
        legend('Average MA','ei max','aei max','gs max');
        hold off
      
      else
      disp('no possible angle'); 
      plot(0,0);
      text(0, 0,'no possible angle');

      end
    end
%%
    function set_up_config(src,evt)
    defaultans = {['' num2str(link2) ''],['' num2str(offset) '']};
    input=inputdlg(prompt,dlg_title,num_lines,defaultans);
    link2=str2double(input{1});
    offset=str2double(input{2});
    while link2<=0 || link2>90 || offset<0 ||offset>100 % make sure the input values are in the range
    if link2<=0 || link2>90 
          waitfor(msgbox('link2 is out of range!!!','Error'));
                   
    end
    if offset<0 ||offset>100
        waitfor(msgbox('offset is out of range!!!','Error'));
    end
    input=inputdlg(prompt,dlg_title,num_lines,defaultans);
    link2=str2double(input{1});
    offset=str2double(input{2});
    end
    end
%%
f = figure('MenuBar','None');
mh = uimenu(f,'Label','MA Analysis'); 
 uimenu(mh,'Label','Plot MA','Callback',@plot_ma);
 uimenu(mh,'Label','Plot Average MA','Callback',@plot_avg_ma);
 uimenu(mh,'Label','Setup','Callback',@set_up_config);


end
