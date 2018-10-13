using Plots
using InspectDR

i = readlines("y.csv")
i_f = parse.(BigFloat, i)
#l = @layout(2)
plot(i_f, color = "red" ,background_color= "black",linewidth =0.5)
#plot(i_f, layout = 4)
############################################
j = readlines("test.csv")
j_f = parse.([Float64], j)
plot!(j_f ,background_color= "black",color = "yellow" , linewidth =0.5)#plot!(j_f,color = "red",layout = 2)
s = i_f - j_f
plot!([s], color ="blue")
