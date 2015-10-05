library(shiny)
library(glmnet)
library(car.model)

shinyServer(function(input, output, session) {
  
  
  
  observeEvent(input$run, {
        
  }) #Run
  
  observeEvent(input$reset, {
    
    updateNumericInput(session, "age", value = 40)
    updateSelectInput(session, "eth", selected = 1)      
    updateNumericInput(session, "creat", value = 0.8)  
    updateNumericInput(session, "year", value = 2015)
    updateNumericInput(session, "reg", value = 5)
    updateSelectInput(session, "retxp", selected = 0)
    updateSelectInput(session, "nc", selected = 0)
    updateSelectInput(session, "cni", selected = 1)
    updateSelectInput(session, "txm", selected = 0)
    updateSelectInput(session, "pra", selected = 0)
    updateSelectInput(session, "hladr", selected = 0)
    
  }) #Reset  
  
  
  prediction <- reactive({
    ###evan here is the format and you can use input$cni for example to fill in
    ###given that some of levels have 3 for the reference in the model, you will have to do
    ###levels = c(3,1,2,3,4) in the factor specification
    ###I can do this for you if you give me some more details on the data.  Right now I don't have quite enough
    newdata <- data.frame(
      CMV_MM=factor(1,levels=c(1:5)),
      DIAG=factor(1,levels=c(1:6)),
      ETHCAT=factor(1,levels = c(1,2,4,5)),
      ETHCAT_DON=factor(1,levels = c(1,2,4,5)),
      GENDER_TR=factor(1,levels = c(1:4)),
      PREV_TXY=0,
      REGION=factor(1,levels = c(1:11)),
      nc=as.factor(1,levels(1,2)),
      INDUCT=0,
      CNI=input$cni,
      PROLIF=0,
      T=0,
      B=0,
      FPRA=0,
      AGE_TR1=0,
      AGE_TR2=0,
      AGE_DON_TR1=0,
      AGE_DON_TR2=0,
      CREAT_TR1=0,
      CREAT_TR2=0,
      BMI_DON_CALC=0,
      ISCHTIME=0,
      TX_YEAR=0,
      AMIS=0,
      BMIS=0,
      DRMIS=0)
    
    data <- model.matrix(f.NULL,data=newdata)
    out <- predict(fit.NULL,newx = data)
    return(out)
  })
  
  
  
  output$risk <- renderPrint({ paste0(data$risk) })
  output$risk <- renderPrint({ paste0(data$train) })
  output$risk <- renderPrint({ paste0(data$test) })
  
})
