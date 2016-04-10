package abrs.system.web.mobile.excel;

import org.apache.poi.openxml4j.opc.OPCPackage;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.Map;

/**
 * Created by Edifi_000 on 2016-04-10.
 */
public class ExcelOP {

    public byte[] GetExcel(String TemplateFilePath ,Map<String,String> dicStringInfo, Map<String,Double> dicDoubleInfo)
    {
        return null;
    }

    //democode
    private XSSFWorkbook xwb;
    private String path;

    //预处理现有模版用于生成用于使用的Excel模版
    public XSSFWorkbook PrepareWorkBookForDic()
    {
        return null;
    }

    //替换模版中字典值生成Excel
    public void ExportByDic(String path,String target,Map<String,String> dicStringInfo,Map<String,Double> dicDoubleInfo) throws Exception {
        this.path = path;

        System.out.print("Export Start");

        XSSFWorkbook wwbTarget = new XSSFWorkbook(new FileInputStream(path));
        Sheet sheet = wwbTarget.getSheetAt(0);

        for(int rowIndex =sheet.getFirstRowNum();rowIndex<sheet.getLastRowNum();rowIndex++)
        {
            Row row = sheet.getRow(rowIndex);
            if(row==null)
            {
                continue;
            }
            for (int cellIndex =row.getFirstCellNum();cellIndex<row.getLastCellNum();cellIndex++)
            {
                Cell cell = row.getCell(cellIndex);
                if(cell==null)
                {
                    continue;
                }

                String cellKey = row.getCell(cellIndex).toString();
                if(dicStringInfo!=null&&dicStringInfo.containsKey(cellKey))
                {
                    row.getCell(cellIndex).setCellValue(dicStringInfo.get(cellKey));
                }
                else if(dicDoubleInfo!=null&&dicDoubleInfo.containsKey(cellKey))
                {
                    row.getCell(cellIndex).setCellValue(dicDoubleInfo.get(cellKey));
                }
            }
        }
        sheet.setForceFormulaRecalculation(true);
        wwbTarget.write(new FileOutputStream(target));

        System.out.print("Export Complete");
    }
}
