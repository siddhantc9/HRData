library(shiny)
library(shinythemes)
library(readxl)
function(input, output) {
    output$txtout <- renderText({
        paste(input$txt, input$slider, format(input$date), sep = ", ")
    })
    
    acceptedFileType <- eventReactive(input$trainModel,{
        c("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
          "text/csv")
    })
    
    staffBackground <- eventReactive(input$trainModel,{
        inFile <- input$staffBackground
        if(is.null(inFile)){
            return(NULL)
        } else {
            o <- is.element(inFile$type, acceptedFileType())
            validate(need(o,'Staff Background file can be either in Excel or CSV format'))
            if(inFile$type %in% acceptedFileType()[1]){
                file.rename(inFile$datapath, paste(inFile$datapath,".xlsx", sep = ""))
                dataFile <- read_excel(paste(inFile$datapath,".xlsx", sep = ""), sheet=1)
            }else{
                dataFile <- read.csv(inFile$datapath, header = T)
            }
        }
        return(dataFile)
    })
    
    staffEducation <- eventReactive(input$trainModel,{
        inFile <- input$staffEducation
        if(is.null(inFile)){
            return(NULL)
        } else {
            o <- is.element(inFile$type, acceptedFileType())
            validate(need(o,'Staff Education file can be either in Excel or CSV format'))
            if(inFile$type %in% acceptedFileType()[1]){
                file.rename(inFile$datapath, paste(inFile$datapath,".xlsx", sep = ""))
                dataFile <- read_excel(paste(inFile$datapath,".xlsx", sep = ""), sheet=1)
            }else{
                dataFile <- read.csv(inFile$datapath, header = T)
            }
        }
        return(dataFile)
    })
    
    experience <- eventReactive(input$trainModel,{
        inFile <- input$experience
        if(is.null(inFile)){
            return(NULL)
        } else {
            o <- is.element(inFile$type, acceptedFileType())
            validate(need(o,'Experience file can be either in Excel or CSV format'))
            if(inFile$type %in% acceptedFileType()[1]){
                file.rename(inFile$datapath, paste(inFile$datapath,".xlsx", sep = ""))
                dataFile <- read_excel(paste(inFile$datapath,".xlsx", sep = ""), sheet=1)
            }else{
                dataFile <- read.csv(inFile$datapath, header = T)
            }
        }
        return(dataFile)
    })
    
    incompanyPerformance <- eventReactive(input$trainModel,{
        inFile <- input$incompanyPerformance
        if(is.null(inFile)){
            return(NULL)
        } else {
            o <- is.element(inFile$type, acceptedFileType())
            validate(need(o,'Incompany Performance file can be either in Excel or CSV format'))
            if(inFile$type %in% acceptedFileType()[1]){
                file.rename(inFile$datapath, paste(inFile$datapath,".xlsx", sep = ""))
                dataFile <- read_excel(paste(inFile$datapath,".xlsx", sep = ""), sheet=1)
            }else{
                dataFile <- read.csv(inFile$datapath, header = T)
            }
        }
        return(dataFile)
    })
    
    output$table <- renderTable({
        head(staffBackground())
        head(staffEducation())
        head(experience())
        head(incompanyPerformance())
    })
}