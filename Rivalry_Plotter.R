FRAME=read.table(file=file.choose(),sep=',')

setwd('/Users/nicholashedger/Documents/Rivalry/Data')

colnames(FRAME)=c("ps","trial","stimnum","stimtype","eye","colour","resp","Tstamp")


FRAME$Red=as.logical(ifelse(as.numeric(FRAME$resp)==2,1,0))
FRAME$Green=as.logical(ifelse(as.numeric(FRAME$resp)==1,1,0))
FRAME$Mixed=as.logical(ifelse(as.numeric(FRAME$resp)==3,1,0))

FRAME$trackloss=as.logical(ifelse(FRAME$Tstamp=="NA",1,0))

library(eyetrackingR)

ET_DATA <- make_eyetrackingr_data(FRAME, 
                                  participant_column = "ps",
                                  trial_column = "trial",
                                  time_column = "Tstamp",
                                  aoi_columns = c("Red","Green","Mixed"),
                                  treat_non_aoi_looks_as_missing = FALSE,trackloss_column="trackloss"
)

response_window_agg_by_sub <- make_time_window_data(ET_DATA, aois=c("Green","Red","Mixed"),summarize_by = "ps")

WINDOW_PLOT=plot(response_window_agg_by_sub)+ylab("Prop response")


library(png)
library(grid)
#img <- png::readPNG("./watermark.png")
#rast <- grid::rasterGrob(img.n, interpolate = T)



FRAME$Response=factor(FRAME$resp,levels=c(0,1,2,3),labels=c("No response","Red","Green","Mixed"))

library(readr)
pathsum='/Users/nicholashedger/Documents/Rivalry/Data/BHISMA_ims'
prefixsum='Trial'
filevec=list.files(path=pathsum,pattern=prefixsum,full.names = TRUE)
filevec=filevec[order(parse_number(filevec))]



library(ggplot2)
library(pracma)
plot_observer=function(FRAME,Observer,trial){
  
  img=png::readPNG(filevec[trial])
  rast <- grid::rasterGrob(img, interpolate = T)
  
  TS_PLOT=ggplot(FRAME[FRAME$ps==Observer & FRAME$trial==trial,],aes(x=Tstamp,y=as.numeric(Response)))+annotation_custom(rast, ymin = 3, ymax = 4, xmin = 0)+
theme_classic()+geom_linerange(aes(x=Tstamp,colour=Response),alpha=1,ymin=1,ymax=2.5)+scale_color_manual(values=c("gray45","red","green","yellow"))+xlab('Time')+ylab('Response')+
    ggtitle(paste('Trial ',num2str(trial)))
 
  print(TS_PLOT)
}


OBS_PLOT=plot_observer(FRAME,1,32)


library(drake)



setwd('/Users/nicholashedger/Documents/Rivalry')

rmarkdown::render(knitr_in("Rivalry_report.Rmd"),output_file = file_out("report_Rivalry.html"),quiet = TRUE)



