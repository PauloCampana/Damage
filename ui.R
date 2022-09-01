library(shiny)
shinyUI(fluidPage(navbarPage(
    title = strong("Anntauri"),
    windowTitle = "Anntauri",
    position = c("fixed-top"), 
    collapsible = TRUE,
    tags$style(type="text/css", "body {padding-top: 70px;}"),
    
    #{tabPanel(strong("Overview"),
    #    sidebarPanel(fileInput("csv.input", "Import Build", accept = ".csv")),
    #    mainPanel()
    #)},
    
    #{tabPanel(strong("Spell Damage"))},
    #{tabPanel(strong("Max Magicka"))},
    #{tabPanel(strong("Critical Chance"))},
    
    # critical damage
    {
    tabPanel(strong("Critical Damage"),
        fluidRow(
            column(width = 4, h2("Average critical damage:"), textOutput("critdaverage", container = h3)),
            column(width = 4, h2("Maximum critical damage:"), textOutput("critdmaximum", container = h3)),
            column(width = 4, h2("Damage increase at 125%:"), textOutput("critdincrease", container = h3))
        ),
        hr(),
        fluidRow(
            column(width = 4,
                h2(helpText("Player")),
                strong(helpText("50% - Base")),
                sliderInput(
                    "critdmedium", value = 1, min = 0, max = 7, post = "pc",
                    img(src = "critd/medium.png", width = 24, height = 24, "2% - Medium armour")
                ),
                checkboxInput(
                    "critdfinesse", value = TRUE,
                    img(src = "critd/cp.png", width = 24, height = 24, strong("8% - Fighting finesse"))
                ),
                checkboxInput(
                    "critdbackstabber", value = TRUE,
                    img(src = "critd/cp.png", width = 24, height = 24, strong("10% - Backstabber"))
                ),
                checkboxInput(
                    "critdminorforce", value = TRUE,
                    img(src = "critd/minorforce.png", width = 24, height = 24, strong("10% - Minor force"))
                ),
                conditionalPanel(
                    condition = "input.critdminorforce",
                    sliderInput("critdupminorforce", value = 90, min = 0, max = 100, post = "%", ticks = FALSE, "Uptime")
                ),
                checkboxInput(
                    "critdkilt", value = TRUE,
                    img(src = "critd/kilt.png", width = 24, height = 24, strong("10% - Harpooner's wading kilt"))
                ),
                conditionalPanel(
                    condition = "input.critdkilt",
                    sliderInput(
                        "critdupkilt", value = 8, min = 0, max = 10, post = " stacks",
                        img(src = "critd/upkilt.png", width = 24, height = 24, " Average stacks")
                    )
                ),
                checkboxInput(
                    "critdnightblade", value = FALSE,
                    img(src = "critd/nightblade.png", width = 24, height = 24, strong("10% - Nightblade or Templar passive"))
                ),
                checkboxInput(
                    "critdwarden", value = FALSE,
                    img(src = "critd/warden.png", width = 24, height = 24, strong("10% - Warden passive"))
                ),
                conditionalPanel(
                    condition = "input.critdwarden",
                    sliderInput(
                        "critdupwarden", value = 80, min = 0, max = 100, post = "%", ticks = FALSE,
                        img(src = "critd/chilled.png", width = 24, height = 24, " Uptime")    
                    )
                )
            ),
            column(width = 4,
                h2(helpText("Group")),
                checkboxInput(
                    "critdmajorforce", value = TRUE,
                    img(src = "critd/majorforce.png", width = 24, height = 24, strong("20% - Major force"))
                ),
                conditionalPanel(
                    condition = "input.critdmajorforce",
                    sliderInput("critdupmajorforce", value = 40, min = 0, max = 100, post = "%", ticks = FALSE, "Uptime")
                ),
                checkboxInput(
                    "critdminorbrittle", value = TRUE, 
                    img(src = "critd/minorbrittle.png", width = 24, height = 24, strong("10% - Minor brittle"))
                ),
                conditionalPanel(
                    condition = "input.critdminorbrittle",
                    sliderInput("critdupminorbrittle", value = 80, min = 0, max = 100, post = "%", ticks = FALSE, "Uptime")
                ),
                checkboxInput(
                    "critdcatalyst", value = TRUE,
                    img(src = "critd/catalyst.png", width = 24, height = 24, strong("15% - Elemental catalyst"))
                ),
                conditionalPanel(
                    condition = "input.critdcatalyst",
                    list(
                        sliderInput(
                            "critdupflame",  value = 97, min = 0, max = 100, post = "%", ticks = FALSE,
                            img(src = "critd/cataflame.png", width = 24, height = 24, " Uptime")
                        ),
                        sliderInput(
                            "critdupfrost",  value = 93, min = 0, max = 100, post = "%", ticks = FALSE,
                            img(src = "critd/catafrost.png", width = 24, height = 24, " Uptime")
                        ),
                        sliderInput(
                            "critdupshock",  value = 85, min = 0, max = 100, post = "%", ticks = FALSE,
                            img(src = "critd/catashock.png", width = 24, height = 24, " Uptime")
                        )
                    )
                )
            ),
            column(width = 4,
                h2(helpText("Other")),
                checkboxInput(
                    "critdshadow", value = FALSE,
                    img(src = "critd/shadow.png", width = 24, height = 24, strong("17% - Shadow mundus"))
                ),
                conditionalPanel(
                    condition = "input.critdshadow",
                    sliderInput(
                        "critdupshadow", value = 7, min = 0, max = 7, post = " divines", 
                        img(src = "critd/divines.png", width = 24, height = 24, "Divines pieces")
                    )
                ),
                checkboxInput(
                    "critdmajorbrittle", value = FALSE, 
                    img(src = "critd/majorbrittle.png", width = 24, height = 24, strong("20% - Major brittle"))
                ),
                conditionalPanel(
                    condition = "input.critdmajorbrittle",
                    sliderInput("critdupmajorbrittle", value = 25, min = 0, max = 100, post = "%", ticks = FALSE, "Uptime")
                ),
                checkboxInput(
                    "critdkhajiit", value = FALSE,
                    img(src = "critd/khajiit.png", width = 24, height = 24, strong("12% - Khajiit passive"))
                ),
                checkboxInput(
                    "critdsulxan", value = FALSE,
                    img(src = "critd/sulxan.png", width = 24, height = 24, strong("12% - Sul-Xan's torment"))
                ),
                checkboxInput(
                    "critdorderwrath", value = FALSE,
                    img(src = "critd/orderwrath.png", width = 24, height = 24, strong("8% - Order's wrath"))
                ),
                numericInput("critdextra", "Extra", value = 0),
            )
        )
    )
    },
    
    # penetration
    {
    tabPanel(strong("Penetration"),
        fluidRow(
            column(width = 4, h2("Average penetration:"), textOutput("penaverage", container = h3)),
            column(width = 4, h2("Maximum penetration:"), textOutput("penmaximum", container = h3)),
            column(width = 4, h2("Damage increase at 18200:"), textOutput("penincrease", container = h3))
        ),
        hr(),
        fluidRow(
            column(width = 4,
                h2(helpText("Player")),
                sliderInput(
                    "penlight", value = 6, min = 0, max = 7, post = " pieces",
                    img(src = "pen/light.png", width = 24, height = 24, "939 - Light armour")
                ),                
                checkboxInput(
                    "pencp", value = TRUE,
                    img(src = "pen/cp.png", width = 24, height = 24, strong("700 - Champion passive"))
                ),
                checkboxInput(
                    "pennecro", value = FALSE,
                    img(src = "pen/necro.png", width = 24, height = 24, strong("1500 - Necromancer passive"))
                ),
                checkboxInput(
                    "pennb", value = FALSE,
                    img(src = "pen/nb.png", width = 24, height = 24, strong("2974 - Nightblade passive"))
                ),
                checkboxInput(
                    "penpc", value = FALSE,
                    img(src = "pen/pc.png", width = 24, height = 24, strong("1487 - 1pc penetration"))
                ),
                conditionalPanel(
                    condition = "input.penpc",
                    sliderInput("penuppc", value = 1, min = 0, max = 5, post = " sets", "Penetration sets")
                ),
                checkboxInput(
                    "penmace", value = FALSE,
                    img(src = "pen/mace.png", width = 24, height = 24, strong("1650 - Maces or mauls"))
                ),
                conditionalPanel(
                    condition = "input.penmace",
                    sliderInput("penupmace", value = 1, min = 0, max = 2, post = " maces", "Maces (2 for 2H)")
                ),
                checkboxInput(
                    "pensharpened", value = FALSE,
                    img(src = "pen/sharpened.png", width = 24, height = 24, strong("1638 - Sharpened trait"))
                ),
                conditionalPanel(
                    condition = "input.pensharpened",
                    sliderInput("penupsharpened", value = 1, min = 0, max = 2, post = " traits", "Sharpened (2 for 2H)")
                ),
                checkboxInput(
                    "pennature", value = FALSE,
                    img(src = "pen/cp.png", width = 24, height = 24, strong("660 - Force of nature"))
                ),
                conditionalPanel(
                    condition = "input.pennature",
                    sliderInput("penupnature", value = 3, min = 0, max = 8, post = " effects", "Average status effects")
                )
            ), 
            column(width = 4,
                h2(helpText("Group")),
                checkboxInput(
                    "penmajorbreach", value = TRUE,
                    img(src = "pen/majorbreach.png", width = 24, height = 24, strong("5948 - Major breach"))
                ),
                conditionalPanel(
                    condition = "input.penmajorbreach",
                    sliderInput("penupmajorbreach", value = 99, min = 0, max = 100, post = "%", ticks = FALSE, "Uptime")
                ),
                checkboxInput(
                    "penminorbreach", value = TRUE,
                    img(src = "pen/minorbreach.png", width = 24, height = 24, strong("2974 - Minor breach"))
                ),
                conditionalPanel(
                    condition = "input.penminorbreach",
                    sliderInput("penupminorbreach", value = 99, min = 0, max = 100, post = "%", ticks = FALSE, "Uptime")
                ),
                selectInput(
                    "pencrusher", selected = "2108 - 2H Infused",
                    img(src = "pen/crusher.png", width = 24, height = 24, strong("Crusher enchant")), 
                    choices = c("2108 - 2H Infused", "1054 - 1H Infused",
                                "1622 - 2H", "811 - 1H", "None")
                ),
                conditionalPanel(
                    condition = "input.pencrusher != 'None'",
                    sliderInput("penupcrusher", value = 90, min = 0, max = 100, post = "%", ticks = FALSE, "Uptime")
                ),
                checkboxInput(
                    "pentremor", value = FALSE,
                    img(src = "pen/tremor.png", width = 24, height = 24, strong("2400 - Tremorscale"))
                ),
                conditionalPanel(
                    condition = "input.pentremor",
                    sliderInput("penuptremor", value = 30000, min = 20000, max = 33000, ticks = FALSE, "Resistances")
                ),
                checkboxInput(
                    "pencrystal", value = FALSE,
                    img(src = "pen/crystal.png", width = 24, height = 24, strong("1000 - Crystal weapon"))
                ),
                conditionalPanel(
                    condition = "input.pencrystal",
                    sliderInput("penupcrystal", value = 90, min = 0, max = 100, post = "%", ticks = FALSE, "Uptime")
                ),
                checkboxInput(
                    "pencrimson", value = FALSE,
                    img(src = "pen/crimson.png", width = 24, height = 24, strong("3541 - Crimson oath"))),
                conditionalPanel(
                    condition = "input.pencrimson",
                    sliderInput("penupcrimson", value = 90, min = 0, max = 100, post = "%", ticks = FALSE, "Uptime")
                ),
                checkboxInput(
                    "penalkosh", value = FALSE,
                    img(src = "pen/alkosh.png", width = 24, height = 24, strong("6000 - Alkosh"))),
                conditionalPanel(
                    condition = "input.penalkosh",
                    numericInput("penupalkosh", value = 6000, min = 0, max = 6000, step = 100, "Weapon damage")
                )
            ),
            column(width = 4,
                h2(helpText("Other")),
                checkboxInput(
                    "penlover", value = FALSE,
                    img(src = "pen/lover.png", width = 24, height = 24, strong("4491 - Lover mundus"))
                ),
                conditionalPanel(
                    condition = "input.penlover",
                    sliderInput("penuplover", value = 7, min = 0, max = 7, post = " traits", "Divines pieces")
                ),
                checkboxInput(
                    "penpoison", value = FALSE,
                    img(src = "pen/poison.png", width = 24, height = 24, strong("1320 - Breach poison"))
                ),
                conditionalPanel(
                    condition = "input.penpoison",
                    sliderInput("penuppoison", value = 80, min = 0, max = 100, post = "%", ticks = FALSE, "Uptime")
                ),
                checkboxInput(
                    "penbosmer", value = FALSE,
                    img(src = "pen/bosmer.png", width = 24, height = 24, strong("950 - Wood elf passive"))
                ),
                checkboxInput(
                    "penarena", value = FALSE,
                    img(src = "pen/arena.png", width = 24, height = 24, strong("1190 - Arena 1pc penetration"))
                ),
                numericInput("penextra", "Extra", value = 0)
            )
        )
    )
    },
    
    #{tabPanel(strong("Modifiers"))}
)))