package abrs.system.web.mobile.excel;

import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.openxml4j.opc.OPCPackage;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.ss.usermodel.*;


/**
 * Created by Edifi_000 on 2016-04-11.
 */
public class POIUtils {
    /**
     * 插入行
     * @param sheet 工作表
     * @param startColumn 开始列
     * @param endColumn 结束列
     * @param pPosition 插入几列
     */
    public static void copyColumns(Sheet sheet,int startColumn,int pPosition){
        int firstRow = sheet.getFirstRowNum();
        int lastRow = sheet.getLastRowNum();

        for(int j = firstRow; j < lastRow ; j ++){
            Row rowCurr = sheet.getRow(j);
            if(rowCurr ==null)
            {
                continue;
            }

            Cell templateCell = rowCurr.getCell(startColumn);
            if(templateCell==null)
            {
                continue;
            }
            Cell newCell = rowCurr.createCell(pPosition);
            copyCell(templateCell, newCell);
        }
    }
    /**
     * 复制行
     *
     * @param currentSheet
     *            表格页签
     * @param startRow
     *            起始行
     * @param endRow
     *            结束行
     * @param pPosition
     *           目标起始行位置
     */
    public static void copyRows(Sheet currentSheet, int startRow, int endRow, int pPosition) {
        int pStartRow = startRow - 1;
        int pEndRow = endRow - 1;
        int targetRowFrom;
        int targetRowTo;
        int columnCount;
        CellRangeAddress region = null;
        int i;
        int j;
        if (pStartRow == -1 || pEndRow == -1) {
            return;
        }
        for (i = 0; i < currentSheet.getNumMergedRegions(); i++) {
            region = currentSheet.getMergedRegion(i);
            if ((region.getFirstRow() >= pStartRow)
                    && (region.getLastRow() <= pEndRow)) {
                targetRowFrom = region.getFirstRow() - pStartRow + pPosition;
                targetRowTo = region.getLastRow() - pStartRow + pPosition;
                CellRangeAddress newRegion = region.copy();
                newRegion.setFirstRow(targetRowFrom);
                newRegion.setFirstColumn(region.getFirstColumn());
                newRegion.setLastRow(targetRowTo);
                newRegion.setLastColumn(region.getLastColumn());
                currentSheet.addMergedRegion(newRegion);
            }
        }
        for (i = pStartRow; i <= pEndRow; i++) {
            Row sourceRow = currentSheet.getRow(i);
            columnCount = sourceRow.getLastCellNum();
            if (sourceRow != null) {
                Row newRow = currentSheet.createRow(pPosition - pStartRow
                        + i);
                newRow.setHeight(sourceRow.getHeight());
                for (j = 0; j < columnCount; j++) {
                    Cell templateCell = sourceRow.getCell(j);
                    if (templateCell != null) {
                        Cell newCell = newRow.createCell(j);
                        copyCell(templateCell, newCell);
                    }
                }
            }
        }
    }

    private static void copyCell(Cell srcCell, Cell distCell) {
        distCell.setCellStyle(srcCell.getCellStyle());
        if (srcCell.getCellComment() != null) {
            distCell.setCellComment(srcCell.getCellComment());
        }
        int srcCellType = srcCell.getCellType();
        distCell.setCellType(srcCellType);
        distCell.setCellValue(srcCell.toString());
//        if (srcCellType == HSSFCell.CELL_TYPE_NUMERIC) {
//            if (HSSFDateUtil.isCellDateFormatted(srcCell)) {
//                distCell.setCellValue(srcCell.getDateCellValue());
//            } else {
//                distCell.setCellValue(srcCell.getNumericCellValue());
//            }
//        } else if (srcCellType == HSSFCell.CELL_TYPE_STRING) {
//            distCell.setCellValue(srcCell.getRichStringCellValue());
//        } else if (srcCellType == HSSFCell.CELL_TYPE_BLANK) {
//            // nothing21
//        } else if (srcCellType == HSSFCell.CELL_TYPE_BOOLEAN) {
//            distCell.setCellValue(srcCell.getBooleanCellValue());
//        } else if (srcCellType == HSSFCell.CELL_TYPE_ERROR) {
//            distCell.setCellErrorValue(srcCell.getErrorCellValue());
//        } else if (srcCellType == HSSFCell.CELL_TYPE_FORMULA) {
//            distCell.setCellFormula(srcCell.getCellFormula());
//        } else { // nothing29
//
//        }
    }

}
