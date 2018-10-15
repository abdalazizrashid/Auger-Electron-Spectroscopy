using PyCall
pygui(:qt5)
using PyPlot
using Gtk

let

  global num_y = 100000
  global num_x = 10

  global j = readlines("test.csv")
  global i = readlines("y.csv")
  global j_f = parse.([Float64], j)
  global i_f = parse.([Float64], i)

  #global x = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36]
  #j_f = Vector[[12,212,23,24,34,4,3],[12,34,54,3,43,32,6,4]]
  #i_f = Vector[[12,34,54,3,43,32,6,4],[12,34,54,3,43,32,6,4]]
  #j_d = [1:40, j_f]
  global key1 = 1
  data = j_f    ################################################## DATA INPUT
  global x = collect(1:length(data))
  plot(data, color="red", linewidth=2.0, linestyle="--")
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
if (key1 == 119)# W buttom
PyPlot.cla()



      num_y = num_y + 50000
      data2 = j_f .+ num_y # SECOND SET OF DATA

      plot(x, data.+ num_y, color="red", linewidth=2.0, linestyle="--")
                  title("AUGER")
                  xlabel("X")
                  ylabel("Y")
                  grid("on")
      plot(data, color="green", linewidth=2.0)
                  title("AUGER")
                  xlabel("X")
                  ylabel("Y")
                  grid("on")
      println("DAA=$key1")

elseif (key1 == 115)# S buttom
  PyPlot.cla()


      num_y = num_y - 50000
      data2 = j_f .+ num_y # SECOND SET OF DATA
      plot(x, data.+ num_y, color="red", linewidth=2.0, linestyle="--")
                  title("AUGER")
                  xlabel("X")
                  ylabel("Y")
                  grid("on")
      plot(data, color="green", linewidth=2.0)
                  title("AUGER")
                  xlabel("X")
                  ylabel("Y")
                  grid("on")
      println("DAA=$key1")
elseif (key1 == 97)# A buttom
  PyPlot.cla()
      println("DAA=$key1")

      num_x = num_x - 10
      xc = x .+ num_x
      data2 = j_f  # SECOND SET OF DATA
      plot(x.+num_x, data, color="red", linewidth=2.0, linestyle="--")
                  title("AUGER")
                  xlabel("X")
                  ylabel("Y")
                  grid("on")
      plot(data, color="green", linewidth=2.0)
                  title("AUGER")
                  xlabel("X")
                  ylabel("Y")
                  grid("on")
      println("DAA=$key1")
elseif (key1 == 100)# D buttom
      PyPlot.cla()
      println("DAA=$key1")

      num_x = num_x + 10
      xc = x .+ num_x
      data2 = j_f  # SECOND SET OF DATA
      plot(x.-num_x, data, color="red", linewidth=2.0, linestyle="--")
                  title("AUGER")
                  xlabel("X")
                  ylabel("Y")
                  grid("on")
      plot(data, color="green", linewidth=2.0)
                  title("AUGER")
                  xlabel("X")
                  ylabel("Y")
                  grid("on")
      println("DAA=$key1")

end

end

end
