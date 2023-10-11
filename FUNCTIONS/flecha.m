function [arrow] = flecha(vector)
arrow = quiver( vector(1),vector(2),vector(3)-vector(1),vector(4)-vector(2),0,'color',[1 0 0] );
end

