%%                        Optimization Package
%                   Simplex Method for LP problems
%  _______________________________________________________________________
%                            Developed by
%                           SHAHROKH SHAHI
%  -----------------------------------------------------------------------
%  Homepage: www.sshahi.com
%  Email: shahi@gatech.edu
%  
%% Function Definition

function [x,fval] = simplex (tableau0 , numDV, display_mode, wait)

    % tableau0: Initial tableau
    % numDV:    number of design variables
    % display_mode: number formats:: 1=ratio  2=floating point
    
    if nargin<4; wait=1; end
    
    n   = numDV;
    mat = tableau0;
    
    if nargin < 3; display_mode=1; end
    
    switch display_mode
        case 1
            format compact
            format rat
        case 2
            format compact
            format short g    
    end
  
    x = zeros(1,n);
    [row,col] = size(mat);

    counter = 0;
    if display_mode
        disp (['======================== TABLEAU [',num2str(counter),'] ========================']);
        disp(mat);
    end
%   tableau(:,:,counter) = mat;
    while sum(mat(end,1:n)<0) > 0 
        counter = counter + 1;
        if display_mode
            disp (['======================== TABLEAU [',num2str(counter),'] ========================']);
        end
        % finding the pivot
        [~, id_min] = min(mat(end,1:end-2));
        indicator = mat(1:end-1,end)./mat(1:end-1,id_min);
        [~, id_piv] = min(abs(indicator));
        mat(id_piv,:) = mat(id_piv,:)./mat(id_piv,id_min);
        
        if display_mode
            fprintf('---> pivot: col = %d  row = %d \n\n',id_min,id_piv);
            disp('make pivot element one:')
            disp(mat)
            disp('--------------------------------')
            disp('make the rest elements zero:')
        end
        for i=1:row
            if i ~=id_piv
                if display_mode
                    fprintf('Row(%d) = Row(%d) - (%3.1f)Row(%d): \n\n',i,i,mat(i,id_min),id_piv);
                end
                mat(i,:) = mat(i,:) - (mat(i,id_min))*mat(id_piv,:);
                if display_mode
                    disp(mat)
                    disp ('--------------------------------')
                    pause (wait) % pause
                end
            end
        end
        
        if display_mode
            fprintf('\nCurrent value of objective function = %4.2f\n',-mat(end,end))
            pause (wait) % pause
            disp('')
        end
    end
    if display_mode
        disp (['============================================================']);
        disp('Final Tableau:')
        disp(mat)
    end
    
    for i = 1 : n   
        if mat(end,i) > 0
            x(i) = 0;
        elseif mat(end,i) == 0
            x(i) = mat(find(mat(:,i),1),end);
        else
            disp('ERROR! Wrong Tableau!')
        end
    end
    
    fval = -mat(end,end);
    if display_mode
        fprintf('Optimum Solution: \n')
        disp(x)

        fprintf('fval(x*) = %4.2f \n\n',-mat(end,end))
        format short g
    end
end
