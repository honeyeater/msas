package com.sinosoft.msas.dao;

import com.sinosoft.msas.domain.PrpMoperatelog;
import java.util.List;

public interface PrpMoperatelogMapper {
    int deleteByPrimaryKey(String uuid);

    int insert(PrpMoperatelog record);

    PrpMoperatelog selectByPrimaryKey(String uuid);

    List<PrpMoperatelog> selectAll();

    int updateByPrimaryKey(PrpMoperatelog record);
}