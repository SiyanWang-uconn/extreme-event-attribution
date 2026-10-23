args<-commandArgs(FALSE);script<-sub('^--file=','',args[grepl('^--file=',args)][1]);setwd(dirname(normalizePath(script)))
r<-read.csv('results.csv');r<-r[r$reference=='2003-like',]
ref<-data.frame(index=c('Tx3x','Tx3x','Tn3x','Tn3x'),season=c('Annual','June','Annual','June'),intensity_change=c(1.66,1.90,.96,1.31),intensity_low=c(.82,.93,.31,.78),intensity_high=c(2.84,3.10,1.66,1.84),dataset='Report synthesis')
cols<-c('Report synthesis'='#182A39',ERA5='#D89000',CPC='#CB593C','E-OBS'='#187B84',Berkeley='#6554A4')
pdf('intensity_comparison.pdf',width=12,height=4.5,family='Helvetica',pointsize=12)
par(mfrow=c(1,2),mar=c(4.4,8,2.3,.5),las=1,bty='n')
for(sea in c('Annual','June')){
 d<-rbind(ref[ref$season==sea,],r[r$season==sea,names(ref)])
 d<-d[order(match(d$index,c('Tx3x','Tn3x')),match(d$dataset,names(cols))),];y<-rev(seq_len(nrow(d)))
 plot(NA,xlim=c(0,3.35),ylim=c(.5,8.5),yaxt='n',xlab='Intensity change (degrees C)',ylab='',main=sea)
 abline(v=seq(0,3,.5),col='#E6E8EB');abline(h=3.5,col='#E6E8EB')
 axis(2,at=y,labels=paste(d$index,sub('Report synthesis','Report',d$dataset)),tick=FALSE,cex.axis=.88)
 segments(d$intensity_low,y,d$intensity_high,y,col=cols[d$dataset],lwd=2)
 points(d$intensity_change,y,pch=ifelse(d$dataset=='Report synthesis',18,19),col=cols[d$dataset],cex=1.25)
}
dev.off()
write.csv(ref,'report_table2_intensity_2003.csv',row.names=FALSE)
