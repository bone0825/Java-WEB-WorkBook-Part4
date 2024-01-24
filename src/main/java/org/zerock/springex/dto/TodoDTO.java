package org.zerock.springex.dto;

import jakarta.validation.constraints.Future;
import jakarta.validation.constraints.NotEmpty;
import lombok.*;

import java.time.LocalDate;

@ToString
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class TodoDTO {

    private Long tno;
    @NotEmpty //null, 빈 문자열 불가
    private String title;
    @Future //현재보다 미래인가 검증
    private LocalDate dueDate;

    private boolean finished;
    @NotEmpty
    private String writer;
}
