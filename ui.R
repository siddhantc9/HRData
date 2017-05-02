library(shiny)
library(shinythemes)
tagList(
        shinythemes::themeSelector(),
        navbarPage(
            # theme = "cerulean",  # <--- To use a theme, uncomment this
            "",
            tabPanel(h1("Talent Acquisition Consultant & Predictor"),
                     sidebarPanel(
                         h4("Input data required for model building -"),
                         fileInput("staffBackground", "Staff Background file :", accept = c('csv')),
                         fileInput("staffEducation", "Staff Education file :", accept = c(".xlsx", "csv")),
                         fileInput("experience", "Experience file :", accept = c(".xlsx", "csv")),
                         fileInput("incompanyPerformance", "Incompany Performance file :", accept = c(".xlsx", "csv")),
                         actionButton("trainModel", "Train the Model")
                     ),
                     mainPanel(
                         tabsetPanel(
                             tabPanel("Attribute Mapping",
                                      h4("Table"),
                                      tableOutput("table"),
                                      h4("Verbatim text output"),
                                      verbatimTextOutput("txtout"),
                                      h1("Header 1"),
                                      h2("Header 2"),
                                      h3("Header 3"),
                                      h4("Header 4"),
                                      h5("Header 5")
                             ),
                             tabPanel("Predictors",
                                      br(),
                                      h3("Need to predict - "),
                                      #br(),
                                      checkboxInput("Y1", "Overall Compatibility Score", FALSE),
                                      checkboxInput("Y2", "Estimated tenure range in Company", FALSE),
                                      checkboxInput("Y3", "Performance Rating in first year", FALSE),
                                      checkboxInput("Y4", "Top three best fit role clusters", FALSE),
                                      checkboxInput("Y5", "Estimated Engagement Level", FALSE)
                                      
                                      ),
                             tabPanel("Results/Output")
                         )
                     )
            )
        )
    )