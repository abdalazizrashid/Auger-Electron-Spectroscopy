using PyCall
pygui(:qt5)
using PyPlot
using Gtk
# Importing libraries
let # Global scope

global num_y = 100000
global num_x = 10
global j = readlines("test.csv")
global i = readlines("y.csv")
global j_f = parse.([Float64], j)
global i_f = parse.([Float64], i)
global key1 = 1
global data = i_f    ################################################## FIRST SET OF DATA INPUT
global data_2 = j_f  ################################################## SECOND SET OF DATA INPUT
global x = collect(1:length(data))

plot(data_2, color="brown", linewidth=2.0, linestyle="--")
        title("AUGER")
        xlabel("X")
        ylabel("Y")
        grid("on")
global win = GtkWindow("Key Press Example") # to insurce default selection of the window
# key listner
signal_connect(win, "key-press-event") do widget, event
println("You pressed key ", event.keyval)
key1 = event.keyval
println("hhhhh=$key1")

# end of key listner
#PyPlot.pause(0.05)
################################ CONTROL
function Axis_shift_x(x, x_inc)
        x = x .+ x_inc
        return(x)
end

function Axis_shift_y(data, num_y)
        y = y .+ y_inc
        return(y)
end


function Plot_me(x, y, x_inc, y_inc)
        PyPlot.cla()

        plot(x, y, color="green", linewidth=2.0)
                    title("AUGER")
                    xlabel("X")
                    ylabel("Y")
                    grid("on")
        plot(x_inc, y_inc, color="red", linewidth=2.0, linestyle="--")
                title("AUGER")
                xlabel("X")
                ylabel("Y")
                grid("on")
        println("DAA=$key1")
end

if (key1 == 119)############################# W buttom
# SECOND SET OF DATA
num_y = num_y + 100000
Plot_me(x, data, x, (data .+ num_y))


println("in function")





elseif (key1 == 115)# S buttom
        num_x = num_x + 10
        Plot_me(x, data, x, (data .- num_y))

elseif (key1 == 97)################### A buttom
        num_x = num_x + 10
        Plot_me(x, data, (x .+ num_x), data)

elseif (key1 == 100)################### D buttom
        num_x = num_x + 10
        Plot_me(x, data, (x .- num_x), data)

end

end

end
