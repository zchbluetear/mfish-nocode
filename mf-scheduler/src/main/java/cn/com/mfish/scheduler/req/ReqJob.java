package cn.com.mfish.scheduler.req;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.experimental.Accessors;

/**
 * @description: 定时调度任务
 * @author: mfish
 * @date: 2023-02-03
 * @version: V1.0.0
 */
@Data
@Accessors(chain = true)
@ApiModel("定时调度任务请求参数")
public class ReqJob {
    @ApiModelProperty(value = "任务名称")
    private String jobName;
    @ApiModelProperty(value = "任务组")
    private String jobGroup;
    @ApiModelProperty(value = "cron表达式")
    private String cron;
    @ApiModelProperty(value = "调用方法")
    private String invokeMethod;
}
