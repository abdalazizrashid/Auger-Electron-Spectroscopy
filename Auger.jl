using PyCall
pygui(:qt5)
using PyPlot
let
global num = 1000
global j = readlines("test.csv")
global i = readlines("y.csv")
global j_f = parse.([Float64], j)
global i_f = parse.([Float64], i)
global x = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36]
#j_f = Vector[[12,212,23,24,34,4,3],[12,34,54,3,43,32,6,4]]
#i_f = Vector[[12,34,54,3,43,32,6,4],[12,34,54,3,43,32,6,4]]
#j_d = [1:40, j_f]

data = j_f    # DATA INPUT
function Click(event)
PyPlot.cla()
plot(data, color="red", linewidth=2.0, linestyle="--")
                    title("AUGER")
                    xlabel("X")
                    ylabel("Y")
                    grid("on")
println("Click: $(event[:xdata]), $(event[:ydata]), $num")
    num = num + 1000
data2 = j_f .+ num # SECOND SET OF DATA

plot(xc, data2, color="green", linewidth=2.0, linestyle="solid")
    #PyPlot.pause(0.05)

end

fig = figure()

println(num)
xc = x .+8
plot(data, color="red", linewidth=2.0, linestyle="--")
            title("AUGER")
            xlabel("X")
            ylabel("Y")
            grid("on")
fig[:canvas][:mpl_connect]("button_press_event", Click)
end
