package com.github.billygk.cloud.serviceq.dto;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class JobDto {
    String jobType;
    List<JobDataDto> jobData;
}
