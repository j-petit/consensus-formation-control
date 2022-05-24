function stderror = ErroPadrao(data)
    stderror = std( data ) / sqrt( length( data ));
end