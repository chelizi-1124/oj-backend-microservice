package com.kalika.ojbackendjudgeservice.judge.codesandbox.impl;

/**
 * @Author 倪彤
 * @Date 2023/12/27 18:12
 * @Version 1.0
 */



import com.kalika.ojbackendjudgeservice.judge.codesandbox.CodeSandbox;
import com.kalika.ojbackendmodel.model.codesandbox.ExecuteCodeRequest;
import com.kalika.ojbackendmodel.model.codesandbox.ExecuteCodeResponse;
import com.kalika.ojbackendmodel.model.codesandbox.JudgeInfo;
import com.kalika.ojbackendmodel.model.enums.JudgeInfoMessageEnum;
import com.kalika.ojbackendmodel.model.enums.QuestionSubmitStatusEnum;

import java.util.List;

/**
 * 实例代码沙箱
 */
public class ExampleCodeSandbox implements CodeSandbox {
    @Override
    public ExecuteCodeResponse executeCode(ExecuteCodeRequest executeCodeRequest) {
        List<String> inputList = executeCodeRequest.getInputList();
        ExecuteCodeResponse executeCodeResponse = new ExecuteCodeResponse();
        executeCodeResponse.setOutputList(inputList);
        executeCodeResponse.setMessage("测试执行成功");
        executeCodeResponse.setStatus(QuestionSubmitStatusEnum.SUCCEED.getValue());
        JudgeInfo judgeInfo = new JudgeInfo();
        judgeInfo.setMessage(JudgeInfoMessageEnum.ACCEPTED.getText());
        judgeInfo.setMemory(100L);
        judgeInfo.setTime(100L);
        executeCodeResponse.setJudgeInfo(judgeInfo);
        return executeCodeResponse;
    }
}
