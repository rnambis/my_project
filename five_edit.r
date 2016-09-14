#Just a test
loc<-read.csv("/home/rohit/ALDA/HW1/locations.csv")[2:3]
head(loc)
p<-c(mean(loc[,2]),mean(loc[,1]))
#p[2]
cos_dist<-vector()

for(i in 1:nrow(loc))
{
  a=p[1]*loc$lat[i]+p[2]*loc$long[i];
  b=sqrt(p[1]^2+p[2]^2);
  c=sqrt((loc$lat[i])^2+(loc$long[i])^2);
  cos_dist[i]=1-a/(b*c);
}
head(loc);
head(cos_dist);
loc_cos<-cbind(loc[,2],loc[,1],cos_dist);
head(loc_cos);

plot_cos<-head(loc_cos[order(loc_cos[,3]),],10);
plot(x=plot_cos[,1],y=plot_cos[,2],xlim=c(37,37.7),ylim=c(-80,-78),xlab="Latitude",ylab="Longitude",main = "Cosine Distance");
for (i in 1:nrow(plot_cos)) {
  lines(c(p[1],plot_cos[i,1]),c(p[2],plot_cos[i,2]))
}
text(c(p[1]),c(p[2]),"X",col = "red")
