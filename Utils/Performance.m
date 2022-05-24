function J = Performance(error_i, N)

    J = [];
    for(k =1:N)
        J(k) = max(error_i.Data(1,k,:));
    end

end