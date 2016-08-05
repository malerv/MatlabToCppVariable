function res = formatAsStdArray(vect, varName)
  res = 1;

  if ndims(vect) > 2
    disp('Can not convert array with dimension > 2')
    res = 0
    return
  end
  
  [m n] = size(vect);
  
  if or(m == 1, n == 1)
  
    fprintf("std::array<float, %i> %s \n{{\n",max(m, n),varName)
    for idx = 1:numel(vect)
      element = vect(idx);
      fprintf('    %.11f',element)
      if(idx != max(n, m))
        fprintf(',')  
      end
      fprintf('\n')  
    end
    fprintf("}}\n")
  else
    fprintf("std::array<std::array<float, %i>, %i>  %s \n{{\n",n, m,varName)
    for i = 1:m
      fprintf('    {{')
      for idx = 1:n
        element = vect(i, idx);
        fprintf('%.11f',element)
        if(idx == n)
          fprintf('}}',element)
          if i != m
            fprintf(',')
          end
          fprintf('\n')
        else
          fprintf(',',element)  
        end
      end
    end
    fprintf("}}\n")
  end
  
  
  return