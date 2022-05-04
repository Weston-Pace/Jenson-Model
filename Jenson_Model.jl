# exec '/Users/westonpace/Desktop/Julia-1.6.app/Contents/Resources/julia/bin/julia'
using Plots
using DataFrames

function Basic_Velocity()
    One = []
    Two = []
    a = 0.1
    r = 5
    
    for i in 0:0.1:80
        Value = (1-(2/3)*((r)/(r+a*i))^(2))
        push!(One , Value)
        push!(Two , i)
    end
    plot(Two , One , xlabel = "Distance Behind Turbine" , ylabel = "v/u")
end

function Refined_Velocity()
    One = []
    Two = []
    Three = []
    Four = []
    Five = []
    Six = []
    a = 0.1
    r = 5
    x1 = r*16
    x2 = r*10
    x3 =r*6
    
    for i in -0.349:0.01:0.349
        Value = (1-(2/3)*((1+cos(9*i))/(2))*((r)/(r+a*x1))^(2))
        push!(One , Value)
        push!(Two , i*(180/(pi)))
    end

    for i in -0.349:0.01:0.349
        Value = (1-(2/3)*((1+cos(9*i))/(2))*((r)/(r+a*x2))^(2))
        push!(Three , Value)
        push!(Four , i*(180/(pi)))
    end

    for i in -0.349:0.01:0.349
        Value = (1-(2/3)*((1+cos(9*i))/(2))*((r)/(r+a*x3))^(2))
        push!(Five , Value)
        push!(Six , i*(180/(pi)))
    end

    plot(Two , One , xlabel = "\$\\Theta\$" , ylabel = "v/u" , labels = ["16r"])
    plot!(Four , Three , xlabel = "\$\\Theta\$" , ylabel = "v/u" , labels = ["10r"])
    plot!(Six , Five , xlabel = "\$\\Theta\$" , ylabel = "v/u" , labels = ["6r"])
end

function Behind_Turbines()
    One = [1.0]
    Two = [1.0]
    Three = [1.0]
    Four = [1.0]
    Five = [1.0]
    Six = [1.0]
    a = 0.1
    r = 5
    x1 = r*6
    x2 = r*10
    x3 = r*16
    u = 50
    Velocity1 = [float(u)]
    Velocity2 = [float(u)]
    Velocity3 = [float(u)]

    for i in 2:5
        Value = u*(1 - (1-(1/3)*((Velocity1[i-1])/(u)))*(r/(r+a*x1))^(2))
        push!(Velocity1, Value)
        push!(One , Value*(1/u))
        push!(Two, i)
    end

    for i in 2:5
        Value = u*(1 - (1-(1/3)*((Velocity2[i-1])/(u)))*(r/(r+a*x2))^(2))
        push!(Velocity2, Value)
        push!(Three , Value*(1/u))
        push!(Four, i)
    end

    for i in 2:5
        Value = u*(1 - (1-(1/3)*((Velocity3[i-1])/(u)))*(r/(r+a*x3))^(2))
        push!(Velocity3, Value)
        push!(Five , Value*(1/u))
        push!(Six, i)
    end

    scatter(Two, One, xlabel = "Turbine", ylabel = "Wind Approaching Turbine (v/u)", labels = "6r")
    scatter!(Four, Three, xlabel = "Turbine", ylabel = "Wind Approaching Turbine (v/u)", labels = "10r")
    scatter!(Six, Five, xlabel = "Turbine", ylabel = "Wind Approaching Turbine (v/u)", labels = "16r")
end

function Converging_value()
    values_list = []
    distance = []
    for i in 0:0.01:30
        value = (-(1/(1+0.1*i))^(2)+1)/(1-(1/3)*(1/(1+0.1*i))^(2))
        push!(values_list , value)
        push!(distance , i)
    end
    plot(distance , values_list , xlabel = "Distance Behind Turbine in Radius Length" , ylabel = "Converging Velocity Ratio")
end

