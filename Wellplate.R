#code to plot how the samples were aliquoted in a 96 well plate

require(ggplot2)
Well_Name = c("A1","A2","A3","A4","A5","A6","A7","A8","A9","A10","A11","A12","B1","B2","B3","B4","B5","B6","B7","B8","B9","B10","B11","B12","C1","C2","C3","C4","C5","C6","C7","C8","C9","C10","C11","C12","D1","D2","D3","D4","D5","D6","D7","D8","D9","D10","D11","D12","E1","E2","E3","E4","E5","E6","E7","E8","E9","E10","E11","E12","F1","F2","F3","F4","F5","F6","F7","F8","F9","F10","F11","F12","G1","G2","G3","G4","G5","G6","G7","G8","G9","G10","G11","G12","H1","H2","H3","H4","H5","H6","H7","H8","H9","H10","H11","H12")

Sample_Name = c( "Blank","Blank","Blank","Blank","Blank","Blank","Blank","Blank","Blank","Blank","Blank","Blank","Replicate 1","Replicate 1","Replicate 1","Replicate 1","Replicate 1","Replicate 1","Replicate 1","Replicate 1","Replicate 1","Replicate 1","Negativecontrtol1","Positive_control1","Replicate 2", "Replicate 2","Replicate 2","Replicate 2","Replicate 2","Replicate 2","Replicate 2","Replicate 2","Replicate 2","Replicate 2","Negative_contrtol 2","Positive_control 2","Replicate 3","Replicate 3","Replicate 3","Replicate 3","Replicate 3","Replicate 3","Replicate 3","Replicate 3","Replicate 3","Replicate 3","Negative_contrtol 3","Positive_control 3","Blank","Blank","Blank","Blank","Blank","Blank","Blank","Blank","Blank","Blank","Blank","Blank","Blank","Blank","Blank","Blank","Blank","Blank","Blank","Blank","Blank","Blank","Blank","Blank", "Blank","Blank","Blank","Blank","Blank","Blank","Blank","Blank","Blank","Blank","Blank","Blank","Blank","Blank","Blank","Blank","Blank","Blank","Blank","Blank","Blank","Replicate 1","Replicate 2","Replicate 3")

plateMap = data.frame(Well_Name,Sample_Name)

plateMap <- mutate(plateMap,
                   Row=as.numeric(match(toupper(substr(Well_Name, 1, 1)), LETTERS)),
                   Column=as.numeric(substr(Well_Name, 2, 5)))


plate= ggplot(data=plateMap, aes(x=Column, y=Row)) +
  geom_point(data=expand.grid(seq(1, 12), seq(1, 8)), aes(x=Var1, y=Var2),
             color="grey90", shape=21) +
  coord_fixed(ratio=(13/12)/(9/8), xlim=c(0.5, 12.5), ylim=c(0.5, 8.5)) +
  scale_y_reverse(breaks=seq(1, 8), labels=LETTERS[1:8]) +
  scale_x_continuous(breaks=seq(1, 12)) +
  labs(title="96 well Plate Template")

plate + geom_point(aes(colour = factor(Sample_Name)), size = 8)
