package com.madaha.codesecmemshell.javaAgent;

import com.sun.tools.attach.*;
import java.io.IOException;
import java.util.List;


public class Inject_AgentMemShell {
    public static void main(String[] args) throws IOException, AttachNotSupportedException, AgentLoadException, AgentInitializationException {
        // 调用 VirtualMachine.list() 获取正在运行的JVM列表
        List<VirtualMachineDescriptor> list = VirtualMachine.list();

        for(VirtualMachineDescriptor vmd : list){
            // 遍历每一个正在运行的JVM，如果JVM名称为 CodeSecMemShellApplication 则连接JVM并加载特定的Agent
            if (vmd.displayName().equals("com.madaha.codesecmemshell.CodeSecMemShellApplication")){

                // 连接指定JVM
                VirtualMachine virtualMachine = VirtualMachine.attach(vmd.id());
                // 加载Agent
                virtualMachine.loadAgent("out/artifacts/Java_Agent_jar/Java_Agent.jar");
                // 断开JVM连接
                virtualMachine.detach();
            }
        }
    }
}
