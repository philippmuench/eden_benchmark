require(ggplot2)

eden <- read.csv2("data/sample/normal/times_eden.txt")
fast <- read.table("data/sample/normal/times_fastcodeml-copy.txt", sep=";", header=T)

eden_2 <- as.data.frame(eden[which(eden$seq == 2),]$diff)
eden_3 <- as.data.frame(eden[which(eden$seq == 3),]$diff)
eden_4 <- as.data.frame(eden[which(eden$seq == 4),]$diff)
eden_5 <- as.data.frame(eden[which(eden$seq == 5),]$diff)
eden_6 <- as.data.frame(eden[which(eden$seq == 6),]$diff)
eden_7 <- as.data.frame(eden[which(eden$seq == 7),]$diff)
eden_8 <- as.data.frame(eden[which(eden$seq == 8),]$diff)

fast_2 <- as.data.frame(fast[which(fast$seq == 2),]$diff)
fast_3 <- as.data.frame(fast[which(fast$seq == 3),]$diff)
fast_4 <- as.data.frame(fast[which(fast$seq == 4),]$diff)
fast_5 <- as.data.frame(fast[which(fast$seq == 5),]$diff)
fast_6 <- as.data.frame(fast[which(fast$seq == 6),]$diff)
fast_7 <- as.data.frame(fast[which(fast$seq == 7),]$diff)
fast_8 <- as.data.frame(fast[which(fast$seq == 8),]$diff)

eden_2$num <- 2
eden_2$type <- "eden"
colnames(eden_2) <- c("time", "num", "type")

eden_3$num <- 3
eden_3$type <- "eden"
colnames(eden_3) <- c("time", "num", "type")

eden_4$num <- 4
eden_4$type <- "eden"
colnames(eden_4) <- c("time", "num", "type")

eden_5$num <- 5
eden_5$type <- "eden"
colnames(eden_5) <- c("time", "num", "type")

eden_6$num <- 6
eden_6$type <- "eden"
colnames(eden_6) <- c("time", "num", "type")

eden_7$num <- 7
eden_7$type <- "eden"
colnames(eden_7) <- c("time", "num", "type")

eden_8$num <- 8
eden_8$type <- "eden"
colnames(eden_8) <- c("time", "num", "type")

fast_2$num <- 2
fast_2$type <- "fastcodeml"
colnames(fast_2) <- c("time", "num", "type")

fast_3$num <- 3
fast_3$type <- "fastcodeml"
colnames(fast_3) <- c("time", "num", "type")

fast_4$num <- 4
fast_4$type <- "fastcodeml"
colnames(fast_4) <- c("time", "num", "type")

fast_5$num <- 5
fast_5$type <- "fastcodeml"
colnames(fast_5) <- c("time", "num", "type")

fast_6$num <- 6
fast_6$type <- "fastcodeml"
colnames(fast_6) <- c("time", "num", "type")

fast_7$num <- 7
fast_7$type <- "fastcodeml"
colnames(fast_7) <- c("time", "num", "type")

fast_8$num <- 8
fast_8$type <- "fastcodeml"
colnames(fast_8) <- c("time", "num", "type")


df <- rbind(eden_2, eden_3, eden_4, eden_5, eden_6, eden_7, eden_8, fast_2, fast_3, fast_4, fast_5, fast_6, fast_7, fast_8)
df_eden <- rbind(eden_2, eden_3, eden_4, eden_5, eden_6, eden_7, eden_8)

# make a standard error function for plotting
seFunc <- function(x){
  se <- sd(x) / sqrt(sum(!is.na(x)))
  lims <- c(mean(x) + se, mean(x) - se)
  names(lims) <- c('ymin', 'ymax')
  return(lims)
}
df$time <- df$time /1000

# both 
a <- ggplot(df, aes(num, time, color=type))
a <- a + stat_summary(geom = 'errorbar', fun.data = 'seFunc', width = 0, show_guide = F, position="dodge")
a <- a + stat_summary(geom = 'point', fun.y = 'mean', size = 2, shape = 21, position="dodge") + theme_minimal()
a <- a + geom_smooth(method = "lm", se = FALSE,  formula = y ~ splines::bs(x, 3))

# eden 
b <- ggplot(df_eden, aes(num, time))
b <- b + stat_summary(geom = 'errorbar', fun.data = 'seFunc', width = 0, show_guide = F, position="dodge")
b <- b + stat_summary(geom = 'point', fun.y = 'mean', size = 2, shape = 21, position="dodge") + theme_minimal()
b <- b + geom_smooth(method = "lm", se = FALSE,  formula = y ~ splines::bs(x, 3))

