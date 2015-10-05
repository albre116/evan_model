library(shiny)

shinyUI(fluidPage(
  fluidRow(
    column(12, align = "center",
           h2("Cardiac Allograft Rejection Risk Calculator"),  
           h4("Developed by Evan Kransdorf")
    ) #columne
  ), #row
  fluidRow(
    column(4,

           numericInput("age", label = h4("Age (years)"), value = 40, min = 0, max = 80, step = 1),      
           selectInput("eth", label = h4("Ethnicity"), choices = list("Caucasian" = 1, "African American" = 2, "Latino" = 4, "Asian/Other" = 5), selected = 1),           
           numericInput("cr", label = h4("Creatinine"), value = 0.8, min = 0.8, max = 20, step = 0.1),
           numericInput("year", label = h4("Year of Transplant"), value = 2012, min = 2003, max = 2015, step = 1),         
           numericInput("reg", label = h4("UNOS Region"), value = 5, min = 1, max = 11, step = 1),
           selectInput("retxp", label = h4("Re-transplant"), choices = list("No" = 0, "Yes" = 1), selected = 0)
           
    ), #column
    column(4, 
           
           selectInput("nc", label = h4("Non-compliance"), choices = list("No" = 0, "Yes" = 1), selected = 0),           
           selectInput("cni", label = h4("Calcineurin Inhibitor at Discharge"), choices = list("Tac" = 1, "Csa" = 2, "Csa + Tac" = 4), selected = 1),  
           selectInput("txm", label = h4("T-cell Crossmatch"), choices = list("No" = 0, "Yes" = 1), selected = 0),
           selectInput("pra", label = h4("PRA Missing"), choices = list("No" = 0, "Yes" = 1), selected = 0),
           selectInput("hladr", label = h4("HLA-DR Mismatch"), choices = list("0 Antigens" = 0, "1 Antigen" = 1, "2 Antigens" = 2), selected = 0),
           actionButton("run", label = "Run Model"),
           actionButton("reset", label = "Reset Model")     
           
    ), #column
    column(4,
           
           h3("Risk of treated rejection is:"),
           verbatimTextOutput("risk"),
           h3("The observed risk of treated rejection in the training set was:"),
           verbatimTextOutput("train"),           
           h3("The observed risk of treated rejection in the test set was:"),
           verbatimTextOutput("test")  
    ) #column
  ), #fluidRow
  fluidRow(
    h5("Please see Kransdorf and colleagues for full derivation and validation of this model.")
  ) #fluidRow
)) #Shiny
