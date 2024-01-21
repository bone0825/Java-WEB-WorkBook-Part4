package org.zerock.springex.mapper;

import org.apache.ibatis.annotations.Select;

public interface TimeMapper {

    //@Select를 이용한 어쿼리 작성 ';'dmf tkdydgkwl dksgsmsek.
    @Select("select now()")
    String getTime();
}
