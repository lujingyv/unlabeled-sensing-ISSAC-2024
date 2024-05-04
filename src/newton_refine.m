function x_nref = newton_refine (x0,poly,variables)
fun = get_fun(poly, variables);
x_nref = fsolve(fun, x0);

end

function handle = get_fun(poly,variables)

    function q = poly_fun (x_value)
        m = assign(variables, x_value);
        q = double(poly);
        
        
    end



handle = @poly_fun ;

end


