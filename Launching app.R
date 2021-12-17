install.packages('rsconnect')


rsconnect::setAccountInfo(name='easil',
                          token='B24D60F795B48D7734851196897CA395',
                          secret='CninMBORSTVm28zIy/bgAaugM9tOyJub7DnlZC+t')


library(rsconnect)
rsconnect::deployApp()
