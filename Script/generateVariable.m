function res = generateVariable(dimension, b, decimal)
  v = rand(dimension);
  v = v .* (b(2)-b(1))+b(1);
  res = truncateVariable(v, decimal);
