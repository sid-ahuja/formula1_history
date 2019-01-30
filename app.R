library(shiny)
ui = navbarPage(
    'Formula One Data Analysis',
    
    tabPanel("Normalized Points",
             sidebarLayout(
                 sidebarPanel(
                     "Since Formula One began in 1950, there have been several revisions to the points scoring system for races. This makes it difficult to compare drivers and teams who participated in the sport prior to the current points system, with the current drivers and teams. The table shows six observations as an example for the points that the driver / team would have earned if the current points system was in place for all Formula One races (refer to the ‘New Points’ column). Using the new points column we can create the visuals for total points earned by drivers and constructors in a fair manner. Only the top 10 drivers and constructors are displayed."
                 ),
                 mainPanel(
                     tabsetPanel(
                         tabPanel("Results Table with New Points", tableOutput('new_point')),
                         tabPanel("Total Points - Drivers Visual", plotOutput('total_points')),
                         tabPanel("Total Points - Constructors Visual", plotOutput('total_points_cons')),
                         tabPanel("Total Points - Drivers Table", tableOutput('career_points')),
                         tabPanel("Total Points - Constructors Table", tableOutput('constructor_points'))
                     )
                 )
             )),
    tabPanel("Average Points",
             sidebarLayout(
                 sidebarPanel(
                     "These visuals show the average number of points drivers and constructors earned per race. The points are calculated using the current points system for all races."
                 ),
                 mainPanel(
                     tabsetPanel(
                         tabPanel("Drivers Visual", plotOutput('average_points')),
                         tabPanel("Constructors Visual", plotOutput('average_points_cons')),
                         tabPanel("Drivers Table", tableOutput('average_driver')),
                         tabPanel("Constructors Table", tableOutput('average_constructor'))
                     )
                 )
             )),
    tabPanel("Experience",
             sidebarLayout(
                 sidebarPanel(
                     "These visuals show which drivers and constructors have the most experience in Formula One over the sport’s ~70 year history."
                 ),
                 mainPanel(
                     tabsetPanel(
                         tabPanel("Drivers Visual", plotOutput("race_count")),
                         tabPanel("Constructors Visual", plotOutput("race_count_cons")),
                         tabPanel("Drivers Table", tableOutput('career_races')),
                         tabPanel("Constructors Table", tableOutput('constructor_races'))
                     )
                 )
             )),
    tabPanel("New Talent",
             sidebarLayout(
                 sidebarPanel(
                     "These visuals show how many new drivers and constructors have entered the sport every year."
                 ),
                 mainPanel(
                     tabsetPanel(
                         tabPanel("Drivers", plotOutput("newdriver_count")),
                         tabPanel("Constructors", plotOutput("newconst_count"))
                     )
                 )
             )),
    tabPanel("Disqualifications",
             sidebarLayout(
                 sidebarPanel(
                     "Often times Formula One fans complain that in recent years race officials have been handing out too many penalties to drivers. One way to see if this is indeed the case is by looking at how many disqualifications occur every year. The other graphs in this tab show which drivers and constructors are most commonly disqualified, and which track these disqualifications occur most often."
                 ),
                 mainPanel(
                     tabsetPanel(
                         tabPanel("Yearly Trend", plotOutput("disq_total")),
                         tabPanel("Drivers", plotOutput("disq_driver")),
                         tabPanel("Constructors", plotOutput("disq_const")),
                         tabPanel("Tracks", plotOutput("disq_track"))
                     )
                 )
             )),
    tabPanel("Pole Laps",
             sidebarLayout(
                 sidebarPanel(
                     "A driver or team earns a 'pole lap' when they record the fastest lap time in the qualifying for the race. These visuals show the drivers and constructors who have earned the most pole laps in the history of Formula One."
                 ),
                 mainPanel(
                     tabsetPanel(
                         tabPanel("Drivers", plotOutput("pole_driver")),
                         tabPanel("Constructors", plotOutput("pole_constructor"))
                     )
                 )
             )),
    tabPanel("Fastest Laps",
             sidebarLayout(
                 sidebarPanel(
                     "A driver or team earns a 'fastest lap' when they record the fastest lap time in the race itself. These visuals show the drivers and constructors who have earned the most fastest laps in the history of Formula One."
                 ),
                 mainPanel(
                     tabsetPanel(
                         tabPanel("Drivers", plotOutput("fastest_driver")),
                         tabPanel("Constructors", plotOutput("fastest_constructor"))
                     )
                 )
             ))
)


server = function(input, output){
    #Tab 1: Normalized Points
    output$new_point = renderTable({new_points5})
    output$total_points = renderPlot({career_total_points_graph})
    output$total_points_cons = renderPlot({constructor_total_points_graph})
    output$career_points = renderTable({career_points})
    output$constructor_points = renderTable({constructor_points})
    
    #Tab 2: Average Points
    output$average_points = renderPlot({career_race_average})
    output$average_points_cons = renderPlot({constructor_race_average})
    output$average_driver = renderTable({average_points})
    output$average_constructor = renderTable({constructor_average})
    
    #Tab 3: Experience
    output$race_count = renderPlot({career_race_racetotal_graph})
    output$race_count_cons = renderPlot({constructor_race_racetotal_graph}) 
    output$career_races = renderTable({career_races})
    output$constructor_races = renderTable({constructor_races})
    
    #Tab 4: New Talent
    output$newdriver_count = renderPlot({debut_year_graph})
    output$newconst_count = renderPlot({debut_const_graph})
    
    #Tab 5: Disqualifications
    output$disq_total = renderPlot({disq_year})
    output$disq_driver = renderPlot({disq_driver_graph})
    output$disq_const = renderPlot({disq_const_graph})
    output$disq_track = renderPlot({disq_track_graph})
    
    #Tab 6: Pole Laps
    output$pole_driver = renderPlot({qualifying_lap_driver_graph})
    output$pole_constructor = renderPlot({qualifying_lap_constructor_graph})
    
    #Tab 7: Fastest Laps
    output$fastest_driver = renderPlot({fastest_lap_driver_graph})
    output$fastest_constructor = renderPlot({fastest_lap_constructor_graph})  
    
}


shinyApp(ui = ui, server = server)