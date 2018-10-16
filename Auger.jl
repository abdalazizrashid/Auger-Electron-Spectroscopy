using PyCall
pygui(:qt5)
using PyPlot
using Gtk
# Importing libraries
let # Global scope

global num_y = 1000
global num_x = 5
global j = readlines("test.csv")
global i = readlines("y.csv")
global j_f = parse.([Float64], j)
global i_f = parse.([Float64], i)
global key1 = 1
global data = i_f    ################################################## FIRST SET OF DATA INPUT
global data_doubled = i_f    ################################################## FIRST SET OF DATA INPUT

global data_2 = j_f  ################################################## SECOND SET OF DATA INPUT
global x = collect(1:length(data))
global x_doubled = collect(1:length(data))


plot(data_2, color="brown", linewidth=2.0, linestyle="--")
        title("AUGER")
        xlabel("X")
        ylabel("Y")
        grid("on")

global win = GtkWindow("Auger") # to insurce default selection of the window
# key listner
signal_connect(win, "key-press-event") do widget, event
println("You pressed key ", event.keyval)
key1 = event.keyval
println("hhhhh=$key1")

# end of key listner
#PyPlot.pause(0.05)
################################ CONTROL

# function Axis_shift(x_inc, y_inc)
#         num_x = num_x .+ x_inc
#         num_y = numy .+ y_inc
#         return num_x, num_y
# end

function Axis_shift_x(inc)
        num_x = num_x +  inc

        return num_x
end

function Axis_shift_y(inc)
        num_y = num_y +  inc

        return num_y
end

function Plot_me(x, y, x_inc, y_inc)
        PyPlot.cla()

        plot(x, y, color="green", linewidth=2.0)
                    title("AUGER")
                    xlabel("X")
                    ylabel("Y")
                    grid("on")

        plot(x_inc, y_inc, color="red", linewidth=2.0, linestyle="--")
                PyPlot.plot_surface
                title("AUGER")
                xlabel("X")
                ylabel("Y")
                grid("on")

        println("DAA=$key1")
end

if (key1 == 119)############################# W buttom

        global data_doubled = data_doubled .+ Axis_shift_y(50000)

        Plot_me(x, data, x_doubled ,data_doubled)


elseif (key1 == 115)######################## S buttom
        global data_doubled = data_doubled .- Axis_shift_y(25000)

        Plot_me(x, data, x_doubled ,data_doubled)

elseif (key1 == 97)################### A buttom
        global x_doubled = x_doubled .- Axis_shift_x(2)

        Plot_me(x, data, x_doubled, data_doubled)

elseif (key1 == 100)################### D buttom
        global x_doubled = x_doubled .+ Axis_shift_x(1)

        Plot_me(x, data, x_doubled, data_doubled)

end

end

end
