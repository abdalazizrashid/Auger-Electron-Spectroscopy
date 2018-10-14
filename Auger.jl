using Plotly
using WebIO
function Import()
    j = readlines("test.csv")
    i = readlines("y.csv")
    j_f = parse.([Float64], j)
    i_f = parse.([Float64], i)
    #j_f = Vector[[12,212,23,24,34,4,3],[12,34,54,3,43,32,6,4]]
    #i_f = Vector[[12,34,54,3,43,32,6,4],[12,34,54,3,43,32,6,4]]
    end
    Import()
function Plot()

    layout = Layout(title="Auger Electron Spectroscopy", autosize=true, #width=950,
                    #height=800,
                     margin=attr(l=65, r=50, b=65, t=90))
    data = i_f

    x = PlotlyJS.plot(data, layout)
    #y = PlotlyJS.plot(i_f, layout)
    #[x,y]

    end
    Plot()
function Shifting()
    i_f = 2 + [i_f]



    end
    Shifting()
