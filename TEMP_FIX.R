## sprintf fix
if (i >= 100000 && i < 1000000) {
   i_chr <- sprintf("%6d", i)
   }
else if (i >= 1000000 && i < 10000000) {
   i_chr <- sprintf("%7d", i)
   }
else {
   i_chr <- sprintf("%d, i)
}

## TEMPORARY FIX Code, if sprintf(..) isn't work
if (i %% 100000 == 0) {

#another_digits = i %/% 100000
# loop : i %/% 100000 -> i %/% 10 -> i %/% 10 -> i %/% 10 -> i %/% 10 do-while loop!!!!!

#temp
#another_digits <- 1
# temp 100,000 ~ 900,000
   digits_add <- "0"

   conv_i_chr <- paste0(as.character(i %/% 100000), digits_add)

}
