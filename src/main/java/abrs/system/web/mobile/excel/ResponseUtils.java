package abrs.system.web.mobile.excel;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.*;

/**
 * Created by Edifi_000 on 2016-04-12.
 */
public class ResponseUtils {

    public static void MakeDownLoadFile(byte[] content,HttpServletResponse response,String templateFileName)
    {
        try {
            InputStream is = new ByteArrayInputStream(content);

            // 设置response参数，可以打开下载页面
            response.reset();
            response.setContentType("application/vnd.ms-excel;charset=utf-8");
            response.setHeader("Content-Disposition", "attachment;filename=" + new String((templateFileName).getBytes(), "iso-8859-1"));
            ServletOutputStream out = response.getOutputStream();

            BufferedInputStream bis = null;
            BufferedOutputStream bos = null;

            try {

                bis = new BufferedInputStream(is);
                bos = new BufferedOutputStream(out);

                byte[] buff = new byte[2048];
                int bytesRead;

                // Simple read/write loop.
                while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {
                    bos.write(buff, 0, bytesRead);
                }

            } catch (final IOException e) {
                throw e;
            } finally {
                if (bis != null)
                    bis.close();
                if (bos != null)
                    bos.close();
            }
        } catch (Exception ex){
            System.out.print(ex.toString());
        }

    }
}
