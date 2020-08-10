# R_100K_as_character_1e05_problem
HEAD: Prompting and TEMP FIX of logical problems of R in converting numeric 100000/200000/... to "1e+05"/"2e+05"/... characters

# 발견 계기
클라우드 서버 내에서 루프를 돌리면서 해당 루프 내의 변수 상태를 파일로 읽고 저장하는 루틴을 아래와 같이 만들었습니다.

i

[1] 100000

save(VAR_NAME, file = paste0("VAR_NAME_", as.character(i), ".RData")

i_load <- 100000

load(file = paste0("VAR_NAME_", as.character(i_load), ".RData")

만약 이 코드가 잘 돌아간다면, VAR_NAME_100000.RData 파일을 쓰고, VAR_NAME_100000.RData 파일을 읽어야 합니다.

하지만 VAR_NAME_100000.RData는 잘 쓰는데, 무슨 이유인지 VAR_NAME_100000.RData는 읽지 못하는 에러가 발생했습니다.

다시 한번 as.character(i)를 해 보니까 역시나 1e+05가 나오더라고요.

다음번 테스트 코드를 아래와 같이 만들어 봤습니다.

i <- c(1:10)

i_tst <- i * 100000

(i_chr <- as.character(i_tst))


결과는 두둥!!!

[1] "1e+05" "2e+05" "3e+05" "4e+05" "5e+05" "6e+05" "7e+05" "8e+05" "9e+05" "1e+06"

이렇게 나왔습니다!!!!!

# 해결 방법

일단 10 100 1000으로 나눠서 10000 ~ 90000, 11000 ~ 99000 등으로 맞춰 놓고

그 다음에 paste0으로 "0"을 붙이는 방식으로 해결해야 할 것으로 보입니다.

# 출처

R has... a significant....

FROM HERE: 
https://stackoverflow.com/questions/32339636/long-numbers-as-a-character-string

The last digits are not preserved, as point out by @SabDem.

Even setting 

options(digits = 22)

doesn't help, ...

# 맺음말

하아.. R에 이런 논리적 오류가 있는 줄 몰랐습니다.

외부 라이브러리 설치가 가능하다면 잘 활용하는 것이 필요해 보입니다.

as.bigz 같은 거를요.....
