package com.kalika.ojbackendmodel.model.dto.question;

import lombok.Data;

/**
 * @Author 倪彤
 * @Date 2023/12/20 22:36
 * @Version 1.0
 * 题目用例
 */

@Data
public class JudgeCase {

    /**
     * 输入用例
     */
    private String input;

    /**
     * 输出用例
     */
    private String output;
}
