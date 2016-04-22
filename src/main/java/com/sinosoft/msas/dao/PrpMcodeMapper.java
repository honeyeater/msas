package com.sinosoft.msas.dao;

import com.sinosoft.msas.domain.PrpMcode;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface PrpMcodeMapper {
    int deleteByPrimaryKey(@Param("codetype") String codetype, @Param("codecode") String codecode);

    int insert(PrpMcode record);

    PrpMcode selectByPrimaryKey(@Param("codetype") String codetype, @Param("codecode") String codecode);

    List<PrpMcode> selectAll();

    int updateByPrimaryKey(PrpMcode record);
}