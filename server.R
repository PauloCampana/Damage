library(shiny)
shinyServer(function(input, output, session) {
    
    critdaverage <- reactive({
               50 +
           2 * input$critdmedium                                                                    +
           8 * input$critdfinesse                                                                   +
          10 * input$critdbackstabber                                                               +
         0.1 * input$critdupminorforce * input$critdminorforce                                      +
               input$critdupkilt * input$critdkilt                                                  +
          10 * input$critdnightblade                                                                +
         0.1 * input$critdupwarden * input$critdwarden                                              +
         0.2 * input$critdupmajorforce * input$critdmajorforce                                      +
         0.1 * input$critdupminorbrittle * input$critdminorbrittle                                  +
        0.05 * input$critdcatalyst * (input$critdupflame + input$critdupfrost + input$critdupshock) +
               input$critdshadow * (input$critdupshadow + 10)                                       +
         0.2 * input$critdupmajorbrittle * input$critdmajorbrittle                                  +
          12 * input$critdkhajiit                                                                   +
          12 * input$critdsulxan                                                                    +
           8 * input$critdorderwrath                                                                +
               input$critdextra
    })
    critdmaximum <- reactive({
               50 +
           2 * input$critdmedium                              +
           8 * input$critdfinesse                             +
          10 * input$critdbackstabber                         +
          10 * input$critdminorforce                          +
          10 * input$critdkilt                                +
          10 * input$critdnightblade                          +
          10 * input$critdwarden                              +
          20 * input$critdmajorforce                          +
          10 * input$critdminorbrittle                        +
          15 * input$critdcatalyst                            +
               input$critdshadow * (input$critdupshadow + 10) +
          20 * input$critdmajorbrittle                        +
          12 * input$critdkhajiit                             +
          12 * input$critdsulxan                              +
           8 * input$critdorderwrath                          +
               input$critdextra
    })
    output$critdaverage <- reactive(paste(critdaverage(), "%", sep = ""))
    output$critdmaximum <- reactive(paste(critdmaximum(), "%", sep = ""))
    output$critdincrease <- reactive(paste(
        round(175 / (1 + 0.006 * min(critdaverage(), 125)) - 100, 4),
        "%", sep = ""
    ))

    penaverage <- reactive({
          939 * input$penlight                                              +
          700 * input$pencp                                                 +
         1500 * input$pennecro                                              +
         2974 * input$pennb                                                 +
         1487 * input$penuppc * input$penpc                                 +
         1650 * input$penupmace * input$penmace                             +
         1638 * input$penupsharpened * input$pensharpened                   +
          660 * input$penupnature * input$pennature                         +
        59.48 * input$penupmajorbreach * input$penmajorbreach               +
        29.74 * input$penupminorbreach * input$penminorbreach               +
         0.01 * input$penupcrusher * switch(
                    input$pencrusher,
                    "2108 - 2H Infused" = 2108, "1054 - 1H Infused" = 1054,
                    "1622 - 2H" = 1622, "811 - 1H" = 811, "None" = 0
                )                                                           +
         0.08 * input$penuptremor * input$pentremor                         +
           10 * input$penupcrystal * input$pencrystal                       +
        35.41 * input$penupcrimson * input$pencrimson                       +
                input$penupalkosh * input$penalkosh                         +
         2744 * input$penlover * (1 + input$penuplover * 0.091)             +
        13.20 * input$penuppoison * input$penpoison                         +
          950 * input$penbosmer                                             +
         1190 * input$penarena                                              +
                input$penextra
    })
    penmaximum <- reactive({
          939 * input$penlight                                              +
          700 * input$pencp                                                 +
         1500 * input$pennecro                                              +
         2974 * input$pennb                                                 +
         1487 * input$penuppc * input$penpc                                 +
         1650 * input$penupmace * input$penmace                             +
         1638 * input$penupsharpened * input$pensharpened                   +
          660 * input$penupnature * input$pennature                         +
         5948 * input$penmajorbreach                                        +
         2974 * input$penminorbreach                                        +
                switch(
                    input$pencrusher,
                    "2108 - 2H Infused" = 2108, "1054 - 1H Infused" = 1054,
                    "1622 - 2H" = 1622, "811 - 1H" = 811, "None" = 0
                )                                                           +
         0.08 * input$penuptremor * input$pentremor                         +
         1000 * input$pencrystal                                            +
         3541 * input$pencrimson                                            +
                input$penupalkosh * input$penalkosh                         +
         2744 * input$penlover * (1 + input$penuplover * 0.091)             +
         1320 * input$penpoison                                             +
          950 * input$penbosmer                                             +
         1190 * input$penarena                                              +
                input$penextra
    })
    output$penaverage <- reactive(round(penaverage(), 0))
    output$penmaximum <- reactive(round(penmaximum(), 0))
    output$penincrease <- reactive(paste(
        round(5000000 / (31800 + min(round(penaverage(), 0), 18200)) - 100, 4),
        "%", sep = ""
    ))
})