function Circle_Organization()
    x = 36
    theta = [0.0]
    Place_Marker = 0.0
    radius = 100.0
    Turbines_X = []
    Turbines_Y = []
    r = 10
    a = 0.1
    for i in 1:10
        distance = sqrt((radius^2)+(radius^2)-2*radius*radius*cos(theta[i]))
        angle = (pi-theta[i])/2
        push!(Turbines_X , -100 + abs(distance*cos(angle)))
        push!(Turbines_Y , distance*sin(angle))
        push!(theta , x*(pi/180) + theta[i])
    end
    Turbine_1 = [Turbines_X[1], Turbines_Y[1]]
    Turbine_2 = [Turbines_X[2], Turbines_Y[2]]
    Turbine_3 = [Turbines_X[3], Turbines_Y[3]]
    Turbine_4 = [Turbines_X[4], Turbines_Y[4]]
    Turbine_5 = [Turbines_X[5], Turbines_Y[5]]
    Turbine_6 = [Turbines_X[6], Turbines_Y[6]]
    Turbine_7 = [Turbines_X[7], Turbines_Y[7]]
    Turbine_8 = [Turbines_X[8], Turbines_Y[8]]
    Turbine_9 = [Turbines_X[9], Turbines_Y[9]]
    Turbine_10 = [Turbines_X[10], Turbines_Y[10]]
    Velocity_List_1 = []
    Velocity_List_2 = []
    Velocity_List_3 = []
    Velocity_List_4 = []
    Velocity_List_5 = []
    Velocity_List_6 = []
    Velocity_List_7 = []
    Velocity_List_8 = []
    Velocity_List_9 = []
    Velocity_List_10 = []
    for i in (-x*(pi/180)*(1/2)):0.001:(x*(pi/180)*(1/2))
        line_1 = -0.1*Turbine_1[1]-tan(i)*Turbine_1[1]+Turbine_1[2]+ r*abs(cos(i))
        line_2 = 0.1*Turbine_1[1] - tan(i)*Turbine_1[1] + Turbine_1[2] - r*abs(cos(i))
        if Turbine_2[1] > Turbine_1[1]
            if (line_2 - 0.1*Turbine_2[1] + tan(i)*Turbine_2[1]) <= Turbine_2[2] <= (line_1 + 0.1*Turbine_2[1] + tan(i)*Turbine_2[1])
                if abs(atan((Turbine_2[2]-Turbine_1[2])/(Turbine_2[1]-Turbine_1[1])) - i) <= 0.349
                    delta_theta = abs(atan((Turbine_2[2]-Turbine_1[2])/(Turbine_2[1]-Turbine_1[1])) - i)
                else
                    delta_theta = 0.349
                end
                distance = sqrt((Turbine_2[2]-Turbine_1[2])^(2)+(Turbine_2[1]-Turbine_1[1])^(2))
                x_naught = distance/cos(abs(atan((Turbine_2[2]-Turbine_1[2])/(Turbine_2[1]-Turbine_1[1])) - i))
                Wind_Velocity = (1-(2/3)*((r)/(r+a*x_naught))^(2))
                push!(Velocity_List_1 , Wind_Velocity)
                
            else 
                push!(Velocity_List_1 , 0)
            end
        else 
            push!(Velocity_List_1 , 0)
        end
        if Turbine_3[1] > Turbine_1[1]
            if (line_2 - 0.1*Turbine_3[1] + tan(i)*Turbine_3[1]) <= Turbine_3[2] <= (line_1 + 0.1*Turbine_3[1] + tan(i)*Turbine_3[1])
                if abs(atan((Turbine_3[2]-Turbine_1[2])/(Turbine_3[1]-Turbine_1[1])) - i) <= 0.349
                    delta_theta = abs(atan((Turbine_3[2]-Turbine_1[2])/(Turbine_3[1]-Turbine_1[1])) - i)
                else
                    delta_theta = 0.349
                end
                distance = sqrt((Turbine_3[2]-Turbine_1[2])^(2)+(Turbine_3[1]-Turbine_1[1])^(2))
                x_naught = distance/cos(abs(atan((Turbine_3[2]-Turbine_1[2])/(Turbine_3[1]-Turbine_1[1])) - i))
                Wind_Velocity = (1-(2/3)*((r)/(r+a*x_naught))^(2))
                push!(Velocity_List_1 , Wind_Velocity)
            else 
                push!(Velocity_List_1 , 0)
            end
        else
            push!(Velocity_List_1 , 0)
        end
        if Turbine_4[1] > Turbine_1[1]
            if (line_2 - 0.1*Turbine_4[1] + tan(i)*Turbine_4[1]) <= Turbine_4[2] <= (line_1 + 0.1*Turbine_4[1] + tan(i)*Turbine_4[1])
                if abs(atan((Turbine_4[2]-Turbine_1[2])/(Turbine_4[1]-Turbine_1[1])) - i) <= 0.349
                    delta_theta = abs(atan((Turbine_4[2]-Turbine_1[2])/(Turbine_4[1]-Turbine_1[1])) - i)
                else
                    delta_theta = 0.349
                end
                distance = sqrt((Turbine_4[2]-Turbine_1[2])^(2)+(Turbine_4[1]-Turbine_1[1])^(2))
                x_naught = distance/cos(abs(atan((Turbine_4[2]-Turbine_1[2])/(Turbine_4[1]-Turbine_1[1])) - i))
                Wind_Velocity = (1-(2/3)*((r)/(r+a*x_naught))^(2))
                push!(Velocity_List_1 , Wind_Velocity)
            else 
                push!(Velocity_List_1 , 0)
            end
        else 
            push!(Velocity_List_1 , 0)
        end
        if Turbine_5[1] > Turbine_1[1]
            if (line_2 - 0.1*Turbine_5[1] + tan(i)*Turbine_5[1]) <= Turbine_5[2] <= (line_1 + 0.1*Turbine_5[1] + tan(i)*Turbine_5[1])
                if abs(atan((Turbine_5[2]-Turbine_1[2])/(Turbine_5[1]-Turbine_1[1])) - i) <= 0.349
                    delta_theta = abs(atan((Turbine_5[2]-Turbine_1[2])/(Turbine_5[1]-Turbine_1[1])) - i)
                else
                    delta_theta = 0.349
                end
                distance = sqrt((Turbine_5[2]-Turbine_1[2])^(2)+(Turbine_5[1]-Turbine_1[1])^(2))
                x_naught = distance/cos(abs(atan((Turbine_5[2]-Turbine_1[2])/(Turbine_5[1]-Turbine_1[1])) - i))
                Wind_Velocity = (1-(2/3)*((r)/(r+a*x_naught))^(2))
                push!(Velocity_List_1 , Wind_Velocity)
            else 
                push!(Velocity_List_1 , 0)
            end
        else
            push!(Velocity_List_1 , 0)
        end
        if Turbine_6[1] > Turbine_1[1]
            if (line_2 - 0.1*Turbine_6[1] + tan(i)*Turbine_6[1]) <= Turbine_6[2] <= (line_1 + 0.1*Turbine_6[1] + tan(i)*Turbine_6[1])
                if abs(atan((Turbine_6[2]-Turbine_1[2])/(Turbine_6[1]-Turbine_1[1])) - i) <= 0.349
                    delta_theta = abs(atan((Turbine_6[2]-Turbine_1[2])/(Turbine_6[1]-Turbine_1[1])) - i)
                else
                    delta_theta = 0.349
                end
                distance = sqrt((Turbine_6[2]-Turbine_1[2])^(2)+(Turbine_6[1]-Turbine_1[1])^(2))
                x_naught = distance/cos(abs(atan((Turbine_6[2]-Turbine_1[2])/(Turbine_6[1]-Turbine_1[1])) - i))
                Wind_Velocity = (1-(2/3)*((r)/(r+a*x_naught))^(2))
                push!(Velocity_List_1 , Wind_Velocity)
                
            else 
                push!(Velocity_List_1 , 0)
            end
        else
            push!(Velocity_List_1 , 0)
        end
        if Turbine_7[1] > Turbine_1[1]
            if (line_2 - 0.1*Turbine_7[1] + tan(i)*Turbine_7[1]) <= Turbine_7[2] <= (line_1 + 0.1*Turbine_7[1] + tan(i)*Turbine_7[1])
                if abs(atan((Turbine_7[2]-Turbine_1[2])/(Turbine_7[1]-Turbine_1[1])) - i) <= 0.349
                    delta_theta = abs(atan((Turbine_7[2]-Turbine_1[2])/(Turbine_7[1]-Turbine_1[1])) - i)
                else
                    delta_theta = 0.349
                end
                distance = sqrt((Turbine_7[2]-Turbine_1[2])^(2)+(Turbine_7[1]-Turbine_1[1])^(2))
                x_naught = distance/cos(abs(atan((Turbine_7[2]-Turbine_1[2])/(Turbine_7[1]-Turbine_1[1])) - i))
                Wind_Velocity = (1-(2/3)*((r)/(r+a*x_naught))^(2))
                push!(Velocity_List_1 , Wind_Velocity)
            else 
                push!(Velocity_List_1 , 0)
            end
        else
            push!(Velocity_List_1, 0)
        end
        if Turbine_8[1] > Turbine_1[1]
            if (line_2 - 0.1*Turbine_8[1] + tan(i)*Turbine_8[1]) <= Turbine_8[2] <= (line_1 + 0.1*Turbine_8[1] + tan(i)*Turbine_8[1])
                if abs(atan((Turbine_8[2]-Turbine_1[2])/(Turbine_8[1]-Turbine_1[1])) - i) <= 0.349
                    delta_theta = abs(atan((Turbine_8[2]-Turbine_1[2])/(Turbine_8[1]-Turbine_1[1])) - i) 
                else
                    delta_theta = 0.349
                end
                distance = sqrt((Turbine_8[2]-Turbine_1[2])^(2)+(Turbine_8[1]-Turbine_1[1])^(2))
                x_naught = distance/cos(abs(atan((Turbine_8[2]-Turbine_1[2])/(Turbine_8[1]-Turbine_1[1])) - i))
                Wind_Velocity = (1-(2/3)*((r)/(r+a*x_naught))^(2))
                push!(Velocity_List_1 , Wind_Velocity)
            else 
                push!(Velocity_List_1 , 0)
            end
        else
            push!(Velocity_List_1 , 0)
        end
        if Turbine_9[1] > Turbine_1[1]
            if (line_2 - 0.1*Turbine_9[1] + tan(i)*Turbine_9[1]) <= Turbine_9[2] <= (line_1 + 0.1*Turbine_9[1] + tan(i)*Turbine_9[1])
                if abs(atan((Turbine_9[2]-Turbine_1[2])/(Turbine_9[1]-Turbine_1[1])) - i) <= 0.349
                    delta_theta = abs(atan((Turbine_9[2]-Turbine_1[2])/(Turbine_9[1]-Turbine_1[1])) - i)
                else
                    delta_theta = 0.349
                end
                distance = sqrt((Turbine_9[2]-Turbine_1[2])^(2)+(Turbine_9[1]-Turbine_1[1])^(2))
                x_naught = distance/cos(abs(atan((Turbine_9[2]-Turbine_1[2])/(Turbine_9[1]-Turbine_1[1])) - i))
                Wind_Velocity = (1-(2/3)*((r)/(r+a*x_naught))^(2))
                push!(Velocity_List_1 , Wind_Velocity)
            else 
                push!(Velocity_List_1 , 0)
            end
        else
            push!(Velocity_List_1 , 0)
        end
        if Turbine_10[1] > Turbine_1[1]
            if (line_2 - 0.1*Turbine_10[1] + tan(i)*Turbine_10[1]) <= Turbine_10[2] <= (line_1 + 0.1*Turbine_10[1] + tan(i)*Turbine_10[1])
                if abs(atan((Turbine_10[2]-Turbine_1[2])/(Turbine_10[1]-Turbine_1[1])) - i) <= 0.349
                    delta_theta = abs(atan((Turbine_10[2]-Turbine_1[2])/(Turbine_10[1]-Turbine_1[1])) - i)
                else
                    delta_theta = 0.349
                end 
                distance = sqrt((Turbine_10[2]-Turbine_1[2])^(2)+(Turbine_10[1]-Turbine_1[1])^(2))
                x_naught = distance/cos(abs(atan((Turbine_10[2]-Turbine_1[2])/(Turbine_10[1]-Turbine_1[1])) - i))
                Wind_Velocity = (1-(2/3)*((r)/(r+a*x_naught))^(2))
                push!(Velocity_List_1 , Wind_Velocity)
            else 
                push!(Velocity_List_1 , 0)
            end
        else
            push!(Velocity_List_1 , 0)
        end
    end
    for i in (-x*(pi/180)*(1/2)):0.001:(x*(pi/180)*(1/2))
        line_1 = -0.1*Turbine_2[1]-tan(i)*Turbine_2[1]+Turbine_2[2]+ r*abs(cos(i))
        line_2 = 0.1*Turbine_2[1] - tan(i)*Turbine_2[1] + Turbine_2[2] - r*abs(cos(i))
        if Turbine_1[1] > Turbine_2[1]
            if (line_2 - 0.1*Turbine_1[1] + tan(i)*Turbine_1[1]) <= Turbine_1[2] <= (line_1 + 0.1*Turbine_1[1] + tan(i)*Turbine_1[1])
                if abs(atan((Turbine_1[2]-Turbine_2[2])/(Turbine_1[1]-Turbine_2[1])) - i) <= 0.349
                    delta_theta = abs(atan((Turbine_1[2]-Turbine_2[2])/(Turbine_1[1]-Turbine_2[1])) - i)
                else
                    delta_theta = 0.349
                end
                distance = sqrt((Turbine_1[2]-Turbine_2[2])^(2)+(Turbine_1[1]-Turbine_2[1])^(2))
                x_naught = distance/cos(abs(atan((Turbine_1[2]-Turbine_2[2])/(Turbine_1[1]-Turbine_2[1])) - i))
                Wind_Velocity = (1-(2/3)*((r)/(r+a*x_naught))^(2))
                push!(Velocity_List_2 , Wind_Velocity)
                
            else 
                push!(Velocity_List_2 , 0)
            end
        else 
            push!(Velocity_List_2 , 0)
        end
        if Turbine_3[1] > Turbine_2[1]
            if (line_2 - 0.1*Turbine_3[1] + tan(i)*Turbine_3[1]) <= Turbine_3[2] <= (line_1 + 0.1*Turbine_3[1] + tan(i)*Turbine_3[1])
                if abs(atan((Turbine_3[2]-Turbine_2[2])/(Turbine_3[1]-Turbine_2[1])) - i) <= 0.349
                    delta_theta = abs(atan((Turbine_3[2]-Turbine_2[2])/(Turbine_3[1]-Turbine_2[1])) - i)
                else
                    delta_theta = 0.349
                end
                distance = sqrt((Turbine_3[2]-Turbine_2[2])^(2)+(Turbine_3[1]-Turbine_2[1])^(2))
                x_naught = distance/cos(abs(atan((Turbine_3[2]-Turbine_2[2])/(Turbine_3[1]-Turbine_2[1])) - i))
                Wind_Velocity = (1-(2/3)*((r)/(r+a*x_naught))^(2))
                push!(Velocity_List_2 , Wind_Velocity)
                
            else 
                push!(Velocity_List_2 , 0)
            end
        else 
            push!(Velocity_List_2 , 0)
        end
        if Turbine_4[1] > Turbine_2[1]
            if (line_2 - 0.1*Turbine_4[1] + tan(i)*Turbine_4[1]) <= Turbine_4[2] <= (line_1 + 0.1*Turbine_4[1] + tan(i)*Turbine_4[1])
                if abs(atan((Turbine_4[2]-Turbine_2[2])/(Turbine_4[1]-Turbine_2[1])) - i) <= 0.349
                    delta_theta = abs(atan((Turbine_4[2]-Turbine_2[2])/(Turbine_4[1]-Turbine_2[1])) - i)
                else
                    delta_theta = 0.349
                end
                distance = sqrt((Turbine_4[2]-Turbine_2[2])^(2)+(Turbine_4[1]-Turbine_2[1])^(2))
                x_naught = distance/cos(abs(atan((Turbine_4[2]-Turbine_2[2])/(Turbine_4[1]-Turbine_2[1])) - i))
                Wind_Velocity = (1-(2/3)*((r)/(r+a*x_naught))^(2))
                push!(Velocity_List_2 , Wind_Velocity)
                
            else 
                push!(Velocity_List_2 , 0)
            end
        else 
            push!(Velocity_List_2 , 0)
        end
        if Turbine_5[1] > Turbine_2[1]
            if (line_2 - 0.1*Turbine_5[1] + tan(i)*Turbine_5[1]) <= Turbine_5[2] <= (line_1 + 0.1*Turbine_5[1] + tan(i)*Turbine_5[1])
                if abs(atan((Turbine_5[2]-Turbine_2[2])/(Turbine_5[1]-Turbine_2[1])) - i) <= 0.349
                    delta_theta = abs(atan((Turbine_5[2]-Turbine_2[2])/(Turbine_5[1]-Turbine_2[1])) - i)
                else
                    delta_theta = 0.349
                end
                distance = sqrt((Turbine_5[2]-Turbine_2[2])^(2)+(Turbine_5[1]-Turbine_2[1])^(2))
                x_naught = distance/cos(abs(atan((Turbine_5[2]-Turbine_2[2])/(Turbine_5[1]-Turbine_2[1])) - i))
                Wind_Velocity = (1-(2/3)*((r)/(r+a*x_naught))^(2))
                push!(Velocity_List_2 , Wind_Velocity)
                
            else 
                push!(Velocity_List_2 , 0)
            end
        else 
            push!(Velocity_List_2 , 0)
        end
        if Turbine_6[1] > Turbine_2[1]
            if (line_2 - 0.1*Turbine_6[1] + tan(i)*Turbine_6[1]) <= Turbine_6[2] <= (line_1 + 0.1*Turbine_6[1] + tan(i)*Turbine_6[1])
                if abs(atan((Turbine_6[2]-Turbine_2[2])/(Turbine_6[1]-Turbine_2[1])) - i) <= 0.349
                    delta_theta = abs(atan((Turbine_6[2]-Turbine_2[2])/(Turbine_6[1]-Turbine_2[1])) - i)
                else
                    delta_theta = 0.349
                end
                distance = sqrt((Turbine_6[2]-Turbine_2[2])^(2)+(Turbine_6[1]-Turbine_2[1])^(2))
                x_naught = distance/cos(abs(atan((Turbine_6[2]-Turbine_2[2])/(Turbine_6[1]-Turbine_2[1])) - i))
                Wind_Velocity = (1-(2/3)*((r)/(r+a*x_naught))^(2))
                push!(Velocity_List_2 , Wind_Velocity)
                
            else 
                push!(Velocity_List_2 , 0)
            end
        else 
            push!(Velocity_List_2 , 0)
        end
        if Turbine_7[1] > Turbine_2[1]
            if (line_2 - 0.1*Turbine_7[1] + tan(i)*Turbine_7[1]) <= Turbine_7[2] <= (line_1 + 0.1*Turbine_7[1] + tan(i)*Turbine_7[1])
                if abs(atan((Turbine_7[2]-Turbine_2[2])/(Turbine_7[1]-Turbine_2[1])) - i) <= 0.349
                    delta_theta = abs(atan((Turbine_7[2]-Turbine_2[2])/(Turbine_7[1]-Turbine_2[1])) - i)
                else
                    delta_theta = 0.349
                end
                distance = sqrt((Turbine_7[2]-Turbine_2[2])^(2)+(Turbine_7[1]-Turbine_2[1])^(2))
                x_naught = distance/cos(abs(atan((Turbine_7[2]-Turbine_2[2])/(Turbine_7[1]-Turbine_2[1])) - i))
                Wind_Velocity = (1-(2/3)*((r)/(r+a*x_naught))^(2))
                push!(Velocity_List_2 , Wind_Velocity)
                
            else 
                push!(Velocity_List_2 , 0)
            end
        else 
            push!(Velocity_List_2 , 0)
        end
        if Turbine_8[1] > Turbine_2[1]
            if (line_2 - 0.1*Turbine_8[1] + tan(i)*Turbine_8[1]) <= Turbine_8[2] <= (line_1 + 0.1*Turbine_8[1] + tan(i)*Turbine_8[1])
                if abs(atan((Turbine_8[2]-Turbine_2[2])/(Turbine_8[1]-Turbine_2[1])) - i) <= 0.349
                    delta_theta = abs(atan((Turbine_8[2]-Turbine_2[2])/(Turbine_8[1]-Turbine_2[1])) - i)
                else
                    delta_theta = 0.349
                end
                distance = sqrt((Turbine_8[2]-Turbine_2[2])^(2)+(Turbine_8[1]-Turbine_2[1])^(2))
                x_naught = distance/cos(abs(atan((Turbine_8[2]-Turbine_2[2])/(Turbine_8[1]-Turbine_2[1])) - i))
                Wind_Velocity = (1-(2/3)*((r)/(r+a*x_naught))^(2))
                push!(Velocity_List_2 , Wind_Velocity)
                
            else 
                push!(Velocity_List_2 , 0)
            end
        else 
            push!(Velocity_List_2 , 0)
        end
        if Turbine_9[1] > Turbine_2[1]
            if (line_2 - 0.1*Turbine_9[1] + tan(i)*Turbine_9[1]) <= Turbine_9[2] <= (line_1 + 0.1*Turbine_9[1] + tan(i)*Turbine_9[1])
                if abs(atan((Turbine_9[2]-Turbine_2[2])/(Turbine_9[1]-Turbine_2[1])) - i) <= 0.349
                    delta_theta = abs(atan((Turbine_9[2]-Turbine_2[2])/(Turbine_9[1]-Turbine_2[1])) - i)
                else
                    delta_theta = 0.349
                end
                distance = sqrt((Turbine_9[2]-Turbine_2[2])^(2)+(Turbine_9[1]-Turbine_2[1])^(2))
                x_naught = distance/cos(abs(atan((Turbine_9[2]-Turbine_2[2])/(Turbine_9[1]-Turbine_2[1])) - i))
                Wind_Velocity = (1-(2/3)*((r)/(r+a*x_naught))^(2))
                push!(Velocity_List_2 , Wind_Velocity)
                
            else 
                push!(Velocity_List_2 , 0)
            end
        else 
            push!(Velocity_List_2 , 0)
        end
        if Turbine_10[1] > Turbine_2[1]
            if (line_2 - 0.1*Turbine_10[1] + tan(i)*Turbine_10[1]) <= Turbine_10[2] <= (line_1 + 0.1*Turbine_10[1] + tan(i)*Turbine_10[1])
                if abs(atan((Turbine_10[2]-Turbine_2[2])/(Turbine_10[1]-Turbine_2[1])) - i) <= 0.349
                    delta_theta = abs(atan((Turbine_10[2]-Turbine_2[2])/(Turbine_10[1]-Turbine_2[1])) - i)
                else
                    delta_theta = 0.349
                end 
                distance = sqrt((Turbine_10[2]-Turbine_2[2])^(2)+(Turbine_10[1]-Turbine_2[1])^(2))
                x_naught = distance/cos(abs(atan((Turbine_10[2]-Turbine_2[2])/(Turbine_10[1]-Turbine_2[1])) - i))
                Wind_Velocity = (1-(2/3)*((r)/(r+a*x_naught))^(2))
                push!(Velocity_List_2 , Wind_Velocity)
                
            else 
                push!(Velocity_List_2 , 0)
            end
        else 
            push!(Velocity_List_2 , 0)
        end
    end
    for i in (-x*(pi/180)*(1/2)):0.001:(x*(pi/180)*(1/2))
        line_1 = -0.1*Turbine_3[1]-tan(i)*Turbine_3[1]+Turbine_3[2]+ r*abs(cos(i))
        line_2 = 0.1*Turbine_3[1] - tan(i)*Turbine_3[1] + Turbine_3[2] - r*abs(cos(i))
        if Turbine_1[1] > Turbine_3[1]
            if (line_2 - 0.1*Turbine_1[1] + tan(i)*Turbine_1[1]) <= Turbine_1[2] <= (line_1 + 0.1*Turbine_1[1] + tan(i)*Turbine_1[1])
                if abs(atan((Turbine_1[2]-Turbine_3[2])/(Turbine_1[1]-Turbine_3[1])) - i) <= 0.349
                    delta_theta = abs(atan((Turbine_1[2]-Turbine_3[2])/(Turbine_1[1]-Turbine_3[1])) - i)
                else
                    delta_theta = 0.349
                end
                distance = sqrt((Turbine_1[2]-Turbine_3[2])^(2)+(Turbine_1[1]-Turbine_3[1])^(2))
                x_naught = distance/cos(abs(atan((Turbine_1[2]-Turbine_3[2])/(Turbine_1[1]-Turbine_3[1])) - i))
                Wind_Velocity = (1-(2/3)*((r)/(r+a*x_naught))^(2))
                push!(Velocity_List_3 , Wind_Velocity)
                
            else 
                push!(Velocity_List_3 , 0)
            end
        else 
            push!(Velocity_List_3 , 0)
        end
        if Turbine_2[1] > Turbine_3[1]
            if (line_2 - 0.1*Turbine_2[1] + tan(i)*Turbine_2[1]) <= Turbine_2[2] <= (line_1 + 0.1*Turbine_2[1] + tan(i)*Turbine_2[1])
                if abs(atan((Turbine_2[2]-Turbine_3[2])/(Turbine_2[1]-Turbine_3[1])) - i) <= 0.349
                    delta_theta = abs(atan((Turbine_2[2]-Turbine_3[2])/(Turbine_2[1]-Turbine_3[1])) - i)
                else
                    delta_theta = 0.349
                end
                distance = sqrt((Turbine_2[2]-Turbine_3[2])^(2)+(Turbine_2[1]-Turbine_3[1])^(2))
                x_naught = distance/cos(abs(atan((Turbine_2[2]-Turbine_3[2])/(Turbine_2[1]-Turbine_3[1])) - i))
                Wind_Velocity = (1-(2/3)*((r)/(r+a*x_naught))^(2))
                push!(Velocity_List_3 , Wind_Velocity)
                
            else 
                push!(Velocity_List_3 , 0)
            end
        else 
            push!(Velocity_List_3 , 0)
        end
        if Turbine_4[1] > Turbine_3[1]
            if (line_2 - 0.1*Turbine_4[1] + tan(i)*Turbine_4[1]) <= Turbine_4[2] <= (line_1 + 0.1*Turbine_4[1] + tan(i)*Turbine_4[1])
                if abs(atan((Turbine_4[2]-Turbine_3[2])/(Turbine_4[1]-Turbine_3[1])) - i) <= 0.349
                    delta_theta = abs(atan((Turbine_4[2]-Turbine_3[2])/(Turbine_4[1]-Turbine_3[1])) - i)
                else
                    delta_theta = 0.349
                end
                distance = sqrt((Turbine_4[2]-Turbine_3[2])^(2)+(Turbine_4[1]-Turbine_3[1])^(2))
                x_naught = distance/cos(abs(atan((Turbine_4[2]-Turbine_3[2])/(Turbine_4[1]-Turbine_3[1])) - i))
                Wind_Velocity = (1-(2/3)*((r)/(r+a*x_naught))^(2))
                push!(Velocity_List_3 , Wind_Velocity)
                
            else 
                push!(Velocity_List_3 , 0)
            end
        else 
            push!(Velocity_List_3 , 0)
        end
        if Turbine_5[1] > Turbine_3[1]
            if (line_2 - 0.1*Turbine_5[1] + tan(i)*Turbine_5[1]) <= Turbine_5[2] <= (line_1 + 0.1*Turbine_5[1] + tan(i)*Turbine_5[1])
                if abs(atan((Turbine_5[2]-Turbine_3[2])/(Turbine_5[1]-Turbine_3[1])) - i) <= 0.349
                    delta_theta = abs(atan((Turbine_5[2]-Turbine_3[2])/(Turbine_5[1]-Turbine_3[1])) - i)
                else
                    delta_theta = 0.349
                end
                distance = sqrt((Turbine_5[2]-Turbine_3[2])^(2)+(Turbine_5[1]-Turbine_3[1])^(2))
                x_naught = distance/cos(abs(atan((Turbine_5[2]-Turbine_3[2])/(Turbine_5[1]-Turbine_3[1])) - i))
                Wind_Velocity = (1-(2/3)*((r)/(r+a*x_naught))^(2))
                push!(Velocity_List_3 , Wind_Velocity)
                
            else 
                push!(Velocity_List_3 , 0)
            end
        else 
            push!(Velocity_List_3 , 0)
        end
        if Turbine_6[1] > Turbine_3[1]
            if (line_2 - 0.1*Turbine_6[1] + tan(i)*Turbine_6[1]) <= Turbine_6[2] <= (line_1 + 0.1*Turbine_6[1] + tan(i)*Turbine_6[1])
                if abs(atan((Turbine_6[2]-Turbine_3[2])/(Turbine_6[1]-Turbine_3[1])) - i) <= 0.349
                    delta_theta = abs(atan((Turbine_6[2]-Turbine_3[2])/(Turbine_6[1]-Turbine_3[1])) - i)
                else
                    delta_theta = 0.349
                end
                distance = sqrt((Turbine_6[2]-Turbine_3[2])^(2)+(Turbine_6[1]-Turbine_3[1])^(2))
                x_naught = distance/cos(abs(atan((Turbine_6[2]-Turbine_3[2])/(Turbine_6[1]-Turbine_3[1])) - i))
                Wind_Velocity = (1-(2/3)*((r)/(r+a*x_naught))^(2))
                push!(Velocity_List_3 , Wind_Velocity)
                
            else 
                push!(Velocity_List_3 , 0)
            end
        else 
            push!(Velocity_List_3 , 0)
        end
        if Turbine_7[1] > Turbine_3[1]
            if (line_2 - 0.1*Turbine_7[1] + tan(i)*Turbine_7[1]) <= Turbine_7[2] <= (line_1 + 0.1*Turbine_7[1] + tan(i)*Turbine_7[1])
                if abs(atan((Turbine_7[2]-Turbine_3[2])/(Turbine_7[1]-Turbine_3[1])) - i) <= 0.349
                    delta_theta = abs(atan((Turbine_7[2]-Turbine_3[2])/(Turbine_7[1]-Turbine_3[1])) - i)
                else
                    delta_theta = 0.349
                end
                distance = sqrt((Turbine_7[2]-Turbine_3[2])^(2)+(Turbine_7[1]-Turbine_3[1])^(2))
                x_naught = distance/cos(abs(atan((Turbine_7[2]-Turbine_3[2])/(Turbine_7[1]-Turbine_3[1])) - i))
                Wind_Velocity = (1-(2/3)*((r)/(r+a*x_naught))^(2))
                push!(Velocity_List_3 , Wind_Velocity)
                
            else 
                push!(Velocity_List_3 , 0)
            end
        else 
            push!(Velocity_List_3 , 0)
        end
        if Turbine_8[1] > Turbine_3[1]
            if (line_2 - 0.1*Turbine_8[1] + tan(i)*Turbine_8[1]) <= Turbine_8[2] <= (line_1 + 0.1*Turbine_8[1] + tan(i)*Turbine_8[1])
                if abs(atan((Turbine_8[2]-Turbine_3[2])/(Turbine_8[1]-Turbine_3[1])) - i) <= 0.349
                    delta_theta = abs(atan((Turbine_8[2]-Turbine_3[2])/(Turbine_8[1]-Turbine_3[1])) - i)
                else
                    delta_theta = 0.349
                end
                distance = sqrt((Turbine_8[2]-Turbine_3[2])^(2)+(Turbine_8[1]-Turbine_3[1])^(2))
                x_naught = distance/cos(abs(atan((Turbine_8[2]-Turbine_3[2])/(Turbine_8[1]-Turbine_3[1])) - i))
                Wind_Velocity = (1-(2/3)*((r)/(r+a*x_naught))^(2))
                push!(Velocity_List_3 , Wind_Velocity)
                
            else 
                push!(Velocity_List_3 , 0)
            end
        else 
            push!(Velocity_List_3 , 0)
        end
        if Turbine_9[1] > Turbine_3[1]
            if (line_2 - 0.1*Turbine_9[1] + tan(i)*Turbine_9[1]) <= Turbine_9[2] <= (line_1 + 0.1*Turbine_9[1] + tan(i)*Turbine_9[1])
                if abs(atan((Turbine_9[2]-Turbine_3[2])/(Turbine_9[1]-Turbine_3[1])) - i) <= 0.349
                    delta_theta = abs(atan((Turbine_9[2]-Turbine_3[2])/(Turbine_9[1]-Turbine_3[1])) - i)
                else
                    delta_theta = 0.349
                end
                distance = sqrt((Turbine_9[2]-Turbine_3[2])^(2)+(Turbine_9[1]-Turbine_3[1])^(2))
                x_naught = distance/cos(abs(atan((Turbine_9[2]-Turbine_3[2])/(Turbine_9[1]-Turbine_3[1])) - i))
                Wind_Velocity = (1-(2/3)*((r)/(r+a*x_naught))^(2))
                push!(Velocity_List_3 , Wind_Velocity)
                
            else 
                push!(Velocity_List_3 , 0)
            end
        else 
            push!(Velocity_List_3 , 0)
        end
        if Turbine_10[1] > Turbine_3[1]
            if (line_2 - 0.1*Turbine_10[1] + tan(i)*Turbine_10[1]) <= Turbine_10[2] <= (line_1 + 0.1*Turbine_10[1] + tan(i)*Turbine_10[1])
                if abs(atan((Turbine_10[2]-Turbine_3[2])/(Turbine_10[1]-Turbine_3[1])) - i) <= 0.349
                    delta_theta = abs(atan((Turbine_10[2]-Turbine_3[2])/(Turbine_10[1]-Turbine_3[1])) - i)
                else
                    delta_theta = 0.349
                end
                distance = sqrt((Turbine_10[2]-Turbine_3[2])^(2)+(Turbine_10[1]-Turbine_3[1])^(2))
                x_naught = distance/cos(abs(atan((Turbine_10[2]-Turbine_3[2])/(Turbine_10[1]-Turbine_3[1])) - i))
                Wind_Velocity = (1-(2/3)*((r)/(r+a*x_naught))^(2))
                push!(Velocity_List_3 , Wind_Velocity)
                
            else 
                push!(Velocity_List_3 , 0)
            end
        else 
            push!(Velocity_List_3 , 0)
        end
    end
    for i in (-x*(pi/180)*(1/2)):0.001:(x*(pi/180)*(1/2))
        line_1 = -0.1*Turbine_4[1]-tan(i)*Turbine_4[1]+Turbine_4[2]+ r*abs(cos(i))
        line_2 = 0.1*Turbine_4[1] - tan(i)*Turbine_4[1] + Turbine_4[2] - r*abs(cos(i))
        if Turbine_1[1] > Turbine_4[1]
            if (line_2 - 0.1*Turbine_1[1] + tan(i)*Turbine_1[1]) <= Turbine_1[2] <= (line_1 + 0.1*Turbine_1[1] + tan(i)*Turbine_1[1])
                if abs(atan((Turbine_1[2]-Turbine_4[2])/(Turbine_1[1]-Turbine_4[1])) - i) <= 0.349
                    delta_theta = abs(atan((Turbine_1[2]-Turbine_4[2])/(Turbine_1[1]-Turbine_4[1])) - i)
                else
                    delta_theta = 0.349
                end
                distance = sqrt((Turbine_1[2]-Turbine_4[2])^(2)+(Turbine_1[1]-Turbine_4[1])^(2))
                x_naught = distance/cos(abs(atan((Turbine_1[2]-Turbine_4[2])/(Turbine_1[1]-Turbine_4[1])) - i))
                Wind_Velocity = (1-(2/3)*((r)/(r+a*x_naught))^(2))
                push!(Velocity_List_4 , Wind_Velocity)
                
            else 
                push!(Velocity_List_4 , 0)
            end
        else 
            push!(Velocity_List_4 , 0)
        end
        if Turbine_2[1] > Turbine_4[1]
            if (line_2 - 0.1*Turbine_2[1] + tan(i)*Turbine_2[1]) <= Turbine_2[2] <= (line_1 + 0.1*Turbine_2[1] + tan(i)*Turbine_2[1])
                if abs(atan((Turbine_2[2]-Turbine_4[2])/(Turbine_2[1]-Turbine_4[1])) - i) <= 0.349
                    delta_theta = abs(atan((Turbine_2[2]-Turbine_4[2])/(Turbine_2[1]-Turbine_4[1])) - i)
                else
                    delta_theta = 0.349
                end
                distance = sqrt((Turbine_2[2]-Turbine_4[2])^(2)+(Turbine_2[1]-Turbine_4[1])^(2))
                x_naught = distance/cos(abs(atan((Turbine_2[2]-Turbine_4[2])/(Turbine_2[1]-Turbine_4[1])) - i))
                Wind_Velocity = (1-(2/3)*((r)/(r+a*x_naught))^(2))
                push!(Velocity_List_4 , Wind_Velocity)
                
            else 
                push!(Velocity_List_4 , 0)
            end
        else 
            push!(Velocity_List_4 , 0)
        end
        if Turbine_3[1] > Turbine_4[1]
            if (line_2 - 0.1*Turbine_3[1] + tan(i)*Turbine_3[1]) <= Turbine_3[2] <= (line_1 + 0.1*Turbine_3[1] + tan(i)*Turbine_3[1])
                if abs(atan((Turbine_3[2]-Turbine_4[2])/(Turbine_3[1]-Turbine_4[1])) - i) <= 0.349
                    delta_theta = abs(atan((Turbine_3[2]-Turbine_4[2])/(Turbine_3[1]-Turbine_4[1])) - i)
                else
                    delta_theta = 0.349
                end
                distance = sqrt((Turbine_3[2]-Turbine_4[2])^(2)+(Turbine_3[1]-Turbine_4[1])^(2))
                x_naught = distance/cos(abs(atan((Turbine_3[2]-Turbine_4[2])/(Turbine_3[1]-Turbine_4[1])) - i))
                Wind_Velocity = (1-(2/3)*((r)/(r+a*x_naught))^(2))
                push!(Velocity_List_4 , Wind_Velocity)
                
            else 
                push!(Velocity_List_4 , 0)
            end
        else 
            push!(Velocity_List_4 , 0)
        end
        if Turbine_5[1] > Turbine_4[1]
            if (line_2 - 0.1*Turbine_5[1] + tan(i)*Turbine_5[1]) <= Turbine_5[2] <= (line_1 + 0.1*Turbine_5[1] + tan(i)*Turbine_5[1])
                if abs(atan((Turbine_5[2]-Turbine_4[2])/(Turbine_5[1]-Turbine_4[1])) - i) <= 0.349
                    delta_theta = abs(atan((Turbine_5[2]-Turbine_4[2])/(Turbine_5[1]-Turbine_4[1])) - i)
                else
                    delta_theta = 0.349
                end
                distance = sqrt((Turbine_5[2]-Turbine_4[2])^(2)+(Turbine_5[1]-Turbine_4[1])^(2))
                x_naught = distance/cos(abs(atan((Turbine_5[2]-Turbine_4[2])/(Turbine_5[1]-Turbine_4[1])) - i))
                Wind_Velocity = (1-(2/3)*((r)/(r+a*x_naught))^(2))
                push!(Velocity_List_4 , Wind_Velocity)
                
            else 
                push!(Velocity_List_4 , 0)
            end
        else 
            push!(Velocity_List_4 , 0)
        end
        if Turbine_6[1] > Turbine_4[1]
            if (line_2 - 0.1*Turbine_6[1] + tan(i)*Turbine_6[1]) <= Turbine_6[2] <= (line_1 + 0.1*Turbine_6[1] + tan(i)*Turbine_6[1])
                if abs(atan((Turbine_6[2]-Turbine_4[2])/(Turbine_6[1]-Turbine_4[1])) - i) <= 0.349
                    delta_theta = abs(atan((Turbine_6[2]-Turbine_4[2])/(Turbine_6[1]-Turbine_4[1])) - i)
                else
                    delta_theta = 0.349
                end
                distance = sqrt((Turbine_6[2]-Turbine_4[2])^(2)+(Turbine_6[1]-Turbine_4[1])^(2))
                x_naught = distance/cos(abs(atan((Turbine_6[2]-Turbine_4[2])/(Turbine_6[1]-Turbine_4[1])) - i))
                Wind_Velocity = (1-(2/3)*((r)/(r+a*x_naught))^(2))
                push!(Velocity_List_4 , Wind_Velocity)
                
            else 
                push!(Velocity_List_4 , 0)
            end
        else 
            push!(Velocity_List_4 , 0)
        end
        if Turbine_7[1] > Turbine_4[1]
            if (line_2 - 0.1*Turbine_7[1] + tan(i)*Turbine_7[1]) <= Turbine_7[2] <= (line_1 + 0.1*Turbine_7[1] + tan(i)*Turbine_7[1])
                if abs(atan((Turbine_7[2]-Turbine_4[2])/(Turbine_7[1]-Turbine_4[1])) - i) <= 0.349
                    delta_theta = abs(atan((Turbine_7[2]-Turbine_4[2])/(Turbine_7[1]-Turbine_4[1])) - i)
                else
                    delta_theta = 0.349
                end
                distance = sqrt((Turbine_7[2]-Turbine_4[2])^(2)+(Turbine_7[1]-Turbine_4[1])^(2))
                x_naught = distance/cos(abs(atan((Turbine_7[2]-Turbine_4[2])/(Turbine_7[1]-Turbine_4[1])) - i))
                Wind_Velocity = (1-(2/3)*((r)/(r+a*x_naught))^(2))
                push!(Velocity_List_4 , Wind_Velocity)
                
            else 
                push!(Velocity_List_4 , 0)
            end
        else 
            push!(Velocity_List_4 , 0)
        end
        if Turbine_8[1] > Turbine_4[1]
            if (line_2 - 0.1*Turbine_8[1] + tan(i)*Turbine_8[1]) <= Turbine_8[2] <= (line_1 + 0.1*Turbine_8[1] + tan(i)*Turbine_8[1])
                if abs(atan((Turbine_8[2]-Turbine_4[2])/(Turbine_8[1]-Turbine_4[1])) - i) <= 0.349
                    delta_theta = abs(atan((Turbine_8[2]-Turbine_4[2])/(Turbine_8[1]-Turbine_4[1])) - i)
                else
                    delta_theta = 0.349
                end
                distance = sqrt((Turbine_8[2]-Turbine_4[2])^(2)+(Turbine_8[1]-Turbine_4[1])^(2))
                x_naught = distance/cos(abs(atan((Turbine_8[2]-Turbine_4[2])/(Turbine_8[1]-Turbine_4[1])) - i))
                Wind_Velocity = (1-(2/3)*((r)/(r+a*x_naught))^(2))
                push!(Velocity_List_4 , Wind_Velocity)
                
            else 
                push!(Velocity_List_4 , 0)
            end
        else 
            push!(Velocity_List_4 , 0)
        end
        if Turbine_9[1] > Turbine_4[1]
            if (line_2 - 0.1*Turbine_9[1] + tan(i)*Turbine_9[1]) <= Turbine_9[2] <= (line_1 + 0.1*Turbine_9[1] + tan(i)*Turbine_9[1])
                if abs(atan((Turbine_9[2]-Turbine_4[2])/(Turbine_9[1]-Turbine_4[1])) - i) <= 0.349
                    delta_theta = abs(atan((Turbine_9[2]-Turbine_4[2])/(Turbine_9[1]-Turbine_4[1])) - i)
                else
                    delta_theta = 0.349
                end
                distance = sqrt((Turbine_9[2]-Turbine_4[2])^(2)+(Turbine_9[1]-Turbine_4[1])^(2))
                x_naught = distance/cos(abs(atan((Turbine_9[2]-Turbine_4[2])/(Turbine_9[1]-Turbine_4[1])) - i))
                Wind_Velocity = (1-(2/3)*((r)/(r+a*x_naught))^(2))
                push!(Velocity_List_4 , Wind_Velocity)
                
            else 
                push!(Velocity_List_4 , 0)
            end
        else 
            push!(Velocity_List_4 , 0)
        end
        if Turbine_10[1] > Turbine_4[1]
            if (line_2 - 0.1*Turbine_10[1] + tan(i)*Turbine_10[1]) <= Turbine_10[2] <= (line_1 + 0.1*Turbine_10[1] + tan(i)*Turbine_10[1])
                if abs(atan((Turbine_10[2]-Turbine_4[2])/(Turbine_10[1]-Turbine_4[1])) - i)  <= 0.349
                    delta_theta = abs(atan((Turbine_10[2]-Turbine_4[2])/(Turbine_10[1]-Turbine_4[1])) - i)
                else
                    delta_theta = 0.349
                end
                distance = sqrt((Turbine_10[2]-Turbine_4[2])^(2)+(Turbine_10[1]-Turbine_4[1])^(2))
                x_naught = distance/cos(abs(atan((Turbine_10[2]-Turbine_4[2])/(Turbine_10[1]-Turbine_4[1])) - i))
                Wind_Velocity = (1-(2/3)*((r)/(r+a*x_naught))^(2))
                push!(Velocity_List_4 , Wind_Velocity)
                
            else 
                push!(Velocity_List_4 , 0)
            end
        else 
            push!(Velocity_List_4 , 0)
        end
    end
    for i in (-x*(pi/180)*(1/2)):0.001:(x*(pi/180)*(1/2))
        line_1 = -0.1*Turbine_5[1]-tan(i)*Turbine_5[1]+Turbine_5[2]+ r*abs(cos(i))
        line_2 = 0.1*Turbine_5[1] - tan(i)*Turbine_5[1] + Turbine_5[2] - r*abs(cos(i))
        if Turbine_1[1] > Turbine_5[1]
            if (line_2 - 0.1*Turbine_1[1] + tan(i)*Turbine_1[1]) <= Turbine_1[2] <= (line_1 + 0.1*Turbine_1[1] + tan(i)*Turbine_1[1])
                if abs(atan((Turbine_1[2]-Turbine_5[2])/(Turbine_1[1]-Turbine_5[1])) - i) <= 0.349
                    delta_theta = abs(atan((Turbine_1[2]-Turbine_5[2])/(Turbine_1[1]-Turbine_5[1])) - i)
                else
                    delta_theta = 0.349
                end
                distance = sqrt((Turbine_1[2]-Turbine_5[2])^(2)+(Turbine_1[1]-Turbine_5[1])^(2))
                x_naught = distance/cos(abs(atan((Turbine_1[2]-Turbine_5[2])/(Turbine_1[1]-Turbine_5[1])) - i))
                Wind_Velocity = (1-(2/3)*((r)/(r+a*x_naught))^(2))
                push!(Velocity_List_5 , Wind_Velocity)
                
            else 
                push!(Velocity_List_5 , 0)
            end
        else 
            push!(Velocity_List_5 , 0)
        end
        if Turbine_2[1] > Turbine_5[1]
            if (line_2 - 0.1*Turbine_2[1] + tan(i)*Turbine_2[1]) <= Turbine_2[2] <= (line_1 + 0.1*Turbine_2[1] + tan(i)*Turbine_2[1])
                if abs(atan((Turbine_2[2]-Turbine_5[2])/(Turbine_2[1]-Turbine_5[1])) - i) <= 0.349
                    delta_theta = abs(atan((Turbine_2[2]-Turbine_5[2])/(Turbine_2[1]-Turbine_5[1])) - i)
                else
                    delta_theta = 0.349
                end
                distance = sqrt((Turbine_2[2]-Turbine_5[2])^(2)+(Turbine_2[1]-Turbine_5[1])^(2))
                x_naught = distance/cos(abs(atan((Turbine_2[2]-Turbine_5[2])/(Turbine_2[1]-Turbine_5[1])) - i))
                Wind_Velocity = (1-(2/3)*((r)/(r+a*x_naught))^(2))
                push!(Velocity_List_5 , Wind_Velocity)
                
            else 
                push!(Velocity_List_5 , 0)
            end
        else 
            push!(Velocity_List_5 , 0)
        end
        if Turbine_3[1] > Turbine_5[1]
            if (line_2 - 0.1*Turbine_3[1] + tan(i)*Turbine_3[1]) <= Turbine_3[2] <= (line_1 + 0.1*Turbine_3[1] + tan(i)*Turbine_3[1])
                if abs(atan((Turbine_3[2]-Turbine_5[2])/(Turbine_3[1]-Turbine_5[1])) - i) <= 0.349
                    delta_theta = abs(atan((Turbine_3[2]-Turbine_5[2])/(Turbine_3[1]-Turbine_5[1])) - i)
                else
                    delta_theta = 0.349
                end
                distance = sqrt((Turbine_3[2]-Turbine_5[2])^(2)+(Turbine_3[1]-Turbine_5[1])^(2))
                x_naught = distance/cos(abs(atan((Turbine_3[2]-Turbine_5[2])/(Turbine_3[1]-Turbine_5[1])) - i))
                Wind_Velocity = (1-(2/3)*((r)/(r+a*x_naught))^(2))
                push!(Velocity_List_5 , Wind_Velocity)
                
            else 
                push!(Velocity_List_5 , 0)
            end
        else 
            push!(Velocity_List_5 , 0)
        end
        if Turbine_4[1] > Turbine_5[1]
            if (line_2 - 0.1*Turbine_4[1] + tan(i)*Turbine_4[1]) <= Turbine_4[2] <= (line_1 + 0.1*Turbine_4[1] + tan(i)*Turbine_4[1])
                if abs(atan((Turbine_4[2]-Turbine_5[2])/(Turbine_4[1]-Turbine_5[1])) - i) <= 0.349
                    delta_theta = abs(atan((Turbine_4[2]-Turbine_5[2])/(Turbine_4[1]-Turbine_5[1])) - i)
                else
                    delta_theta = 0.349
                end
                distance = sqrt((Turbine_4[2]-Turbine_5[2])^(2)+(Turbine_4[1]-Turbine_5[1])^(2))
                x_naught = distance/cos(abs(atan((Turbine_4[2]-Turbine_5[2])/(Turbine_4[1]-Turbine_5[1])) - i))
                Wind_Velocity = (1-(2/3)*((r)/(r+a*x_naught))^(2))
                push!(Velocity_List_5 , Wind_Velocity)
                
            else 
                push!(Velocity_List_5 , 0)
            end
        else 
            push!(Velocity_List_5 , 0)
        end
        if Turbine_6[1] > Turbine_5[1]
            if (line_2 - 0.1*Turbine_6[1] + tan(i)*Turbine_6[1]) <= Turbine_6[2] <= (line_1 + 0.1*Turbine_6[1] + tan(i)*Turbine_6[1])
                if abs(atan((Turbine_6[2]-Turbine_5[2])/(Turbine_6[1]-Turbine_5[1])) - i) <= 0.349
                    delta_theta = abs(atan((Turbine_6[2]-Turbine_5[2])/(Turbine_6[1]-Turbine_5[1])) - i)
                else
                    delta_theta = 0.349
                end
                distance = sqrt((Turbine_6[2]-Turbine_5[2])^(2)+(Turbine_6[1]-Turbine_5[1])^(2))
                x_naught = distance/cos(abs(atan((Turbine_6[2]-Turbine_5[2])/(Turbine_6[1]-Turbine_5[1])) - i))
                Wind_Velocity = (1-(2/3)*((r)/(r+a*x_naught))^(2))
                push!(Velocity_List_5 , Wind_Velocity)
                
            else 
                push!(Velocity_List_5 , 0)
            end
        else 
            push!(Velocity_List_5 , 0)
        end
        if Turbine_7[1] > Turbine_5[1]
            if (line_2 - 0.1*Turbine_7[1] + tan(i)*Turbine_7[1]) <= Turbine_7[2] <= (line_1 + 0.1*Turbine_7[1] + tan(i)*Turbine_7[1])
                if abs(atan((Turbine_7[2]-Turbine_5[2])/(Turbine_7[1]-Turbine_5[1])) - i) <= 0.349
                    delta_theta = abs(atan((Turbine_7[2]-Turbine_5[2])/(Turbine_7[1]-Turbine_5[1])) - i)
                else
                    delta_theta = 0.349
                end
                distance = sqrt((Turbine_7[2]-Turbine_5[2])^(2)+(Turbine_7[1]-Turbine_5[1])^(2))
                x_naught = distance/cos(abs(atan((Turbine_7[2]-Turbine_5[2])/(Turbine_7[1]-Turbine_5[1])) - i))
                Wind_Velocity = (1-(2/3)*((r)/(r+a*x_naught))^(2))
                push!(Velocity_List_5 , Wind_Velocity)
                
            else 
                push!(Velocity_List_5 , 0)
            end
        else 
            push!(Velocity_List_5 , 0)
        end
        if Turbine_8[1] > Turbine_5[1]
            if (line_2 - 0.1*Turbine_8[1] + tan(i)*Turbine_8[1]) <= Turbine_8[2] <= (line_1 + 0.1*Turbine_8[1] + tan(i)*Turbine_8[1])
                if abs(atan((Turbine_8[2]-Turbine_5[2])/(Turbine_8[1]-Turbine_5[1])) - i) <= 0.349
                    delta_theta = abs(atan((Turbine_8[2]-Turbine_5[2])/(Turbine_8[1]-Turbine_5[1])) - i)
                else
                    delta_theta = 0.349
                end
                distance = sqrt((Turbine_8[2]-Turbine_5[2])^(2)+(Turbine_8[1]-Turbine_5[1])^(2))
                x_naught = distance/cos(abs(atan((Turbine_8[2]-Turbine_5[2])/(Turbine_8[1]-Turbine_5[1])) - i))
                Wind_Velocity = (1-(2/3)*((r)/(r+a*x_naught))^(2))
                push!(Velocity_List_5 , Wind_Velocity)
                
            else 
                push!(Velocity_List_5 , 0)
            end
        else 
            push!(Velocity_List_5 , 0)
        end
        if Turbine_9[1] > Turbine_5[1]
            if (line_2 - 0.1*Turbine_9[1] + tan(i)*Turbine_9[1]) <= Turbine_9[2] <= (line_1 + 0.1*Turbine_9[1] + tan(i)*Turbine_9[1])
                if abs(atan((Turbine_9[2]-Turbine_5[2])/(Turbine_9[1]-Turbine_5[1])) - i) <= 0.349
                    delta_theta = abs(atan((Turbine_9[2]-Turbine_5[2])/(Turbine_9[1]-Turbine_5[1])) - i)
                else
                    delta_theta = 0.349
                end
                distance = sqrt((Turbine_9[2]-Turbine_5[2])^(2)+(Turbine_9[1]-Turbine_5[1])^(2))
                x_naught = distance/cos(abs(atan((Turbine_9[2]-Turbine_5[2])/(Turbine_9[1]-Turbine_5[1])) - i))
                Wind_Velocity = (1-(2/3)*((r)/(r+a*x_naught))^(2))
                push!(Velocity_List_5 , Wind_Velocity)
                
            else 
                push!(Velocity_List_5 , 0)
            end
        else 
            push!(Velocity_List_5 , 0)
        end
        if Turbine_10[1] > Turbine_5[1]
            if (line_2 - 0.1*Turbine_10[1] + tan(i)*Turbine_10[1]) <= Turbine_10[2] <= (line_1 + 0.1*Turbine_10[1] + tan(i)*Turbine_10[1])
                if abs(atan((Turbine_10[2]-Turbine_5[2])/(Turbine_10[1]-Turbine_5[1])) - i)  <= 0.349
                    delta_theta = abs(atan((Turbine_10[2]-Turbine_5[2])/(Turbine_10[1]-Turbine_5[1])) - i)
                else
                    delta_theta = 0.349
                end 
                distance = sqrt((Turbine_10[2]-Turbine_5[2])^(2)+(Turbine_10[1]-Turbine_5[1])^(2))
                x_naught = distance/cos(abs(atan((Turbine_10[2]-Turbine_5[2])/(Turbine_10[1]-Turbine_5[1])) - i))
                Wind_Velocity = (1-(2/3)*((r)/(r+a*x_naught))^(2))
                push!(Velocity_List_5 , Wind_Velocity)
                
            else 
                push!(Velocity_List_5 , 0)
            end
        else 
            push!(Velocity_List_5 , 0)
        end
    end
    for i in (-x*(pi/180)*(1/2)):0.001:(x*(pi/180)*(1/2))
        line_1 = -0.1*Turbine_6[1]-tan(i)*Turbine_6[1]+Turbine_6[2]+ r*abs(cos(i))
        line_2 = 0.1*Turbine_6[1] - tan(i)*Turbine_6[1] + Turbine_6[2] - r*abs(cos(i))
        if Turbine_1[1] > Turbine_6[1]
            if (line_2 - 0.1*Turbine_1[1] + tan(i)*Turbine_1[1]) <= Turbine_1[2] <= (line_1 + 0.1*Turbine_1[1] + tan(i)*Turbine_1[1])
                if abs(atan((Turbine_1[2]-Turbine_6[2])/(Turbine_1[1]-Turbine_6[1])) - i) <= 0.349
                    delta_theta = abs(atan((Turbine_1[2]-Turbine_6[2])/(Turbine_1[1]-Turbine_6[1])) - i)
                else
                    delta_theta = 0.349
                end
                distance = sqrt((Turbine_1[2]-Turbine_6[2])^(2)+(Turbine_1[1]-Turbine_6[1])^(2))
                x_naught = distance/cos(abs(atan((Turbine_1[2]-Turbine_6[2])/(Turbine_1[1]-Turbine_6[1])) - i))
                Wind_Velocity = (1-(2/3)*((r)/(r+a*x_naught))^(2))
                push!(Velocity_List_6 , Wind_Velocity)
                
            else 
                push!(Velocity_List_6 , 0)
            end
        else 
            push!(Velocity_List_6 , 0)
        end
        if Turbine_2[1] > Turbine_6[1]
            if (line_2 - 0.1*Turbine_2[1] + tan(i)*Turbine_2[1]) <= Turbine_2[2] <= (line_1 + 0.1*Turbine_2[1] + tan(i)*Turbine_2[1])
                if abs(atan((Turbine_2[2]-Turbine_6[2])/(Turbine_2[1]-Turbine_6[1])) - i) <= 0.349
                    delta_theta = abs(atan((Turbine_2[2]-Turbine_6[2])/(Turbine_2[1]-Turbine_6[1])) - i)
                else
                    delta_theta = 0.349
                end
                distance = sqrt((Turbine_2[2]-Turbine_6[2])^(2)+(Turbine_2[1]-Turbine_6[1])^(2))
                x_naught = distance/cos(abs(atan((Turbine_2[2]-Turbine_6[2])/(Turbine_2[1]-Turbine_6[1])) - i))
                Wind_Velocity = (1-(2/3)*((r)/(r+a*x_naught))^(2))
                push!(Velocity_List_6 , Wind_Velocity)
                
            else 
                push!(Velocity_List_6 , 0)
            end
        else 
            push!(Velocity_List_6 , 0)
        end
        if Turbine_3[1] > Turbine_6[1]
            if (line_2 - 0.1*Turbine_3[1] + tan(i)*Turbine_3[1]) <= Turbine_3[2] <= (line_1 + 0.1*Turbine_3[1] + tan(i)*Turbine_3[1])
                if abs(atan((Turbine_3[2]-Turbine_6[2])/(Turbine_3[1]-Turbine_6[1])) - i) <= 0.349
                    delta_theta = abs(atan((Turbine_3[2]-Turbine_6[2])/(Turbine_3[1]-Turbine_6[1])) - i)
                else
                    delta_theta = 0.349
                end
                distance = sqrt((Turbine_3[2]-Turbine_6[2])^(2)+(Turbine_3[1]-Turbine_6[1])^(2))
                x_naught = distance/cos(abs(atan((Turbine_3[2]-Turbine_6[2])/(Turbine_3[1]-Turbine_6[1])) - i))
                Wind_Velocity = (1-(2/3)*((r)/(r+a*x_naught))^(2))
                push!(Velocity_List_6 , Wind_Velocity)
                
            else 
                push!(Velocity_List_6 , 0)
            end
        else 
            push!(Velocity_List_6 , 0)
        end
        if Turbine_4[1] > Turbine_6[1]
            if (line_2 - 0.1*Turbine_4[1] + tan(i)*Turbine_4[1]) <= Turbine_4[2] <= (line_1 + 0.1*Turbine_4[1] + tan(i)*Turbine_4[1])
                if abs(atan((Turbine_4[2]-Turbine_6[2])/(Turbine_4[1]-Turbine_6[1])) - i) <= 0.349
                    delta_theta = abs(atan((Turbine_4[2]-Turbine_6[2])/(Turbine_4[1]-Turbine_6[1])) - i)
                else
                    delta_theta = 0.349
                end
                distance = sqrt((Turbine_4[2]-Turbine_6[2])^(2)+(Turbine_4[1]-Turbine_6[1])^(2))
                x_naught = distance/cos(abs(atan((Turbine_4[2]-Turbine_6[2])/(Turbine_4[1]-Turbine_6[1])) - i))
                Wind_Velocity = (1-(2/3)*((r)/(r+a*x_naught))^(2))
                push!(Velocity_List_6 , Wind_Velocity)
                
            else 
                push!(Velocity_List_6 , 0)
            end
        else 
            push!(Velocity_List_6 , 0)
        end
        if Turbine_5[1] > Turbine_6[1]
            if (line_2 - 0.1*Turbine_5[1] + tan(i)*Turbine_5[1]) <= Turbine_5[2] <= (line_1 + 0.1*Turbine_5[1] + tan(i)*Turbine_5[1])
                if abs(atan((Turbine_5[2]-Turbine_6[2])/(Turbine_5[1]-Turbine_6[1])) - i) <= 0.349
                    delta_theta = abs(atan((Turbine_5[2]-Turbine_6[2])/(Turbine_5[1]-Turbine_6[1])) - i)
                else
                    delta_theta = 0.349
                end
                distance = sqrt((Turbine_5[2]-Turbine_6[2])^(2)+(Turbine_5[1]-Turbine_6[1])^(2))
                x_naught = distance/cos(abs(atan((Turbine_5[2]-Turbine_6[2])/(Turbine_5[1]-Turbine_6[1])) - i))
                Wind_Velocity = (1-(2/3)*((r)/(r+a*x_naught))^(2))
                push!(Velocity_List_6 , Wind_Velocity)
                
            else 
                push!(Velocity_List_6 , 0)
            end
        else 
            push!(Velocity_List_6 , 0)
        end
        if Turbine_7[1] > Turbine_6[1]
            if (line_2 - 0.1*Turbine_7[1] + tan(i)*Turbine_7[1]) <= Turbine_7[2] <= (line_1 + 0.1*Turbine_7[1] + tan(i)*Turbine_7[1])
                if abs(atan((Turbine_7[2]-Turbine_6[2])/(Turbine_7[1]-Turbine_6[1])) - i) <= 0.349
                    delta_theta = abs(atan((Turbine_7[2]-Turbine_6[2])/(Turbine_7[1]-Turbine_6[1])) - i)
                else
                    delta_theta = 0.349
                end
                distance = sqrt((Turbine_7[2]-Turbine_6[2])^(2)+(Turbine_7[1]-Turbine_6[1])^(2))
                x_naught = distance/cos(abs(atan((Turbine_7[2]-Turbine_6[2])/(Turbine_7[1]-Turbine_6[1])) - i))
                Wind_Velocity = (1-(2/3)*((r)/(r+a*x_naught))^(2))
                push!(Velocity_List_6 , Wind_Velocity)
                
            else 
                push!(Velocity_List_6 , 0)
            end
        else 
            push!(Velocity_List_6 , 0)
        end
        if Turbine_8[1] > Turbine_6[1]
            if (line_2 - 0.1*Turbine_8[1] + tan(i)*Turbine_8[1]) <= Turbine_8[2] <= (line_1 + 0.1*Turbine_8[1] + tan(i)*Turbine_8[1])
                if abs(atan((Turbine_8[2]-Turbine_6[2])/(Turbine_8[1]-Turbine_6[1])) - i) <= 0.349
                    delta_theta = abs(atan((Turbine_8[2]-Turbine_6[2])/(Turbine_8[1]-Turbine_6[1])) - i)
                else
                    delta_theta = 0.349
                end
                distance = sqrt((Turbine_8[2]-Turbine_6[2])^(2)+(Turbine_8[1]-Turbine_6[1])^(2))
                x_naught = distance/cos(abs(atan((Turbine_8[2]-Turbine_6[2])/(Turbine_8[1]-Turbine_6[1])) - i))
                Wind_Velocity = (1-(2/3)*((r)/(r+a*x_naught))^(2))
                push!(Velocity_List_6 , Wind_Velocity)
                
            else 
                push!(Velocity_List_6 , 0)
            end
        else 
            push!(Velocity_List_6 , 0)
        end
        if Turbine_9[1] > Turbine_6[1]
            if (line_2 - 0.1*Turbine_9[1] + tan(i)*Turbine_9[1]) <= Turbine_9[2] <= (line_1 + 0.1*Turbine_9[1] + tan(i)*Turbine_9[1])
                if abs(atan((Turbine_9[2]-Turbine_6[2])/(Turbine_9[1]-Turbine_6[1])) - i) <= 0.349
                    delta_theta = abs(atan((Turbine_9[2]-Turbine_6[2])/(Turbine_9[1]-Turbine_6[1])) - i)
                else
                    delta_theta = 0.349
                end
                distance = sqrt((Turbine_9[2]-Turbine_6[2])^(2)+(Turbine_9[1]-Turbine_6[1])^(2))
                x_naught = distance/cos(abs(atan((Turbine_9[2]-Turbine_6[2])/(Turbine_9[1]-Turbine_6[1])) - i))
                Wind_Velocity = (1-(2/3)*((r)/(r+a*x_naught))^(2))
                push!(Velocity_List_6 , Wind_Velocity)
                
            else 
                push!(Velocity_List_6 , 0)
            end
        else 
            push!(Velocity_List_6 , 0)
        end
        if Turbine_10[1] > Turbine_6[1]
            if (line_2 - 0.1*Turbine_10[1] + tan(i)*Turbine_10[1]) <= Turbine_10[2] <= (line_1 + 0.1*Turbine_10[1] + tan(i)*Turbine_10[1])
                if abs(atan((Turbine_10[2]-Turbine_6[2])/(Turbine_10[1]-Turbine_6[1])) - i)  <= 0.349
                    delta_theta = abs(atan((Turbine_10[2]-Turbine_6[2])/(Turbine_10[1]-Turbine_6[1])) - i)
                else
                    delta_theta = 0.349
                end 
                distance = sqrt((Turbine_10[2]-Turbine_6[2])^(2)+(Turbine_10[1]-Turbine_6[1])^(2))
                x_naught = distance/cos(abs(atan((Turbine_10[2]-Turbine_6[2])/(Turbine_10[1]-Turbine_6[1])) - i))
                Wind_Velocity = (1-(2/3)*((r)/(r+a*x_naught))^(2))
                push!(Velocity_List_6 , Wind_Velocity)
                
            else 
                push!(Velocity_List_6 , 0)
            end
        else 
            push!(Velocity_List_6 , 0)
        end
    end
    for i in (-x*(pi/180)*(1/2)):0.001:(x*(pi/180)*(1/2))
        line_1 = -0.1*Turbine_7[1]-tan(i)*Turbine_7[1]+Turbine_7[2]+ r*abs(cos(i))
        line_2 = 0.1*Turbine_7[1] - tan(i)*Turbine_7[1] + Turbine_7[2] - r*abs(cos(i))
        if Turbine_1[1] > Turbine_7[1]
            if (line_2 - 0.1*Turbine_1[1] + tan(i)*Turbine_1[1]) <= Turbine_1[2] <= (line_1 + 0.1*Turbine_1[1] + tan(i)*Turbine_1[1])
                if abs(atan((Turbine_1[2]-Turbine_7[2])/(Turbine_1[1]-Turbine_7[1])) - i) <= 0.349
                    delta_theta = abs(atan((Turbine_1[2]-Turbine_7[2])/(Turbine_1[1]-Turbine_7[1])) - i)
                else
                    delta_theta = 0.349
                end
                distance = sqrt((Turbine_1[2]-Turbine_7[2])^(2)+(Turbine_1[1]-Turbine_7[1])^(2))
                x_naught = distance/cos(abs(atan((Turbine_1[2]-Turbine_7[2])/(Turbine_1[1]-Turbine_7[1])) - i))
                Wind_Velocity = (1-(2/3)*((r)/(r+a*x_naught))^(2))
                push!(Velocity_List_7 , Wind_Velocity)
                
            else 
                push!(Velocity_List_7 , 0)
            end
        else 
            push!(Velocity_List_7 , 0)
        end
        if Turbine_2[1] > Turbine_7[1]
            if (line_2 - 0.1*Turbine_2[1] + tan(i)*Turbine_2[1]) <= Turbine_2[2] <= (line_1 + 0.1*Turbine_2[1] + tan(i)*Turbine_2[1])
                if abs(atan((Turbine_2[2]-Turbine_7[2])/(Turbine_2[1]-Turbine_7[1])) - i) <= 0.349
                    delta_theta = abs(atan((Turbine_2[2]-Turbine_7[2])/(Turbine_2[1]-Turbine_7[1])) - i)
                else
                    delta_theta = 0.349
                end
                distance = sqrt((Turbine_2[2]-Turbine_7[2])^(2)+(Turbine_2[1]-Turbine_7[1])^(2))
                x_naught = distance/cos(abs(atan((Turbine_2[2]-Turbine_7[2])/(Turbine_2[1]-Turbine_7[1])) - i))
                Wind_Velocity = (1-(2/3)*((r)/(r+a*x_naught))^(2))
                push!(Velocity_List_7 , Wind_Velocity)
                
            else 
                push!(Velocity_List_7 , 0)
            end
        else 
            push!(Velocity_List_7 , 0)
        end
        if Turbine_3[1] > Turbine_7[1]
            if (line_2 - 0.1*Turbine_3[1] + tan(i)*Turbine_3[1]) <= Turbine_3[2] <= (line_1 + 0.1*Turbine_3[1] + tan(i)*Turbine_3[1])
                if abs(atan((Turbine_3[2]-Turbine_7[2])/(Turbine_3[1]-Turbine_7[1])) - i) <= 0.349
                    delta_theta = abs(atan((Turbine_3[2]-Turbine_7[2])/(Turbine_3[1]-Turbine_7[1])) - i)
                else
                    delta_theta = 0.349
                end
                distance = sqrt((Turbine_3[2]-Turbine_7[2])^(2)+(Turbine_3[1]-Turbine_7[1])^(2))
                x_naught = distance/cos(abs(atan((Turbine_3[2]-Turbine_7[2])/(Turbine_3[1]-Turbine_7[1])) - i))
                Wind_Velocity = (1-(2/3)*((r)/(r+a*x_naught))^(2))
                push!(Velocity_List_7 , Wind_Velocity)
                
            else 
                push!(Velocity_List_7 , 0)
            end
        else 
            push!(Velocity_List_7 , 0)
        end
        if Turbine_4[1] > Turbine_7[1]
            if (line_2 - 0.1*Turbine_4[1] + tan(i)*Turbine_4[1]) <= Turbine_4[2] <= (line_1 + 0.1*Turbine_4[1] + tan(i)*Turbine_4[1])
                if abs(atan((Turbine_4[2]-Turbine_7[2])/(Turbine_4[1]-Turbine_7[1])) - i) <= 0.349
                    delta_theta = abs(atan((Turbine_4[2]-Turbine_7[2])/(Turbine_4[1]-Turbine_7[1])) - i)
                else
                    delta_theta = 0.349
                end
                distance = sqrt((Turbine_4[2]-Turbine_7[2])^(2)+(Turbine_4[1]-Turbine_7[1])^(2))
                x_naught = distance/cos(abs(atan((Turbine_4[2]-Turbine_7[2])/(Turbine_4[1]-Turbine_7[1])) - i))
                Wind_Velocity = (1-(2/3)*((r)/(r+a*x_naught))^(2))
                push!(Velocity_List_7 , Wind_Velocity)
                
            else 
                push!(Velocity_List_7 , 0)
            end
        else 
            push!(Velocity_List_7 , 0)
        end
        if Turbine_5[1] > Turbine_7[1]
            if (line_2 - 0.1*Turbine_5[1] + tan(i)*Turbine_5[1]) <= Turbine_5[2] <= (line_1 + 0.1*Turbine_5[1] + tan(i)*Turbine_5[1])
                if abs(atan((Turbine_5[2]-Turbine_7[2])/(Turbine_5[1]-Turbine_7[1])) - i) <= 0.349
                    delta_theta = abs(atan((Turbine_5[2]-Turbine_7[2])/(Turbine_5[1]-Turbine_7[1])) - i)
                else
                    delta_theta = 0.349
                end
                distance = sqrt((Turbine_5[2]-Turbine_7[2])^(2)+(Turbine_5[1]-Turbine_7[1])^(2))
                x_naught = distance/cos(abs(atan((Turbine_5[2]-Turbine_7[2])/(Turbine_5[1]-Turbine_7[1])) - i))
                Wind_Velocity = (1-(2/3)*((r)/(r+a*x_naught))^(2))
                push!(Velocity_List_7 , Wind_Velocity)
                
            else 
                push!(Velocity_List_7 , 0)
            end
        else 
            push!(Velocity_List_7 , 0)
        end
        if Turbine_6[1] > Turbine_7[1]
            if (line_2 - 0.1*Turbine_6[1] + tan(i)*Turbine_6[1]) <= Turbine_6[2] <= (line_1 + 0.1*Turbine_6[1] + tan(i)*Turbine_6[1])
                if abs(atan((Turbine_6[2]-Turbine_7[2])/(Turbine_6[1]-Turbine_7[1])) - i) <= 0.349
                    delta_theta = abs(atan((Turbine_6[2]-Turbine_7[2])/(Turbine_6[1]-Turbine_7[1])) - i)
                else
                    delta_theta = 0.349
                end
                distance = sqrt((Turbine_6[2]-Turbine_7[2])^(2)+(Turbine_6[1]-Turbine_7[1])^(2))
                x_naught = distance/cos(abs(atan((Turbine_6[2]-Turbine_7[2])/(Turbine_6[1]-Turbine_7[1])) - i))
                Wind_Velocity = (1-(2/3)*((r)/(r+a*x_naught))^(2))
                push!(Velocity_List_7 , Wind_Velocity)
                
            else 
                push!(Velocity_List_7 , 0)
            end
        else 
            push!(Velocity_List_7 , 0)
        end
        if Turbine_8[1] > Turbine_7[1]
            if (line_2 - 0.1*Turbine_8[1] + tan(i)*Turbine_8[1]) <= Turbine_8[2] <= (line_1 + 0.1*Turbine_8[1] + tan(i)*Turbine_8[1])
                if abs(atan((Turbine_8[2]-Turbine_7[2])/(Turbine_8[1]-Turbine_7[1])) - i) <= 0.349
                    delta_theta = abs(atan((Turbine_8[2]-Turbine_7[2])/(Turbine_8[1]-Turbine_7[1])) - i)
                else
                    delta_theta = 0.349
                end
                distance = sqrt((Turbine_8[2]-Turbine_7[2])^(2)+(Turbine_8[1]-Turbine_7[1])^(2))
                x_naught = distance/cos(abs(atan((Turbine_8[2]-Turbine_7[2])/(Turbine_8[1]-Turbine_7[1])) - i))
                Wind_Velocity = (1-(2/3)*((r)/(r+a*x_naught))^(2))
                push!(Velocity_List_7 , Wind_Velocity)
                
            else 
                push!(Velocity_List_7 , 0)
            end
        else 
            push!(Velocity_List_7 , 0)
        end
        if Turbine_9[1] > Turbine_7[1]
            if (line_2 - 0.1*Turbine_9[1] + tan(i)*Turbine_9[1]) <= Turbine_9[2] <= (line_1 + 0.1*Turbine_9[1] + tan(i)*Turbine_9[1])
                if abs(atan((Turbine_9[2]-Turbine_7[2])/(Turbine_9[1]-Turbine_7[1])) - i) <= 0.349
                    delta_theta = abs(atan((Turbine_9[2]-Turbine_7[2])/(Turbine_9[1]-Turbine_7[1])) - i)
                else
                    delta_theta = 0.349
                end
                distance = sqrt((Turbine_9[2]-Turbine_7[2])^(2)+(Turbine_9[1]-Turbine_7[1])^(2))
                x_naught = distance/cos(abs(atan((Turbine_9[2]-Turbine_7[2])/(Turbine_9[1]-Turbine_7[1])) - i))
                Wind_Velocity = (1-(2/3)*((r)/(r+a*x_naught))^(2))
                push!(Velocity_List_7 , Wind_Velocity)
                
            else 
                push!(Velocity_List_7 , 0)
            end
        else 
            push!(Velocity_List_7 , 0)
        end
        if Turbine_10[1] > Turbine_7[1]
            if (line_2 - 0.1*Turbine_10[1] + tan(i)*Turbine_10[1]) <= Turbine_10[2] <= (line_1 + 0.1*Turbine_10[1] + tan(i)*Turbine_10[1])
                if abs(atan((Turbine_10[2]-Turbine_7[2])/(Turbine_10[1]-Turbine_7[1])) - i) <= 0.349
                    delta_theta = abs(atan((Turbine_10[2]-Turbine_7[2])/(Turbine_10[1]-Turbine_7[1])) - i)
                else
                    delta_theta = 0.349
                end
                distance = sqrt((Turbine_10[2]-Turbine_7[2])^(2)+(Turbine_10[1]-Turbine_7[1])^(2))
                x_naught = distance/cos(abs(atan((Turbine_10[2]-Turbine_7[2])/(Turbine_10[1]-Turbine_7[1])) - i))
                Wind_Velocity = (1-(2/3)*((r)/(r+a*x_naught))^(2))
                push!(Velocity_List_7 , Wind_Velocity)
                
            else 
                push!(Velocity_List_7 , 0)
            end
        else 
            push!(Velocity_List_7 , 0)
        end
    end
    for i in (-x*(pi/180)*(1/2)):0.001:(x*(pi/180)*(1/2))
        line_1 = -0.1*Turbine_8[1]-tan(i)*Turbine_8[1]+Turbine_8[2]+ r*abs(cos(i))
        line_2 = 0.1*Turbine_8[1] - tan(i)*Turbine_8[1] + Turbine_8[2] - r*abs(cos(i))
        if Turbine_1[1] > Turbine_8[1]
            if (line_2 - 0.1*Turbine_1[1] + tan(i)*Turbine_1[1]) <= Turbine_1[2] <= (line_1 + 0.1*Turbine_1[1] + tan(i)*Turbine_1[1])
                if abs(atan((Turbine_1[2]-Turbine_8[2])/(Turbine_1[1]-Turbine_8[1])) - i) <= 0.349
                    delta_theta = abs(atan((Turbine_1[2]-Turbine_8[2])/(Turbine_1[1]-Turbine_8[1])) - i)
                else
                    delta_theta = 0.349
                end
                distance = sqrt((Turbine_1[2]-Turbine_8[2])^(2)+(Turbine_1[1]-Turbine_8[1])^(2))
                x_naught = distance/cos(abs(atan((Turbine_1[2]-Turbine_8[2])/(Turbine_1[1]-Turbine_8[1])) - i))
                Wind_Velocity = (1-(2/3)*((r)/(r+a*x_naught))^(2))
                push!(Velocity_List_8 , Wind_Velocity)
                
            else 
                push!(Velocity_List_8 , 0)
            end
        else 
            push!(Velocity_List_8 , 0)
        end
        if Turbine_2[1] > Turbine_8[1]
            if (line_2 - 0.1*Turbine_2[1] + tan(i)*Turbine_2[1]) <= Turbine_2[2] <= (line_1 + 0.1*Turbine_2[1] + tan(i)*Turbine_2[1])
                if abs(atan((Turbine_2[2]-Turbine_8[2])/(Turbine_2[1]-Turbine_8[1])) - i) <= 0.349
                    delta_theta = abs(atan((Turbine_2[2]-Turbine_8[2])/(Turbine_2[1]-Turbine_8[1])) - i)
                else
                    delta_theta = 0.349
                end
                distance = sqrt((Turbine_2[2]-Turbine_8[2])^(2)+(Turbine_2[1]-Turbine_8[1])^(2))
                x_naught = distance/cos(abs(atan((Turbine_2[2]-Turbine_8[2])/(Turbine_2[1]-Turbine_8[1])) - i))
                Wind_Velocity = (1-(2/3)*((r)/(r+a*x_naught))^(2))
                push!(Velocity_List_8 , Wind_Velocity)
                
            else 
                push!(Velocity_List_8 , 0)
            end
        else 
            push!(Velocity_List_8 , 0)
        end
        if Turbine_3[1] > Turbine_8[1]
            if (line_2 - 0.1*Turbine_3[1] + tan(i)*Turbine_3[1]) <= Turbine_3[2] <= (line_1 + 0.1*Turbine_3[1] + tan(i)*Turbine_3[1])
                if abs(atan((Turbine_3[2]-Turbine_8[2])/(Turbine_3[1]-Turbine_8[1])) - i) <= 0.349
                    delta_theta = abs(atan((Turbine_3[2]-Turbine_8[2])/(Turbine_3[1]-Turbine_8[1])) - i)
                else
                    delta_theta = 0.349
                end
                distance = sqrt((Turbine_3[2]-Turbine_8[2])^(2)+(Turbine_3[1]-Turbine_8[1])^(2))
                x_naught = distance/cos(abs(atan((Turbine_3[2]-Turbine_8[2])/(Turbine_3[1]-Turbine_8[1])) - i))
                Wind_Velocity = (1-(2/3)*((r)/(r+a*x_naught))^(2))
                push!(Velocity_List_8 , Wind_Velocity)
                
            else 
                push!(Velocity_List_8 , 0)
            end
        else 
            push!(Velocity_List_8 , 0)
        end
        if Turbine_4[1] > Turbine_8[1]
            if (line_2 - 0.1*Turbine_4[1] + tan(i)*Turbine_4[1]) <= Turbine_4[2] <= (line_1 + 0.1*Turbine_4[1] + tan(i)*Turbine_4[1])
                if abs(atan((Turbine_4[2]-Turbine_8[2])/(Turbine_4[1]-Turbine_8[1])) - i) <= 0.349
                    delta_theta = abs(atan((Turbine_4[2]-Turbine_8[2])/(Turbine_4[1]-Turbine_8[1])) - i)
                else
                    delta_theta = 0.349
                end
                distance = sqrt((Turbine_4[2]-Turbine_8[2])^(2)+(Turbine_4[1]-Turbine_8[1])^(2))
                x_naught = distance/cos(abs(atan((Turbine_4[2]-Turbine_8[2])/(Turbine_4[1]-Turbine_8[1])) - i))
                Wind_Velocity = (1-(2/3)*((r)/(r+a*x_naught))^(2))
                push!(Velocity_List_8 , Wind_Velocity)
                
            else 
                push!(Velocity_List_8 , 0)
            end
        else 
            push!(Velocity_List_8 , 0)
        end
        if Turbine_5[1] > Turbine_8[1]
            if (line_2 - 0.1*Turbine_5[1] + tan(i)*Turbine_5[1]) <= Turbine_5[2] <= (line_1 + 0.1*Turbine_5[1] + tan(i)*Turbine_5[1])
                if abs(atan((Turbine_5[2]-Turbine_8[2])/(Turbine_5[1]-Turbine_8[1])) - i) <= 0.349
                    delta_theta = abs(atan((Turbine_5[2]-Turbine_8[2])/(Turbine_5[1]-Turbine_8[1])) - i)
                else
                    delta_theta = 0.349
                end
                distance = sqrt((Turbine_5[2]-Turbine_8[2])^(2)+(Turbine_5[1]-Turbine_8[1])^(2))
                x_naught = distance/cos(abs(atan((Turbine_5[2]-Turbine_8[2])/(Turbine_5[1]-Turbine_8[1])) - i))
                Wind_Velocity = (1-(2/3)*((r)/(r+a*x_naught))^(2))
                push!(Velocity_List_8 , Wind_Velocity)
                
            else 
                push!(Velocity_List_8 , 0)
            end
        else 
            push!(Velocity_List_8 , 0)
        end
        if Turbine_6[1] > Turbine_8[1]
            if (line_2 - 0.1*Turbine_6[1] + tan(i)*Turbine_6[1]) <= Turbine_6[2] <= (line_1 + 0.1*Turbine_6[1] + tan(i)*Turbine_6[1])
                if abs(atan((Turbine_6[2]-Turbine_8[2])/(Turbine_6[1]-Turbine_8[1])) - i) <= 0.349
                    delta_theta = abs(atan((Turbine_6[2]-Turbine_8[2])/(Turbine_6[1]-Turbine_8[1])) - i)
                else
                    delta_theta = 0.349
                end
                distance = sqrt((Turbine_6[2]-Turbine_8[2])^(2)+(Turbine_6[1]-Turbine_8[1])^(2))
                x_naught = distance/cos(abs(atan((Turbine_6[2]-Turbine_8[2])/(Turbine_6[1]-Turbine_8[1])) - i))
                Wind_Velocity = (1-(2/3)*((r)/(r+a*x_naught))^(2))
                push!(Velocity_List_8 , Wind_Velocity)
                
            else 
                push!(Velocity_List_8 , 0)
            end
        else 
            push!(Velocity_List_8 , 0)
        end
        if Turbine_7[1] > Turbine_8[1]
            if (line_2 - 0.1*Turbine_7[1] + tan(i)*Turbine_7[1]) <= Turbine_7[2] <= (line_1 + 0.1*Turbine_7[1] + tan(i)*Turbine_7[1])
                if abs(atan((Turbine_7[2]-Turbine_8[2])/(Turbine_7[1]-Turbine_8[1])) - i) <= 0.349
                    delta_theta = abs(atan((Turbine_7[2]-Turbine_8[2])/(Turbine_7[1]-Turbine_8[1])) - i)
                else
                    delta_theta = 0.349
                end
                distance = sqrt((Turbine_7[2]-Turbine_8[2])^(2)+(Turbine_7[1]-Turbine_8[1])^(2))
                x_naught = distance/cos(abs(atan((Turbine_7[2]-Turbine_8[2])/(Turbine_7[1]-Turbine_8[1])) - i))
                Wind_Velocity = (1-(2/3)*((r)/(r+a*x_naught))^(2))
                push!(Velocity_List_8 , Wind_Velocity)
                
            else 
                push!(Velocity_List_8 , 0)
            end
        else 
            push!(Velocity_List_8 , 0)
        end
        if Turbine_9[1] > Turbine_8[1]
            if (line_2 - 0.1*Turbine_9[1] + tan(i)*Turbine_9[1]) <= Turbine_9[2] <= (line_1 + 0.1*Turbine_9[1] + tan(i)*Turbine_9[1])
                if abs(atan((Turbine_9[2]-Turbine_8[2])/(Turbine_9[1]-Turbine_8[1])) - i) <= 0.349
                    delta_theta = abs(atan((Turbine_9[2]-Turbine_8[2])/(Turbine_9[1]-Turbine_8[1])) - i)
                else
                    delta_theta = 0.349
                end
                distance = sqrt((Turbine_9[2]-Turbine_8[2])^(2)+(Turbine_9[1]-Turbine_8[1])^(2))
                x_naught = distance/cos(abs(atan((Turbine_9[2]-Turbine_8[2])/(Turbine_9[1]-Turbine_8[1])) - i))
                Wind_Velocity = (1-(2/3)*((r)/(r+a*x_naught))^(2))
                push!(Velocity_List_8 , Wind_Velocity)
                
            else 
                push!(Velocity_List_8 , 0)
            end
        else 
            push!(Velocity_List_8 , 0)
        end
        if Turbine_10[1] > Turbine_8[1]
            if (line_2 - 0.1*Turbine_10[1] + tan(i)*Turbine_10[1]) <= Turbine_10[2] <= (line_1 + 0.1*Turbine_10[1] + tan(i)*Turbine_10[1])
                if abs(atan((Turbine_10[2]-Turbine_8[2])/(Turbine_10[1]-Turbine_8[1])) - i) <= 0.349
                    delta_theta = abs(atan((Turbine_10[2]-Turbine_8[2])/(Turbine_10[1]-Turbine_8[1])) - i)
                else
                    delta_theta = 0.349
                end
                distance = sqrt((Turbine_10[2]-Turbine_8[2])^(2)+(Turbine_10[1]-Turbine_8[1])^(2))
                x_naught = distance/cos(abs(atan((Turbine_10[2]-Turbine_8[2])/(Turbine_10[1]-Turbine_8[1])) - i))
                Wind_Velocity = (1-(2/3)*((r)/(r+a*x_naught))^(2))
                push!(Velocity_List_8 , Wind_Velocity)
                
            else 
                push!(Velocity_List_8 , 0)
            end
        else 
            push!(Velocity_List_8 , 0)
        end
    end
    for i in (-x*(pi/180)*(1/2)):0.001:(x*(pi/180)*(1/2))
        line_1 = -0.1*Turbine_9[1]-tan(i)*Turbine_9[1]+Turbine_9[2]+ r*abs(cos(i))
        line_2 = 0.1*Turbine_9[1] - tan(i)*Turbine_9[1] + Turbine_9[2] - r*abs(cos(i))
        if Turbine_1[1] > Turbine_9[1]
            if (line_2 - 0.1*Turbine_1[1] + tan(i)*Turbine_1[1]) <= Turbine_1[2] <= (line_1 + 0.1*Turbine_1[1] + tan(i)*Turbine_1[1])
                if abs(atan((Turbine_1[2]-Turbine_9[2])/(Turbine_1[1]-Turbine_9[1])) - i) <= 0.349
                    delta_theta = abs(atan((Turbine_1[2]-Turbine_9[2])/(Turbine_1[1]-Turbine_9[1])) - i)
                else
                    delta_theta = 0.349
                end
                distance = sqrt((Turbine_1[2]-Turbine_9[2])^(2)+(Turbine_1[1]-Turbine_9[1])^(2))
                x_naught = distance/cos(abs(atan((Turbine_1[2]-Turbine_9[2])/(Turbine_1[1]-Turbine_9[1])) - i))
                Wind_Velocity = (1-(2/3)*((r)/(r+a*x_naught))^(2))
                push!(Velocity_List_9 , Wind_Velocity)
                
            else 
                push!(Velocity_List_9 , 0)
            end
        else 
            push!(Velocity_List_9 , 0)
        end
        if Turbine_2[1] > Turbine_9[1]
            if (line_2 - 0.1*Turbine_2[1] + tan(i)*Turbine_2[1]) <= Turbine_2[2] <= (line_1 + 0.1*Turbine_2[1] + tan(i)*Turbine_2[1])
                if abs(atan((Turbine_2[2]-Turbine_9[2])/(Turbine_2[1]-Turbine_9[1])) - i) <= 0.349
                    delta_theta = abs(atan((Turbine_2[2]-Turbine_9[2])/(Turbine_2[1]-Turbine_9[1])) - i)
                else
                    delta_theta = 0.349
                end
                distance = sqrt((Turbine_2[2]-Turbine_9[2])^(2)+(Turbine_2[1]-Turbine_9[1])^(2))
                x_naught = distance/cos(abs(atan((Turbine_2[2]-Turbine_9[2])/(Turbine_2[1]-Turbine_9[1])) - i))
                Wind_Velocity = (1-(2/3)*((r)/(r+a*x_naught))^(2))
                push!(Velocity_List_9 , Wind_Velocity)
                
            else 
                push!(Velocity_List_9 , 0)
            end
        else 
            push!(Velocity_List_9 , 0)
        end
        if Turbine_3[1] > Turbine_9[1]
            if (line_2 - 0.1*Turbine_3[1] + tan(i)*Turbine_3[1]) <= Turbine_3[2] <= (line_1 + 0.1*Turbine_3[1] + tan(i)*Turbine_3[1])
                if abs(atan((Turbine_3[2]-Turbine_9[2])/(Turbine_3[1]-Turbine_9[1])) - i) <= 0.349
                    delta_theta = abs(atan((Turbine_3[2]-Turbine_9[2])/(Turbine_3[1]-Turbine_9[1])) - i)
                else
                    delta_theta = 0.349
                end
                distance = sqrt((Turbine_3[2]-Turbine_9[2])^(2)+(Turbine_3[1]-Turbine_9[1])^(2))
                x_naught = distance/cos(abs(atan((Turbine_3[2]-Turbine_9[2])/(Turbine_3[1]-Turbine_9[1])) - i))
                Wind_Velocity = (1-(2/3)*((r)/(r+a*x_naught))^(2))
                push!(Velocity_List_9 , Wind_Velocity)
                
            else 
                push!(Velocity_List_9 , 0)
            end
        else 
            push!(Velocity_List_9 , 0)
        end
        if Turbine_4[1] > Turbine_9[1]
            if (line_2 - 0.1*Turbine_4[1] + tan(i)*Turbine_4[1]) <= Turbine_4[2] <= (line_1 + 0.1*Turbine_4[1] + tan(i)*Turbine_4[1])
                if abs(atan((Turbine_4[2]-Turbine_9[2])/(Turbine_4[1]-Turbine_9[1])) - i) <= 0.349
                    delta_theta = abs(atan((Turbine_4[2]-Turbine_9[2])/(Turbine_4[1]-Turbine_9[1])) - i)
                else
                    delta_theta = 0.349
                end
                distance = sqrt((Turbine_4[2]-Turbine_9[2])^(2)+(Turbine_4[1]-Turbine_9[1])^(2))
                x_naught = distance/cos(abs(atan((Turbine_4[2]-Turbine_9[2])/(Turbine_4[1]-Turbine_9[1])) - i))
                Wind_Velocity = (1-(2/3)*((r)/(r+a*x_naught))^(2))
                push!(Velocity_List_9 , Wind_Velocity)
                
            else 
                push!(Velocity_List_9 , 0)
            end
        else 
            push!(Velocity_List_9 , 0)
        end
        if Turbine_5[1] > Turbine_9[1]
            if (line_2 - 0.1*Turbine_5[1] + tan(i)*Turbine_5[1]) <= Turbine_5[2] <= (line_1 + 0.1*Turbine_5[1] + tan(i)*Turbine_5[1])
                if abs(atan((Turbine_5[2]-Turbine_9[2])/(Turbine_5[1]-Turbine_9[1])) - i) <= 0.349
                    delta_theta = abs(atan((Turbine_5[2]-Turbine_9[2])/(Turbine_5[1]-Turbine_9[1])) - i)
                else
                    delta_theta = 0.349
                end
                distance = sqrt((Turbine_5[2]-Turbine_9[2])^(2)+(Turbine_5[1]-Turbine_9[1])^(2))
                x_naught = distance/cos(abs(atan((Turbine_5[2]-Turbine_9[2])/(Turbine_5[1]-Turbine_9[1])) - i))
                Wind_Velocity = (1-(2/3)*((r)/(r+a*x_naught))^(2))
                push!(Velocity_List_9 , Wind_Velocity)
                
            else 
                push!(Velocity_List_9 , 0)
            end
        else 
            push!(Velocity_List_9 , 0)
        end
        if Turbine_6[1] > Turbine_9[1]
            if (line_2 - 0.1*Turbine_6[1] + tan(i)*Turbine_6[1]) <= Turbine_6[2] <= (line_1 + 0.1*Turbine_6[1] + tan(i)*Turbine_6[1])
                if abs(atan((Turbine_6[2]-Turbine_9[2])/(Turbine_6[1]-Turbine_9[1])) - i) <= 0.349
                    delta_theta = abs(atan((Turbine_6[2]-Turbine_9[2])/(Turbine_6[1]-Turbine_9[1])) - i)
                else
                    delta_theta = 0.349
                end
                distance = sqrt((Turbine_6[2]-Turbine_9[2])^(2)+(Turbine_6[1]-Turbine_9[1])^(2))
                x_naught = distance/cos(abs(atan((Turbine_6[2]-Turbine_9[2])/(Turbine_6[1]-Turbine_9[1])) - i))
                Wind_Velocity = (1-(2/3)*((r)/(r+a*x_naught))^(2))
                push!(Velocity_List_9 , Wind_Velocity)
                
            else 
                push!(Velocity_List_9 , 0)
            end
        else 
            push!(Velocity_List_9 , 0)
        end
        if Turbine_7[1] > Turbine_9[1]
            if (line_2 - 0.1*Turbine_7[1] + tan(i)*Turbine_7[1]) <= Turbine_7[2] <= (line_1 + 0.1*Turbine_7[1] + tan(i)*Turbine_7[1])
                if abs(atan((Turbine_7[2]-Turbine_9[2])/(Turbine_7[1]-Turbine_9[1])) - i) <= 0.349
                    delta_theta = abs(atan((Turbine_7[2]-Turbine_9[2])/(Turbine_7[1]-Turbine_9[1])) - i)
                else
                    delta_theta = 0.349
                end
                distance = sqrt((Turbine_7[2]-Turbine_9[2])^(2)+(Turbine_7[1]-Turbine_9[1])^(2))
                x_naught = distance/cos(abs(atan((Turbine_7[2]-Turbine_9[2])/(Turbine_7[1]-Turbine_9[1])) - i))
                Wind_Velocity = (1-(2/3)*((r)/(r+a*x_naught))^(2))
                push!(Velocity_List_9 , Wind_Velocity)
                
            else 
                push!(Velocity_List_9 , 0)
            end
        else 
            push!(Velocity_List_9 , 0)
        end
        if Turbine_8[1] > Turbine_9[1]
            if (line_2 - 0.1*Turbine_8[1] + tan(i)*Turbine_8[1]) <= Turbine_8[2] <= (line_1 + 0.1*Turbine_8[1] + tan(i)*Turbine_8[1])
                if abs(atan((Turbine_8[2]-Turbine_9[2])/(Turbine_8[1]-Turbine_9[1])) - i) <= 0.349
                    delta_theta = abs(atan((Turbine_8[2]-Turbine_9[2])/(Turbine_8[1]-Turbine_9[1])) - i)
                else
                    delta_theta = 0.349
                end
                distance = sqrt((Turbine_8[2]-Turbine_9[2])^(2)+(Turbine_8[1]-Turbine_9[1])^(2))
                x_naught = distance/cos(abs(atan((Turbine_8[2]-Turbine_9[2])/(Turbine_8[1]-Turbine_9[1])) - i))
                Wind_Velocity = (1-(2/3)*((r)/(r+a*x_naught))^(2))
                push!(Velocity_List_9 , Wind_Velocity)
                
            else 
                push!(Velocity_List_9 , 0)
            end
        else 
            push!(Velocity_List_9 , 0)
        end
        if Turbine_10[1] > Turbine_9[1]
            if (line_2 - 0.1*Turbine_10[1] + tan(i)*Turbine_10[1]) <= Turbine_10[2] <= (line_1 + 0.1*Turbine_10[1] + tan(i)*Turbine_10[1])
                if abs(atan((Turbine_10[2]-Turbine_9[2])/(Turbine_10[1]-Turbine_9[1])) - i) <= 0.349
                    delta_theta = abs(atan((Turbine_10[2]-Turbine_9[2])/(Turbine_10[1]-Turbine_9[1])) - i)
                else
                    delta_theta = 0.349
                end 
                distance = sqrt((Turbine_10[2]-Turbine_9[2])^(2)+(Turbine_10[1]-Turbine_9[1])^(2))
                x_naught = distance/cos(abs(atan((Turbine_10[2]-Turbine_9[2])/(Turbine_10[1]-Turbine_9[1])) - i))
                Wind_Velocity = (1-(2/3)*((r)/(r+a*x_naught))^(2))
                push!(Velocity_List_9 , Wind_Velocity)
                
            else 
                push!(Velocity_List_9 , 0)
            end
        else 
            push!(Velocity_List_9 , 0)
        end
    end
    for i in (-x*(pi/180)*(1/2)):0.001:(x*(pi/180)*(1/2))
        line_1 = -0.1*Turbine_10[1]-tan(i)*Turbine_10[1]+Turbine_10[2]+ r*abs(cos(i))
        line_2 = 0.1*Turbine_10[1] - tan(i)*Turbine_10[1] + Turbine_10[2] - r*abs(cos(i))
        if Turbine_1[1] > Turbine_10[1]
            if (line_2 - 0.1*Turbine_1[1] + tan(i)*Turbine_1[1]) <= Turbine_1[2] <= (line_1 + 0.1*Turbine_1[1] + tan(i)*Turbine_1[1])
                if abs(atan((Turbine_1[2]-Turbine_10[2])/(Turbine_1[1]-Turbine_10[1])) - i) <= 0.349
                    delta_theta = abs(atan((Turbine_1[2]-Turbine_10[2])/(Turbine_1[1]-Turbine_10[1])) - i)
                else
                    delta_theta = 0.349
                end
                distance = sqrt((Turbine_1[2]-Turbine_10[2])^(2)+(Turbine_1[1]-Turbine_10[1])^(2))
                x_naught = distance/cos(abs(atan((Turbine_1[2]-Turbine_10[2])/(Turbine_1[1]-Turbine_10[1])) - i))
                Wind_Velocity = (1-(2/3)*((r)/(r+a*x_naught))^(2))
                push!(Velocity_List_10 , Wind_Velocity)
                
            else 
                push!(Velocity_List_10 , 0)
            end
        else 
            push!(Velocity_List_10 , 0)
        end
        if Turbine_2[1] > Turbine_10[1]
            if (line_2 - 0.1*Turbine_2[1] + tan(i)*Turbine_2[1]) <= Turbine_2[2] <= (line_1 + 0.1*Turbine_2[1] + tan(i)*Turbine_2[1])
                if abs(atan((Turbine_2[2]-Turbine_10[2])/(Turbine_2[1]-Turbine_10[1])) - i) <= 0.349
                    delta_theta = abs(atan((Turbine_2[2]-Turbine_10[2])/(Turbine_2[1]-Turbine_10[1])) - i)
                else
                    delta_theta = 0.349
                end
                distance = sqrt((Turbine_2[2]-Turbine_10[2])^(2)+(Turbine_2[1]-Turbine_10[1])^(2))
                x_naught = distance/cos(abs(atan((Turbine_2[2]-Turbine_10[2])/(Turbine_2[1]-Turbine_10[1])) - i))
                Wind_Velocity = (1-(2/3)*((r)/(r+a*x_naught))^(2))
                push!(Velocity_List_10 , Wind_Velocity)
                
            else 
                push!(Velocity_List_10 , 0)
            end
        else 
            push!(Velocity_List_10 , 0)
        end
        if Turbine_3[1] > Turbine_10[1]
            if (line_2 - 0.1*Turbine_3[1] + tan(i)*Turbine_3[1]) <= Turbine_3[2] <= (line_1 + 0.1*Turbine_3[1] + tan(i)*Turbine_3[1])
                if abs(atan((Turbine_3[2]-Turbine_10[2])/(Turbine_3[1]-Turbine_10[1])) - i) <= 0.349
                    delta_theta = abs(atan((Turbine_3[2]-Turbine_10[2])/(Turbine_3[1]-Turbine_10[1])) - i)
                else
                    delta_theta = 0.349
                end 
                distance = sqrt((Turbine_3[2]-Turbine_10[2])^(2)+(Turbine_3[1]-Turbine_10[1])^(2))
                x_naught = distance/cos(abs(atan((Turbine_3[2]-Turbine_10[2])/(Turbine_3[1]-Turbine_10[1])) - i))
                Wind_Velocity = (1-(2/3)*((r)/(r+a*x_naught))^(2))
                push!(Velocity_List_10 , Wind_Velocity)
                
            else 
                push!(Velocity_List_10 , 0)
            end
        else 
            push!(Velocity_List_10 , 0)
        end
        if Turbine_4[1] > Turbine_10[1]
            if (line_2 - 0.1*Turbine_4[1] + tan(i)*Turbine_4[1]) <= Turbine_4[2] <= (line_1 + 0.1*Turbine_4[1] + tan(i)*Turbine_4[1])
                if abs(atan((Turbine_4[2]-Turbine_10[2])/(Turbine_4[1]-Turbine_10[1])) - i) <= 0.349
                    delta_theta = abs(atan((Turbine_4[2]-Turbine_10[2])/(Turbine_4[1]-Turbine_10[1])) - i)
                else
                    delta_theta = 0.349
                end
                distance = sqrt((Turbine_4[2]-Turbine_10[2])^(2)+(Turbine_4[1]-Turbine_10[1])^(2))
                x_naught = distance/cos(abs(atan((Turbine_4[2]-Turbine_10[2])/(Turbine_4[1]-Turbine_10[1])) - i))
                Wind_Velocity = (1-(2/3)*((r)/(r+a*x_naught))^(2))
                push!(Velocity_List_10 , Wind_Velocity)
                
            else 
                push!(Velocity_List_10 , 0)
            end
        else 
            push!(Velocity_List_10 , 0)
        end
        if Turbine_5[1] > Turbine_10[1]
            if (line_2 - 0.1*Turbine_5[1] + tan(i)*Turbine_5[1]) <= Turbine_5[2] <= (line_1 + 0.1*Turbine_5[1] + tan(i)*Turbine_5[1])
                if abs(atan((Turbine_5[2]-Turbine_10[2])/(Turbine_5[1]-Turbine_10[1])) - i) <= 0.349
                    delta_theta = abs(atan((Turbine_5[2]-Turbine_10[2])/(Turbine_5[1]-Turbine_10[1])) - i)
                else
                    delta_theta = 0.349
                end
                distance = sqrt((Turbine_5[2]-Turbine_10[2])^(2)+(Turbine_5[1]-Turbine_10[1])^(2))
                x_naught = distance/cos(abs(atan((Turbine_5[2]-Turbine_10[2])/(Turbine_5[1]-Turbine_10[1])) - i))
                Wind_Velocity = (1-(2/3)*((r)/(r+a*x_naught))^(2))
                push!(Velocity_List_10 , Wind_Velocity)
                
            else 
                push!(Velocity_List_10 , 0)
            end
        else 
            push!(Velocity_List_10 , 0)
        end
        if Turbine_6[1] > Turbine_10[1]
            if (line_2 - 0.1*Turbine_6[1] + tan(i)*Turbine_6[1]) <= Turbine_6[2] <= (line_1 + 0.1*Turbine_6[1] + tan(i)*Turbine_6[1])
                if abs(atan((Turbine_6[2]-Turbine_10[2])/(Turbine_6[1]-Turbine_10[1])) - i) <= 0.349
                    delta_theta = abs(atan((Turbine_6[2]-Turbine_10[2])/(Turbine_6[1]-Turbine_10[1])) - i)
                else
                    delta_theta = 0.349
                end
                distance = sqrt((Turbine_6[2]-Turbine_10[2])^(2)+(Turbine_6[1]-Turbine_10[1])^(2))
                x_naught = distance/cos(abs(atan((Turbine_6[2]-Turbine_10[2])/(Turbine_6[1]-Turbine_10[1])) - i))
                Wind_Velocity = (1-(2/3)*((r)/(r+a*x_naught))^(2))
                push!(Velocity_List_10 , Wind_Velocity)
                
            else 
                push!(Velocity_List_10 , 0)
            end
        else 
            push!(Velocity_List_10 , 0)
        end
        if Turbine_7[1] > Turbine_10[1]
            if (line_2 - 0.1*Turbine_7[1] + tan(i)*Turbine_7[1]) <= Turbine_7[2] <= (line_1 + 0.1*Turbine_7[1] + tan(i)*Turbine_7[1])
                if abs(atan((Turbine_7[2]-Turbine_10[2])/(Turbine_7[1]-Turbine_10[1])) - i) <= 0.349
                    delta_theta = abs(atan((Turbine_7[2]-Turbine_10[2])/(Turbine_7[1]-Turbine_10[1])) - i)
                else
                    delta_theta = 0.349
                end
                distance = sqrt((Turbine_7[2]-Turbine_10[2])^(2)+(Turbine_7[1]-Turbine_10[1])^(2))
                x_naught = distance/cos(abs(atan((Turbine_7[2]-Turbine_10[2])/(Turbine_7[1]-Turbine_10[1])) - i))
                Wind_Velocity = (1-(2/3)*((r)/(r+a*x_naught))^(2))
                push!(Velocity_List_10 , Wind_Velocity)
                
            else 
                push!(Velocity_List_10 , 0)
            end
        else 
            push!(Velocity_List_10 , 0)
        end
        if Turbine_8[1] > Turbine_10[1]
            if (line_2 - 0.1*Turbine_8[1] + tan(i)*Turbine_8[1]) <= Turbine_8[2] <= (line_1 + 0.1*Turbine_8[1] + tan(i)*Turbine_8[1])
                if abs(atan((Turbine_8[2]-Turbine_10[2])/(Turbine_8[1]-Turbine_10[1])) - i) <= 0.349
                    delta_theta = abs(atan((Turbine_8[2]-Turbine_10[2])/(Turbine_8[1]-Turbine_10[1])) - i)
                else
                    delta_theta = 0.349
                end
                distance = sqrt((Turbine_8[2]-Turbine_10[2])^(2)+(Turbine_8[1]-Turbine_10[1])^(2))
                x_naught = distance/cos(abs(atan((Turbine_8[2]-Turbine_10[2])/(Turbine_8[1]-Turbine_10[1])) - i))
                Wind_Velocity = (1-(2/3)*((r)/(r+a*x_naught))^(2))
                push!(Velocity_List_10 , Wind_Velocity)
                
            else 
                push!(Velocity_List_10 , 0)
            end
        else 
            push!(Velocity_List_10 , 0)
        end
        if Turbine_9[1] > Turbine_10[1]
            if (line_2 - 0.1*Turbine_9[1] + tan(i)*Turbine_9[1]) <= Turbine_9[2] <= (line_1 + 0.1*Turbine_9[1] + tan(i)*Turbine_9[1])
                if abs(atan((Turbine_9[2]-Turbine_10[2])/(Turbine_9[1]-Turbine_10[1])) - i) <= 0.349
                    delta_theta = abs(atan((Turbine_9[2]-Turbine_10[2])/(Turbine_9[1]-Turbine_10[1])) - i)
                else
                    delta_theta = 0.349
                end
                distance = sqrt((Turbine_9[2]-Turbine_10[2])^(2)+(Turbine_9[1]-Turbine_10[1])^(2))
                x_naught = distance/cos(abs(atan((Turbine_9[2]-Turbine_10[2])/(Turbine_9[1]-Turbine_10[1])) - i))
                Wind_Velocity = (1-(2/3)*((r)/(r+a*x_naught))^(2))
                push!(Velocity_List_10 , Wind_Velocity)
                
            else 
                push!(Velocity_List_10 , 0)
            end
        else 
            push!(Velocity_List_10 , 0)
        end
    end
    mini_list_1 = []
    mini_list_2 = []
    mini_list_3 = []
    mini_list_4 = []
    mini_list_5 = []
    mini_list_6 = []
    mini_list_7 = []
    mini_list_8 = []
    mini_list_9 = []
    mini_list_10 = []
    Power_1 = []
    Power_2 = []
    Power_3 = []
    Power_4 = []
    Power_5 = []
    Power_6 = []
    Power_7 = []
    Power_8 = []
    Power_9 = []
    Power_10 = []
    for i in 1:9:5661
        if Velocity_List_2[0+i] + Velocity_List_3[0+i] + Velocity_List_4[0+i] + Velocity_List_5[0+i] + Velocity_List_6[0+i] + Velocity_List_7[0+i] +
            Velocity_List_8[0+i] + Velocity_List_9[0+i] + Velocity_List_10[0+i] == 0
            push!(Power_1 , 1)
        elseif Velocity_List_2[0+i] + Velocity_List_3[0+i] + Velocity_List_4[0+i] + Velocity_List_5[0+i] + Velocity_List_6[0+i] + Velocity_List_7[0+i] +
            Velocity_List_8[0+i] + Velocity_List_9[0+i] + Velocity_List_10[0+i] > 1
            if Velocity_List_2[0+i] > 0
                push!(mini_list_1 , Velocity_List_2[0+i])
            end
            if Velocity_List_3[0+i] > 0
                push!(mini_list_1 , Velocity_List_3[0+i])
            end
            if Velocity_List_4[0+i] > 0
                push!(mini_list_1 , Velocity_List_4[0+i])
            end
            if Velocity_List_5[0+i] > 0
                push!(mini_list_1 , Velocity_List_5[0+i])
            end
            if Velocity_List_6[0+i] > 0
                push!(mini_list_1 , Velocity_List_6[0+i])
            end
            if Velocity_List_7[0+i] > 0
                push!(mini_list_1 , Velocity_List_7[0+i])
            end
            if Velocity_List_8[0+i] > 0
                push!(mini_list_1 , Velocity_List_8[0+i])
            end
            if Velocity_List_9[0+i] > 0
                push!(mini_list_1 , Velocity_List_9[0+i])
            end
            if Velocity_List_10[0+i] > 0
                push!(mini_list_1 , Velocity_List_10[0+i])
            end
            push!(Power_1 , ((mini_list_1[1] + mini_list_1[2])/2)^(3))
            deleteat!(mini_list_1 , 1)
            deleteat!(mini_list_1 , 1)
        else
            push!(Power_1 , (Velocity_List_2[0+i] + Velocity_List_3[0+i] + Velocity_List_4[0+i] + Velocity_List_5[0+i] + Velocity_List_6[0+i] + Velocity_List_7[0+i] +
            Velocity_List_8[0+i] + Velocity_List_9[0+i] + Velocity_List_10[0+i])^(3))
        end
        if Velocity_List_1[0+i] + Velocity_List_3[1+i] + Velocity_List_4[1+i] + Velocity_List_5[1+i] + Velocity_List_6[1+i] + Velocity_List_7[1+i] +
            Velocity_List_8[1+i] + Velocity_List_9[1+i] + Velocity_List_10[1+i] == 0
            push!(Power_2 , 1)
        elseif Velocity_List_1[0+i] + Velocity_List_3[1+i] + Velocity_List_4[1+i] + Velocity_List_5[1+i] + Velocity_List_6[1+i] + Velocity_List_7[1+i] +
            Velocity_List_8[1+i] + Velocity_List_9[1+i] + Velocity_List_10[1+i] > 1
            if Velocity_List_1[0+i] > 0
                push!(mini_list_2 , Velocity_List_1[0+i])
            end
            if Velocity_List_3[1+i] > 0
                push!(mini_list_2 , Velocity_List_3[1+i])
            end
            if Velocity_List_4[1+i] > 0
                push!(mini_list_2 , Velocity_List_4[1+i])
            end
            if Velocity_List_5[1+i] > 0
                push!(mini_list_2 , Velocity_List_5[1+i])
            end
            if Velocity_List_6[1+i] > 0
                push!(mini_list_2 , Velocity_List_6[1+i])
            end
            if Velocity_List_7[1+i] > 0
                push!(mini_list_2 , Velocity_List_7[1+i])
            end
            if Velocity_List_8[1+i] > 0
                push!(mini_list_2 , Velocity_List_8[1+i])
            end
            if Velocity_List_9[1+i] > 0
                push!(mini_list_2 , Velocity_List_9[1+i])
            end
            if Velocity_List_10[1+i] > 0
                push!(mini_list_2 , Velocity_List_10[1+i])
            end
            push!(Power_2 , ((mini_list_2[1] + mini_list_2[2])/2)^(3))
            deleteat!(mini_list_2 , 1)
            deleteat!(mini_list_2 , 1)
        else
            push!(Power_2 , (Velocity_List_1[0+i] + Velocity_List_3[1+i] + Velocity_List_4[1+i] + Velocity_List_5[1+i] + Velocity_List_6[1+i] + Velocity_List_7[1+i] +
            Velocity_List_8[1+i] + Velocity_List_9[1+i] + Velocity_List_10[1+i])^(3))
        end
        if Velocity_List_1[1+i] + Velocity_List_2[1+i] + Velocity_List_4[2+i] + Velocity_List_5[2+i] + Velocity_List_6[2+i] + Velocity_List_7[2+i] +
            Velocity_List_8[2+i] + Velocity_List_9[2+i] + Velocity_List_10[2+i] == 0
            push!(Power_3 , 1)
        elseif Velocity_List_1[1+i] + Velocity_List_2[1+i] + Velocity_List_4[2+i] + Velocity_List_5[2+i] + Velocity_List_6[2+i] + Velocity_List_7[2+i] +
            Velocity_List_8[2+i] + Velocity_List_9[2+i] + Velocity_List_10[2+i] > 1
            if Velocity_List_1[1+i] > 0
                push!(mini_list_3 , Velocity_List_1[1+i])
            end
            if Velocity_List_2[1+i] > 0
                push!(mini_list_3 , Velocity_List_2[1+i])
            end
            if Velocity_List_4[2+i] > 0
                push!(mini_list_3 , Velocity_List_4[2+i])
            end
            if Velocity_List_5[2+i] > 0
                push!(mini_list_3 , Velocity_List_5[2+i])
            end
            if Velocity_List_6[2+i] > 0
                push!(mini_list_3 , Velocity_List_6[2+i])
            end
            if Velocity_List_7[2+i] > 0
                push!(mini_list_3 , Velocity_List_7[2+i])
            end
            if Velocity_List_8[2+i] > 0
                push!(mini_list_3 , Velocity_List_8[2+i])
            end
            if Velocity_List_9[2+i] > 0
                push!(mini_list_3 , Velocity_List_9[2+i])
            end
            if Velocity_List_10[2+i] > 0
                push!(mini_list_3 , Velocity_List_10[2+i])
            end
            push!(Power_3 , ((mini_list_3[1] + mini_list_3[2])/2)^(3))
            deleteat!(mini_list_3 , 1)
            deleteat!(mini_list_3 , 1)
        else
            push!(Power_3 , (Velocity_List_1[1+i] + Velocity_List_2[1+i] + Velocity_List_4[2+i] + Velocity_List_5[2+i] + Velocity_List_6[2+i] + Velocity_List_7[2+i] +
            Velocity_List_8[2+i] + Velocity_List_9[2+i] + Velocity_List_10[2+i])^(3))
        end
        if Velocity_List_1[2+i] + Velocity_List_2[2+i] + Velocity_List_3[2+i] + Velocity_List_5[3+i] + Velocity_List_6[3+i] + Velocity_List_7[3+i] +
            Velocity_List_8[3+i] + Velocity_List_9[3+i] + Velocity_List_10[3+i] == 0
            push!(Power_4 , 1)
        elseif Velocity_List_1[2+i] + Velocity_List_2[2+i] + Velocity_List_3[2+i] + Velocity_List_5[3+i] + Velocity_List_6[3+i] + Velocity_List_7[3+i] +
            Velocity_List_8[3+i] + Velocity_List_9[3+i] + Velocity_List_10[3+i] > 1
            if Velocity_List_1[2+i] > 0
                push!(mini_list_4 , Velocity_List_1[2+i])
            end
            if Velocity_List_2[2+i] > 0
                push!(mini_list_4 , Velocity_List_2[2+i])
            end
            if Velocity_List_3[2+i] > 0
                push!(mini_list_4 , Velocity_List_3[2+i])
            end
            if Velocity_List_5[3+i] > 0
                push!(mini_list_4 , Velocity_List_5[3+i])
            end
            if Velocity_List_6[3+i] > 0
                push!(mini_list_4 , Velocity_List_6[3+i])
            end
            if Velocity_List_7[3+i] > 0
                push!(mini_list_4 , Velocity_List_7[3+i])
            end
            if Velocity_List_8[3+i] > 0
                push!(mini_list_4 , Velocity_List_8[3+i])
            end
            if Velocity_List_9[3+i] > 0
                push!(mini_list_4 , Velocity_List_9[3+i])
            end
            if Velocity_List_10[3+i] > 0
                push!(mini_list_4 , Velocity_List_10[3+i])
            end
            push!(Power_4 , ((mini_list_4[1] + mini_list_4[2])/2)^(3))
            deleteat!(mini_list_4 , 1)
            deleteat!(mini_list_4 , 1)
        else
            push!(Power_4 , (Velocity_List_1[2+i] + Velocity_List_2[2+i] + Velocity_List_3[2+i] + Velocity_List_5[3+i] + Velocity_List_6[3+i] + Velocity_List_7[3+i] +
            Velocity_List_8[3+i] + Velocity_List_9[3+i] + Velocity_List_10[3+i])^(3))
        end
        if Velocity_List_1[3+i] + Velocity_List_2[3+i] + Velocity_List_3[3+i] + Velocity_List_4[3+i] + Velocity_List_6[4+i] + Velocity_List_7[4+i] +
            Velocity_List_8[4+i] + Velocity_List_9[4+i] + Velocity_List_10[4+i] == 0
            push!(Power_5 , 1)
        elseif Velocity_List_1[3+i] + Velocity_List_2[3+i] + Velocity_List_3[3+i] + Velocity_List_4[3+i] + Velocity_List_6[4+i] + Velocity_List_7[4+i] +
            Velocity_List_8[4+i] + Velocity_List_9[4+i] + Velocity_List_10[4+i] > 1
            if Velocity_List_1[3+i] > 0
                push!(mini_list_5 , Velocity_List_1[3+i])
            end
            if Velocity_List_2[3+i] > 0
                push!(mini_list_5 , Velocity_List_2[3+i])
            end
            if Velocity_List_3[3+i] > 0
                push!(mini_list_5 , Velocity_List_3[3+i])
            end
            if Velocity_List_4[3+i] > 0
                push!(mini_list_5 , Velocity_List_4[3+i])
            end
            if Velocity_List_6[4+i] > 0
                push!(mini_list_5 , Velocity_List_6[4+i])
            end
            if Velocity_List_7[4+i] > 0
                push!(mini_list_5 , Velocity_List_7[4+i])
            end
            if Velocity_List_8[4+i] > 0
                push!(mini_list_5 , Velocity_List_8[4+i])
            end
            if Velocity_List_9[4+i] > 0
                push!(mini_list_5 , Velocity_List_9[4+i])
            end
            if Velocity_List_10[4+i] > 0
                push!(mini_list_5 , Velocity_List_10[4+i])
            end
            push!(Power_5 , ((mini_list_5[1] + mini_list_5[2])/2)^(3))
            deleteat!(mini_list_5 , 1)
            deleteat!(mini_list_5 , 1)
        else
            push!(Power_5 , (Velocity_List_1[3+i] + Velocity_List_2[3+i] + Velocity_List_3[3+i] + Velocity_List_4[3+i] + Velocity_List_6[4+i] + Velocity_List_7[4+i] +
            Velocity_List_8[4+i] + Velocity_List_9[4+i] + Velocity_List_10[4+i])^(3))
        end
        if Velocity_List_1[4+i] + Velocity_List_2[4+i] + Velocity_List_3[4+i] + Velocity_List_4[4+i] + Velocity_List_5[4+i] + Velocity_List_7[5+i] +
            Velocity_List_8[5+i] + Velocity_List_9[5+i] + Velocity_List_10[5+i] == 0
            push!(Power_6 , 1)
        elseif Velocity_List_1[4+i] + Velocity_List_2[4+i] + Velocity_List_3[4+i] + Velocity_List_4[4+i] + Velocity_List_5[4+i] + Velocity_List_7[5+i] +
            Velocity_List_8[5+i] + Velocity_List_9[5+i] + Velocity_List_10[5+i] > 1
            if Velocity_List_1[4+i] > 0
                push!(mini_list_6 , Velocity_List_1[4+i])
            end
            if Velocity_List_2[4+i] > 0
                push!(mini_list_6 , Velocity_List_2[4+i])
            end
            if Velocity_List_3[4+i] > 0
                push!(mini_list_6 , Velocity_List_3[4+i])
            end
            if Velocity_List_4[4+i] > 0
                push!(mini_list_6 , Velocity_List_4[4+i])
            end
            if Velocity_List_5[4+i] > 0
                push!(mini_list_6 , Velocity_List_5[4+i])
            end
            if Velocity_List_7[5+i] > 0
                push!(mini_list_6 , Velocity_List_7[5+i])
            end
            if Velocity_List_8[5+i] > 0
                push!(mini_list_6 , Velocity_List_8[5+i])
            end
            if Velocity_List_9[5+i] > 0
                push!(mini_list_6 , Velocity_List_9[5+i])
            end
            if Velocity_List_10[5+i] > 0
                push!(mini_list_6 , Velocity_List_10[5+i])
            end
            push!(Power_6 , ((mini_list_6[1] + mini_list_6[2])/2)^(3))
            deleteat!(mini_list_6 , 1)
            deleteat!(mini_list_6 , 1)
        else
            push!(Power_6 , (Velocity_List_1[4+i] + Velocity_List_2[4+i] + Velocity_List_3[4+i] + Velocity_List_4[4+i] + Velocity_List_5[4+i] + Velocity_List_7[5+i] +
            Velocity_List_8[5+i] + Velocity_List_9[5+i] + Velocity_List_10[5+i])^(3))
        end
        if Velocity_List_1[5+i] + Velocity_List_2[5+i] + Velocity_List_3[5+i] + Velocity_List_4[5+i] + Velocity_List_5[5+i] + Velocity_List_6[5+i] +
            Velocity_List_8[6+i] + Velocity_List_9[6+i] + Velocity_List_10[6+i] == 0
            push!(Power_7 , 1)
        elseif Velocity_List_1[5+i] + Velocity_List_2[5+i] + Velocity_List_3[5+i] + Velocity_List_4[5+i] + Velocity_List_5[5+i] + Velocity_List_6[5+i] +
            Velocity_List_8[6+i] + Velocity_List_9[6+i] + Velocity_List_10[6+i] > 1
            if Velocity_List_1[5+i] > 0
                push!(mini_list_7 , Velocity_List_1[5+i])
            end
            if Velocity_List_2[5+i] > 0
                push!(mini_list_7 , Velocity_List_2[5+i])
            end
            if Velocity_List_3[5+i] > 0
                push!(mini_list_7 , Velocity_List_3[5+i])
            end
            if Velocity_List_4[5+i] > 0
                push!(mini_list_7 , Velocity_List_4[5+i])
            end
            if Velocity_List_5[5+i] > 0
                push!(mini_list_7 , Velocity_List_5[5+i])
            end
            if Velocity_List_6[5+i] > 0
                push!(mini_list_7 , Velocity_List_6[5+i])
            end
            if Velocity_List_8[6+i] > 0
                push!(mini_list_7 , Velocity_List_8[6+i])
            end
            if Velocity_List_9[6+i] > 0
                push!(mini_list_7 , Velocity_List_9[6+i])
            end
            if Velocity_List_10[6+i] > 0
                push!(mini_list_7 , Velocity_List_10[6+i])
            end
            push!(Power_7 , ((mini_list_7[1] + mini_list_7[2])/2)^(3))
            deleteat!(mini_list_7 , 1)
            deleteat!(mini_list_7 , 1)
        else
            push!(Power_7 , (Velocity_List_1[5+i] + Velocity_List_2[5+i] + Velocity_List_3[5+i] + Velocity_List_4[5+i] + Velocity_List_5[5+i] + Velocity_List_6[5+i] +
            Velocity_List_8[6+i] + Velocity_List_9[6+i] + Velocity_List_10[6+i])^(3))
        end
        if Velocity_List_1[6+i] + Velocity_List_2[6+i] + Velocity_List_3[6+i] + Velocity_List_4[6+i] + Velocity_List_5[6+i] + Velocity_List_6[6+i] +
            Velocity_List_7[6+i] + Velocity_List_9[7+i] + Velocity_List_10[7+i] == 0
            push!(Power_8 , 1)
        elseif Velocity_List_1[6+i] + Velocity_List_2[6+i] + Velocity_List_3[6+i] + Velocity_List_4[6+i] + Velocity_List_5[6+i] + Velocity_List_6[6+i] +
            Velocity_List_7[6+i] + Velocity_List_9[7+i] + Velocity_List_10[7+i] > 1
            if Velocity_List_1[6+i] > 0
                push!(mini_list_8 , Velocity_List_1[6+i])
            end
            if Velocity_List_2[6+i] > 0
                push!(mini_list_8 , Velocity_List_2[6+i])
            end
            if Velocity_List_3[6+i] > 0
                push!(mini_list_8 , Velocity_List_3[6+i])
            end
            if Velocity_List_4[6+i] > 0
                push!(mini_list_8 , Velocity_List_4[6+i])
            end
            if Velocity_List_5[6+i] > 0
                push!(mini_list_8 , Velocity_List_5[6+i])
            end
            if Velocity_List_6[6+i] > 0
                push!(mini_list_8 , Velocity_List_6[6+i])
            end
            if Velocity_List_7[6+i] > 0
                push!(mini_list_8 , Velocity_List_7[6+i])
            end
            if Velocity_List_9[7+i] > 0
                push!(mini_list_8 , Velocity_List_9[7+i])
            end
            if Velocity_List_10[7+i] > 0
                push!(mini_list_8 , Velocity_List_10[7+i])
            end
            push!(Power_8 , ((mini_list_8[1] + mini_list_8[2])/2)^(3))
            deleteat!(mini_list_8 , 1)
            deleteat!(mini_list_8 , 1)
        else
            push!(Power_8 , (Velocity_List_1[6+i] + Velocity_List_2[6+i] + Velocity_List_3[6+i] + Velocity_List_4[6+i] + Velocity_List_5[6+i] + Velocity_List_6[6+i] +
            Velocity_List_7[6+i] + Velocity_List_9[7+i] + Velocity_List_10[7+i])^(3))
        end
        if Velocity_List_1[7+i] + Velocity_List_2[7+i] + Velocity_List_3[7+i] + Velocity_List_4[7+i] + Velocity_List_5[7+i] + Velocity_List_6[7+i] +
            Velocity_List_7[7+i] + Velocity_List_8[7+i] + Velocity_List_10[8+i] == 0
            push!(Power_9 , 1)
        elseif Velocity_List_1[7+i] + Velocity_List_2[7+i] + Velocity_List_3[7+i] + Velocity_List_4[7+i] + Velocity_List_5[7+i] + Velocity_List_6[7+i] +
            Velocity_List_7[7+i] + Velocity_List_8[7+i] + Velocity_List_10[8+i] > 1
            if Velocity_List_1[7+i] > 0
                push!(mini_list_9 , Velocity_List_1[7+i])
            end
            if Velocity_List_2[7+i] > 0
                push!(mini_list_9 , Velocity_List_2[7+i])
            end
            if Velocity_List_3[7+i] > 0
                push!(mini_list_9 , Velocity_List_3[7+i])
            end
            if Velocity_List_4[7+i] > 0
                push!(mini_list_9 , Velocity_List_4[7+i])
            end
            if Velocity_List_5[7+i] > 0
                push!(mini_list_9 , Velocity_List_5[7+i])
            end
            if Velocity_List_6[7+i] > 0
                push!(mini_list_9 , Velocity_List_6[7+i])
            end
            if Velocity_List_7[7+i] > 0
                push!(mini_list_9 , Velocity_List_7[7+i])
            end
            if Velocity_List_8[7+i] > 0
                push!(mini_list_9 , Velocity_List_8[7+i])
            end
            if Velocity_List_10[8+i] > 0
                push!(mini_list_9 , Velocity_List_10[8+i])
            end
            push!(Power_9 , ((mini_list_9[1] + mini_list_9[2])/2)^(3))
            deleteat!(mini_list_9 , 1)
            deleteat!(mini_list_9 , 1)
        else
            push!(Power_9 , (Velocity_List_1[7+i] + Velocity_List_2[7+i] + Velocity_List_3[7+i] + Velocity_List_4[7+i] + Velocity_List_5[7+i] + Velocity_List_6[7+i] +
            Velocity_List_7[7+i] + Velocity_List_8[7+i] + Velocity_List_10[8+i])^(3))
        end
        if Velocity_List_1[8+i] + Velocity_List_2[8+i] + Velocity_List_3[8+i] + Velocity_List_4[8+i] + Velocity_List_5[8+i] + Velocity_List_6[8+i] +
            Velocity_List_7[8+i] + Velocity_List_8[8+i] + Velocity_List_9[8+i] == 0
            push!(Power_10 , 1)
        elseif Velocity_List_1[8+i] + Velocity_List_2[8+i] + Velocity_List_3[8+i] + Velocity_List_4[8+i] + Velocity_List_5[8+i] + Velocity_List_6[8+i] +
            Velocity_List_7[8+i] + Velocity_List_8[8+i] + Velocity_List_9[8+i] > 1
            if Velocity_List_1[8+i] > 0
                push!(mini_list_10 , Velocity_List_1[8+i])
            end
            if Velocity_List_2[8+i] > 0
                push!(mini_list_10 , Velocity_List_2[8+i])
            end
            if Velocity_List_3[8+i] > 0
                push!(mini_list_10 , Velocity_List_3[8+i])
            end
            if Velocity_List_4[8+i] > 0
                push!(mini_list_10 , Velocity_List_4[8+i])
            end
            if Velocity_List_5[8+i] > 0
                push!(mini_list_10 , Velocity_List_5[8+i])
            end
            if Velocity_List_6[8+i] > 0
                push!(mini_list_10 , Velocity_List_6[8+i])
            end
            if Velocity_List_7[8+i] > 0
                push!(mini_list_10 , Velocity_List_7[8+i])
            end
            if Velocity_List_8[8+i] > 0
                push!(mini_list_10 , Velocity_List_8[8+i])
            end
            if Velocity_List_9[8+i] > 0
                push!(mini_list_10 , Velocity_List_9[8+i])
            end
            push!(Power_10 , ((mini_list_10[1] + mini_list_10[2])/2)^(3))
            deleteat!(mini_list_10 , 1)
            deleteat!(mini_list_10 , 1)
        else
            push!(Power_10 , (Velocity_List_1[8+i] + Velocity_List_2[8+i] + Velocity_List_3[8+i] + Velocity_List_4[8+i] + Velocity_List_5[8+i] + Velocity_List_6[8+i] +
            Velocity_List_7[8+i] + Velocity_List_8[8+i] + Velocity_List_9[8+i])^(3))
        end
    end
    Final_Power = []
    for i in 1:629
        push!(Final_Power , (Power_1[i] + Power_2[i] + Power_3[i] + Power_4[i] + Power_5[i] + Power_6[i] + Power_7[i] + Power_8[i] + Power_9[i] + Power_10[i])/10)
    end
    x_axis = []
    for i in (-x*(pi/180)*(1/2)):0.001:(x*(pi/180)*(1/2))
        push!(x_axis , i)
    end
    plot(x_axis , Final_Power)
    #index 484 and 483 mark the first shift down
    
end
Circle_Organization()

