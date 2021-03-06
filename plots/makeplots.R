setwd("/home/asalcedo/SMC-HET-Paper1//Subchallenge1 plots")
library(ggplot2)
da = read.csv("scoring1A_behavior.tsv",sep="\t",header=FALSE)
colnames(da) = c("Real","Pred","Error")
png(file="1A.png")
ggplot(da,aes(x=Pred,y=Error,color=as.factor(Real))) + geom_point() + xlab("Predicted Cellularity") + 
ylab("Cellularity Error") + scale_color_discrete(name="Actual Cellularity") + ggtitle("1A Scoring")
dev.off()

db = read.csv("scoring1B_behavior.tsv",sep="\t",header=FALSE)
colnames(db) = c("Real","Pred","Error")
png(file="1B.png")
ggplot(db,aes(x=Pred,y=Error,color=as.factor(Real))) + geom_point() + geom_line() + xlab("Predicted Number of Clusters") + 
ylab("Cluster Error") + scale_color_discrete(name="Actual Number of Clusters") + ggtitle("1B Scoring")
dev.off()

d = read.csv("scoring1C_phi_sys_behavior.tsv",sep="\t",header=FALSE)
colnames(d) = c("Error","Metric")
png(file="1C_phi_systematic.png")
ggplot(d,aes(x=Error,y=Metric)) + geom_point() + xlab("Systematic Phi Error") + ylab("1C Metric") + 
ggtitle("Systematic Phi Error")
dev.off()

d = read.csv("scoring1C_phi_ZM_behavior.tsv",sep="\t",head=FALSE)
colnames(d) = c("Concentration","PhisUsed","Metric")
png(file="1C_phi_ZM.png")
ggplot(d, aes(x=as.ordered(Concentration), y=as.numeric(Metric))) + 
 geom_jitter(aes(color=as.ordered(Concentration)),position = position_jitter(height = 0, width=0.05)) +
stat_summary(fun.y=median, fun.ymin=median, fun.ymax=median, geom="crossbar", width=0.7) +
theme(legend.position="none") + xlab("Concentration Parameter") + ylab("1C Metric") + 
ggtitle("Zero-mean Phi Noise")
dev.off()

d = read.csv(file="scoring1C_nssm_behavior.tsv", sep="\t",header=FALSE)
colnames(d) = c("Concentration","NssmsUsed","Metric")
png(file="1C_nssms_ZM.png")
ggplot(d, aes(x=as.ordered(Concentration), y=as.numeric(Metric))) + 
 geom_jitter(aes(color=as.ordered(Concentration)),position = position_jitter(height = 0, width=0.05)) +
stat_summary(fun.y=median, fun.ymin=median, fun.ymax=median, geom="crossbar", width=0.7) +
theme(legend.position="none") + xlab("Concentration Parameter") + ylab("1C Metric") +
ggtitle("Zero-mean N_ssms Noise")
dev.off()

d = read.csv(file="scoring1C_cases.tsv", sep="\t",header=FALSE)
colnames(d) = c("Case","Metric")
png(file="1C_Cases.png")
ggplot(d,aes(y=1-Metric,x=as.factor(Case))) + 
geom_bar(aes(fill=as.factor(Case)),stat="identity",width=.6) + 
theme(legend.position="none") + ylab("1 - 1C Metric") +
xlab("Case") + ggtitle("1C Cases") + coord_flip()
dev.off()

d = read.csv(file="scoring2A_cases.tsv", sep="\t",header=FALSE)
colnames(d) = c("Case","Metric")
png(file="2A_Cases.png")
ggplot(d,aes(y=Metric,x=as.factor(Case))) + 
geom_bar(aes(fill=as.factor(Case)),stat="identity",width=.6) + 
theme(legend.position="none") + ylab("2 Metric") +
xlab("Case") + ggtitle("2A Cases") + coord_flip()
dev.off()

d = read.csv("scoring2A_random_reassignment.tsv",sep="\t",header=FALSE)
colnames(d) = c("Error","Metric")
png(file="2A_random.png")
ggplot(d, aes(x=as.ordered(Error), y=as.numeric(Metric))) + 
 geom_jitter(aes(color=as.ordered(Error)),position = position_jitter(height = 0, width=0.05)) +
stat_summary(fun.y=median, fun.ymin=median, fun.ymax=median, geom="crossbar", width=0.7) +
theme(legend.position="none") + xlab("Error Probability") + ylab("2 Metric") + 
ggtitle("2A Random Error")
dev.off()

d = read.csv("scoring2A_closest_reassignment.tsv",sep="\t",header=FALSE)
colnames(d) = c("Error","Metric")
png(file="2A_closest.png")
ggplot(d, aes(x=as.ordered(Error), y=as.numeric(Metric))) + 
 geom_jitter(aes(color=as.ordered(Error)),position = position_jitter(height = 0, width=0.05)) +
stat_summary(fun.y=median, fun.ymin=median, fun.ymax=median, geom="crossbar", width=0.7) +
theme(legend.position="none") + xlab("Error Probability") + ylab("2 Metric") + 
ggtitle("2A Closest Error")
dev.off()

d = read.csv("scoring2B_beta.tsv",sep="\t",header=FALSE)
colnames(d) = c("Error","Metric")
png(file="2B_beta.png")
ggplot(d, aes(x=as.ordered(Error), y=as.numeric(Metric))) + 
 geom_jitter(aes(color=as.ordered(Error)),position = position_jitter(height = 0, width=0.05)) +
stat_summary(fun.y=median, fun.ymin=median, fun.ymax=median, geom="crossbar", width=0.7) +
theme(legend.position="none") + xlab("Concentration Parameter") + ylab("2 Metric") + 
ggtitle("2B Beta Noise")
dev.off()
