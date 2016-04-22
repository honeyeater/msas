package com.sinosoft.msas.dao;

import com.sinosoft.msas.domain.PrpMcompany;
import java.util.List;

public interface PrpMcompanyMapper {
    int deleteByPrimaryKey(String comcode);

    int insert(PrpMcompany record);

    PrpMcompany selectByPrimaryKey(String comcode);

    List<PrpMcompany> selectAll();

    int updateByPrimaryKey(PrpMcompany record);
}