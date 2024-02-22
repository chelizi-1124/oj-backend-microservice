package com.kalika.ojbackendmodel.model.dto.question;

import lombok.Data;

/**
 * @Author 倪彤
 * @Date 2023/12/20 22:36
 * @Version 1.0
 * 题目配置
 */

@Data
public class JudgeConfig {

    /**
     * 时间限制
     */
    private Long timeLimit;

    /**
     * 内存限制（KB）
     */
    private Long memoryLimit;
    /**
     * 堆栈限制（KB）
     */
    private Long stackLimit;

}
