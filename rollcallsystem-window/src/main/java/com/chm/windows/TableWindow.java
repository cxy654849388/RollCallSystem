package com.chm.windows;

import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.time.LocalTime;
import javax.swing.*;
import javax.swing.table.*;

/**
 * @Author: caihongming
 * @Created: 2018/4/24
 */
public class TableWindow extends JFrame {

    private static TableWindow tableWindow;
    private JTable table;
    private DefaultTableModel myTableModel = null;
    private JScrollPane scrollPane;

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

        addRow("1407020401", "蔡鸿铭", "男", LocalTime.now().toString().substring(0, 8), "正常");
        addRow("1407020401", "蔡鸿铭", "男", LocalTime.now().toString().substring(0, 8), "正常");
        addRow("1407020401", "蔡鸿铭", "男", LocalTime.now().toString().substring(0, 8), "正常");
        addRow("1407020401", "蔡鸿铭", "男", LocalTime.now().toString().substring(0, 8), "正常");
        addRow("1407020401", "蔡鸿铭", "男", LocalTime.now().toString().substring(0, 8), "正常");


        //设置单元格中的文字居中 非表头单元格
        DefaultTableCellRenderer r = new DefaultTableCellRenderer();
        r.setHorizontalAlignment(JLabel.CENTER);
        table.setDefaultRenderer(Object.class, r);
        scrollPane.setViewportView(table);
        add(scrollPane);

        setDefaultCloseOperation(DISPOSE_ON_CLOSE);
        setVisible(true);
    }

    public void addRow(String stuId, String StuName, String Sex, String signedTime, String status) {
        myTableModel.addRow(new Object[]{stuId, StuName, Sex, signedTime, status});
    }

    class MyRender extends AbstractCellEditor implements TableCellRenderer, ActionListener, TableCellEditor {
        private JButton button = null;
        int row;
        int column;

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
            int option = JOptionPane.showConfirmDialog(null,
                "确认该学生缺课？", "缺课", JOptionPane.YES_NO_OPTION);

            if (option == 0) {
                //确认操作

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