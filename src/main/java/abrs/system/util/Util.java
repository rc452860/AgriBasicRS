package abrs.system.util;

import org.mozilla.universalchardet.UniversalDetector;

import java.io.File;
import java.io.FileInputStream;

/**
 * Created by rc452 on 2016/4/11.
 */
public class Util {
    public static String GetEncoding(File file){
        try{
            byte[] buf = new byte[4096];
            FileInputStream fileInputStream = new FileInputStream(file);

            UniversalDetector detector = new UniversalDetector(null);
            int nread;
            while((nread = fileInputStream.read(buf))>0 && !detector.isDone())
                detector.handleData(buf,0,nread);
            detector.dataEnd();
            String encoding = detector.getDetectedCharset();
            detector.reset();
            if (encoding != null) {
                System.out.println("Detected encoding = " + encoding);
                return encoding;
            } else {
                System.out.println("No encoding detected.");
                return null;
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }
}
