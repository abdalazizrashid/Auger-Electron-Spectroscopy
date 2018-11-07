using PyCall
pygui(:qt5)
using PyPlot
using Gtk
using Gtk.ShortNames, GtkReactive
# Importing libraries
let # Global scope

global num_y = 1000
global num_x = 5
global j = readlines("o.csv")
global i = readlines("c.csv")
global j_f = parse.([Float64], j)
global i_f = parse.([Float64], i)
global key1 = 1
global data = j_f    ################################################## FIRST SET OF DATA INPUT
global data_doubled = i_f    ################################################## FIRST SET OF DATA INPUT

global data_2 = i_f  ################################################## SECOND SET OF DATA INPUT
global x = collect(1:length(data))
global x_doubled = collect(1:length(data))


plot(data_2, color="brown", linewidth=2.0, linestyle="--")
        title("AUGER")
        xlabel("ev")
        ylabel("C/s")
        grid("on")

global win = GtkWindow("Auger",300,150) # to insurce default selection of the window
#label = GtkLabel("My text")
#hbox = GtkBox(:v)

g = GtkGrid()
a = GtkLabel(" ")  # a widget for entering text
GAccessor.justify(a, Gtk.GConstants.GtkJustification.FILL)
GAccessor.markup(a,"""<b> W, S Key for Vertical Shifting </b>\n""")
b = GtkLabel(" ")
GAccessor.markup(b,"""<b> A, D keys for Horizantal shifting </b>\n""")
c = GtkLabel(" ")
GAccessor.markup(c,"""<b> C, Shift + C Keys for Compress/Decompress the Graph </b>\n""")
d = GtkLabel(" ")
GAccessor.markup(d,"""<b> L, Shift + L Keys for Increase/Decrease Amplitude of the Graph </b>\n""")
#GAccessor.line_wrap(d,true)
global slider_x = GtkScale(false, 0:10)     # a slider
slider_y = GtkScale(false, 0:10)
# Now let's place these graphical elements into the Grid:
g[1,1] = a    # Cartesian coordinates, g[x,y]
g[1,2] = b
g[1,3] = c
g[1,4] = d  # spans both columns
g[1:1,5] = slider_x
g[1:1,6] = slider_y


println(slider_x)
set_gtk_property!(g, :column_homogeneous, true)
set_gtk_property!(g, :column_spacing, 15)  # introduce a 15-pixel gap between columns
push!(win, g, slider_x, slider_y)
 # shorthand for push!(signal(sl), 1)
showall(win)

# key listner
signal_connect(win, "key-press-event") do widget, event
println("You pressed key ", event.keyval)
key1 = event.keyval

# slider_value_x = signal(slider_x)
# slider_value_y = signal(slider_y)

# end of key listner

#PyPlot.pause(0.05)
################################ CONTROL

# function Axis_shift(x_inc, y_inc)
#         num_x = num_x .+ x_inc
#         num_y = numy .+ y_inc
#         return num_x, num_y
# end
function Slider_x(widget)
    println(widget, " was changed!")
end


function Axis_shift_x(inc)
        num_x = num_x +  inc

        return num_x
end

function Axis_shift_y(inc)
        num_y = num_y +  inc

        return num_y
end
global comp = 0.5
function Axis_Compress(inc)
        comp = comp +  inc

        return num_y
end

function Plot_me(x, y, x_inc, y_inc)
        PyPlot.cla()

        plot(x, y, color="green", linewidth=2.0)
                    title("AUGER")
                    xlabel("ev")
                    ylabel("C/s")
                    grid("on")

        plot(x_inc, y_inc, color="red", linewidth=2.0, linestyle="--")
                PyPlot.plot_surface
                title("AUGER")
                xlabel("ev")
                ylabel("C/s")
                grid("on")

        println("DAA=$key1")
end

if (key1 == 119)############################# W buttom

        global data_doubled = data_doubled .+ Axis_shift_y(50000)

        Plot_me(x, data, x_doubled ,data_doubled)

println(val)


elseif (key1 == 115)######################## S buttom
        global data_doubled = data_doubled .- Axis_shift_y(25000)

        Plot_me(x, data, x_doubled ,data_doubled)

elseif (key1 == 97)################### A buttom
        global x_doubled = x_doubled .- Axis_shift_x(2)

        Plot_me(x, data, x_doubled, data_doubled)

elseif (key1 == 100)################### D buttom
        global x_doubled = x_doubled .+ Axis_shift_x(1)

        Plot_me(x, data, x_doubled, data_doubled)
elseif (key1 == 99)################### C buttom
        global x_doubled = x_doubled .* 0.97

        Plot_me(x, data, x_doubled, data_doubled)
elseif (key1 == 67)################### C button ------> shift+c
        global x_doubled = x_doubled ./ 0.97

        Plot_me(x, data, x_doubled, data_doubled)
elseif (key1 == 108)################### L buttom
        global data_doubled = data_doubled ./ 0.97

        Plot_me(x, data, x_doubled, data_doubled)

elseif (key1 == 76)################### L button
        global data_doubled = data_doubled .* 0.97  #button ------> shift+L

        Plot_me(x, data, x_doubled, data_doubled)



end

end

end
