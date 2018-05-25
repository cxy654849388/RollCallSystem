package com.chm.windows;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.chm.utils.HttpUtils;
import com.google.common.collect.Maps;

import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.IOException;
import java.time.LocalTime;
import java.util.Map;
import javax.swing.*;
import javax.swing.table.*;

/**
 * @Author: caihongming
 * @Created: 2018/4/24
 */
public class TableWindow extends JFrame {

    private static TableWindow tableWindow;
    private static JTable table;
    private static DefaultTableModel myTableModel = null;
    private static JScrollPane scrollPane;

    Object[] names = {"学号", "姓名", "性别", "签到时间", "状态", "操作"};

    public static TableWindow getInstance() {
        if (tableWindow == null) {
            tableWindow = new TableWindow();
        }
        return tableWindow;
    }

    private TableWindow() {
        setTitle("签到名单");
        setSize(900, 900);
        setLocation(500, 200);
        scrollPane = new JScrollPane();
        scrollPane.setSize(300, 200);

        //创建一个只有表头的表格模型
        myTableModel = new DefaultTableModel() {
            @Override
            public boolean isCellEditable(int row, int column) {
                if (column == 5) {
                    return true;
                }
                return false;
            }
        };
        myTableModel.setColumnIdentifiers(names);
        table = new JTable(myTableModel);
        table.setRowHeight(30);
        table.getColumn("操作").setPreferredWidth(20);
        //设置编辑器
        table.getColumnModel().getColumn(5).setCellEditor(new MyRender());
        table.getColumnModel().getColumn(5).setCellRenderer(new MyRender());


        //设置单元格中的文字居中 非表头单元格
        DefaultTableCellRenderer r = new DefaultTableCellRenderer();
        r.setHorizontalAlignment(JLabel.CENTER);
        table.setDefaultRenderer(Object.class, r);
        scrollPane.setViewportView(table);
        add(scrollPane);
        setVisible(true);
    }

    public static boolean indexOf(String stuId) {
        int row = myTableModel.getRowCount();
        for (int i = 0; i < row; i++) {
            String stuid = (String) myTableModel.getValueAt(i, 0);
            if (stuId.equals(stuid)) {
                return true;
            }
        }
        return false;
    }

    public static void addRow(String stuId, String StuName, String Sex, String signedTime, String status) {
        if (!indexOf(stuId)) {
            myTableModel.addRow(new Object[]{stuId, StuName, Sex, signedTime, status});
        }

    }

    public static void clear() {
        myTableModel.setRowCount(0);
    }

    class MyRender extends AbstractCellEditor implements TableCellRenderer, ActionListener, TableCellEditor {
        private JButton button = null;
        int row;
        int column;
        private Map map = Maps.newHashMap();

        public MyRender() {
            button = new JButton("缺课");
            button.addActionListener(this);
        }

        @Override
        public Object getCellEditorValue() {
            return null;
        }

        @Override
        public Component getTableCellRendererComponent(JTable table, Object value,
                                                       boolean isSelected, boolean hasFocus, int row, int column) {
            this.row = row;
            this.column = column;
            return button;
        }

        @Override
        public void actionPerformed(ActionEvent e) {
            String stutas = (String) myTableModel.getValueAt(row, 4);
            if ("缺课".equals(stutas)) {
                return;
            }
            int option = JOptionPane.showConfirmDialog(null,
                "确认该学生缺课？", "缺课", JOptionPane.YES_NO_OPTION);
            if (option == 0) {
                //确认操作
                try {
                    map.put("schid", SignedWindow.getSchid());
                    map.put("stuid", myTableModel.getValueAt(row, 0));
                    JSONObject result = JSON.parseObject(HttpUtils.
                        httpPost("http://127.0.0.1:8080/RollCallSystem/absence", map, null));
                    if (result.getInteger("resultCode").intValue() == 0) {
                        myTableModel.setValueAt("缺课", row, 4);
                    }
                } catch (IOException e1) {
                    e1.printStackTrace();
                }
            } else {
                //取消
                return;
            }
        }

        @Override
        public Component getTableCellEditorComponent(JTable table, Object value,
                                                     boolean isSelected, int row, int column) {
            return button;
        }
    }
}