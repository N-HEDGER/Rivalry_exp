

setwd("/Users/nicholashedger/Google\ Drive/Current_proj/Rivalry/Data/deqx")


x=read.table('kris.txt',sep=',')

colnames(x)=c("Trialnum","Stimtype","Congruency","stimnum","Orientation","RG","Speed","congresp","RT")


x$Stimtype=factor(x$Stimtype,levels=c(1,2),labels=c("Face","House"))

x$Orientation=factor(x$Orientation,levels=c(1,2),labels=c("Horizontal","Vertical"))

x$Observer=factor(x$Observer,levels=c(1,2),labels=c("P1","P2"))

x$Speed=factor(x$Speed)

ggplot(x,aes(x=Speed,y=RT))+geom_point()+theme_classic()


x$correct=ifelse(x$Congruency==x$congresp,1,0)

binomial_smooth <- function(...) {
  geom_smooth(method = "glm", method.args = list(family = "binomial"), ...)
}



ggplot(x,aes(x=Speed,y=correct))+theme_classic()+geom_rect(ymin=0.68,ymax=1,fill="gray90",colour='gray90',alpha=.2,xmin=0,xmax=6)+binomial_smooth()+facet_grid(Orientation~Stimtype)+stat_summary(fun.data = "mean_cl_boot", size = 1,position=position_jitter(w=0.2))+
  ylab("Accuracy")+geom_hline(yintercept=0.5,linetype='dotted')
p



