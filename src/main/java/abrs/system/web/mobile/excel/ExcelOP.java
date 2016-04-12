package abrs.system.web.mobile.excel;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.openxml4j.opc.OPCPackage;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.*;
import java.util.Iterator;
import java.util.Map;

/**
 * Created by Edifi_000 on 2016-04-10.
 */
public class ExcelOP {

    public byte[] GetExcel(HSSFWorkbook wwbTarget,Map<String,String> dicStringInfo, Map<String,Double> dicDoubleInfo) throws Exception
    {
        System.out.print("Export Start");
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

        ByteArrayOutputStream output = new ByteArrayOutputStream();
        wwbTarget.write(output);
        output.close();
        System.out.print("Export Complete");

        return output.toByteArray();
    }

    //预处理现有模版用于生成用于使用的Excel模版
    public HSSFWorkbook PrepareWorkBookForDic(String realPath,String templateFileName,int increaseType,int increaseCount) throws Exception
    {
        String path=realPath+"/"+templateFileName;

        HSSFWorkbook tempplateExcel= new HSSFWorkbook(new FileInputStream(path));
        Sheet sheet = tempplateExcel.getSheetAt(0);

        int getRowIndex = 0;
        int getColumnIndex = 0;
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
                String cellKey = cell.toString();

                if(cellKey.contains("[n]"))
                {
                    System.out.print(cellKey);
                    getRowIndex = rowIndex;
                    getColumnIndex = cell.getColumnIndex();
                }
            }
        }


        //increaseType判断处理类型
        switch (increaseType)
        {
            case 0:{

                break;
            }
            case 1: {
                WithRowIncrease(sheet,getRowIndex,increaseCount);
                break;
            }
            case 2:{
                WitColumnIncrease(sheet,getColumnIndex,increaseCount);
                break;
            }
        }

        sheet.setForceFormulaRecalculation(true);

        return tempplateExcel;
    }


    private void WitColumnIncrease(Sheet sheet,int startColumnIndex,int addColumnCount)
    {
        //Copy
        for(int i =1;i<=addColumnCount;i++) {
            POIUtils.copyColumns(sheet, startColumnIndex, startColumnIndex+i-1);
        }

        //ReContent
        for(int columnIndex =startColumnIndex;columnIndex<startColumnIndex+addColumnCount;columnIndex++)
        {
            for(int rowIndex =  sheet.getFirstRowNum(); rowIndex < sheet.getLastRowNum() ; rowIndex ++) {
                Row row = sheet.getRow(rowIndex);
                if(row==null)
                {
                    continue;
                }
                Cell cell = row.getCell(columnIndex);
                if(cell==null)
                {
                    continue;
                }

                String cellKey = cell.toString();

                if(cellKey.contains("[n]"))
                {
                    System.out.print(cellKey);
                    cell.setCellValue(cellKey.replaceFirst("\\[n\\]","["+(columnIndex-startColumnIndex)+"]"));
                }

            }
        }
    }

    private void WithRowIncrease(Sheet sheet,int startRowIndex,int addRowCount)
    {
        //Copy
        sheet.shiftRows(startRowIndex+1, sheet.getLastRowNum(), addRowCount-1, true, false);
        for(int i =1;i<=addRowCount;i++)
        {
            POIUtils.copyRows(sheet, startRowIndex + 1, startRowIndex + 1, startRowIndex - 1 + i);
        }

        //ReContent
        for(int rowIndex =startRowIndex;rowIndex<startRowIndex+addRowCount;rowIndex++)
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
                String cellKey = cell.toString();

                if(cellKey.contains("[n]"))
                {
                    System.out.print(cellKey);
                    cell.setCellValue(cellKey.replaceFirst("\\[n\\]","["+(rowIndex-startRowIndex)+"]"));
                }
            }
        }
    }



    /////////////////////DEMOCODE///////////////////////////////////////////
    public XSSFWorkbook PrepareWorkBookForDicDemo(String realPath) throws Exception
    {
        //String path=realPath+"/襄州区基点农户基本信息汇总表修改后.xls";农市（基）2表.xls
        String path=realPath+"/农市（基）2表.xls";

        HSSFWorkbook tempplateExcel= new HSSFWorkbook(new FileInputStream(path));
        Sheet sheet = tempplateExcel.getSheetAt(0);

        int getRowIndex = 0;
        int getColumnIndex = 0;
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
                String cellKey = cell.toString();

                if(cellKey.contains("[n]"))
                {
                    System.out.print(cellKey);
                    getRowIndex = rowIndex;
                    getColumnIndex = cell.getColumnIndex();
                }
            }
        }


        //WithRowIncrease(sheet,getRowIndex,10);
        //WitColumnIncrease(sheet,getColumnIndex,10);

        sheet.setForceFormulaRecalculation(true);
        //FileOutputStream output = new FileOutputStream(realPath+"/re襄州区基点农户基本信息汇总表修改后.xls");
        FileOutputStream output = new FileOutputStream(realPath+"/re农市（基）2表.xls");
        tempplateExcel.write(output);
        output.close();

        return null;
    }

    private XSSFWorkbook xwb;
    private String path;
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
    /////////////////////DEMOCODE///////////////////////////////////////////
}
