## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  require(fortedata),
  require(ggplot2),
  require(viridis)
)


## ----observations, fig.height=4, fig.width=6, message=FALSE, warning=FALSE----
no_of_records.df <- fd_observations()

no_of_records <- subset(no_of_records.df, table == 'fd_canopy_structure' | table == 'fd_hemi_camera')


ggplot2::ggplot(no_of_records, ggplot2::aes(x = as.factor(month), y = as.integer(year), fill= no_of_obs)) +
  ggplot2::geom_tile(ggplot2::aes(fill = no_of_obs), color = "black") +
  ggplot2::geom_text(ggplot2::aes(label = no_of_obs), color = "white") +
  ggplot2::coord_equal()+
  ggplot2::scale_fill_gradient(low = "#450d54", high = "#450d54", na.value = 'white')+
  ggplot2::scale_y_reverse()+
  ggplot2::theme_minimal()+
  ggplot2::theme(legend.position = "none")+
  ggplot2::ylab("Year")+
  ggplot2::xlab("Month")+
  ggplot2::ggtitle(paste("Figure 1: No. of observations currently available \nin each remote sensing function as of:", Sys.Date()))+
  ggplot2::facet_grid(table ~ .,  space = "free")+
  ggplot2::theme(strip.text.y = element_text(size = 9), strip.background = element_rect(
    color="black", fill="white", size= 0.5, linetype="solid"))


## ----fd_canopy_structure------------------------------------------------------
data.frame(fd_canopy_structure_summary())

## ----rug, fig.height = 4, fig.width = 6, fig.align = "center"-----------------
x <- fd_canopy_structure()

ggplot2::ggplot(x, aes(y = rugosity, x = replicate, fill = as.factor(replicate)))+
  ggplot2::geom_boxplot()+
  ggplot2::xlab("Replicate")+
  ggplot2::ylab("Canopy Rugosity [m]")+
  theme_minimal()+
  viridis::scale_color_viridis(discrete = TRUE, option = "D")+
  viridis::scale_fill_viridis(discrete = TRUE)+
    ggplot2::ggtitle(paste("Figure 2:  Canopy rugosity, a measure of canopy structural \n complexity by replicate, by year"))+
  theme(legend.position = "NONE")+
  ggplot2::facet_grid(.~year)


## ----fd_hemi_camera-----------------------------------------------------------
fd_hemi_camera()

## ----cam, fig.width = 6, fig.asp = .65----------------------------------------
x <- fd_hemi_camera()

ggplot(x, aes(y = lai_cam, x = replicate, fill = as.factor(replicate)))+
  geom_boxplot()+
  xlab("Replicate")+
  ylab("Leaf Area Index")+
  theme_minimal()+
  viridis::scale_color_viridis(discrete = TRUE, option = "D")+
  viridis::scale_fill_viridis(discrete = TRUE)+
      ggplot2::ggtitle(paste("Figure 3:  Leaf area index (LAI) dervied from \nhemispherical camera imagery by replicate"))+
  theme(legend.position = "NONE")


## ----fd_ceptometer------------------------------------------------------------
fd_ceptometer()

## ----light, fig.width = 6, fig.asp = .65--------------------------------------
x <- fd_ceptometer()

ggplot(x, aes(y = fapar, x = replicate, fill = as.factor(replicate)))+
  geom_boxplot()+
  xlab("Replicate")+
  ylab("faPAR")+
  theme_minimal()+
  viridis::scale_color_viridis(discrete = TRUE, option = "D")+
  viridis::scale_fill_viridis(discrete = TRUE)+
      ggplot2::ggtitle(paste("Figure 4:  Fraction of absorbed photosynthetically available \nradiation in units of umol per m^2 per s^-1"))+
  theme(legend.position = "NONE")


