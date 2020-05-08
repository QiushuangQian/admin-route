package com.admin.utils;

import java.util.*;

/**
 * Created by IntelliJ IDEA.
 * User: mousse
 * Date: 2020-04-11
 * Time: 23:20
 * To change this template use File | Settings | File Templates.
 */
public class TspUtils {


    //存放全排列结果
    static ArrayList<int[]> arrangement; //arrangement = list()
    //点的个数
    static int cityNum = 4;
    //最短路径
    static int[] minLengthPath; //minLengthPath = []
    //最短路径的长度
    static int minLength;


    public static Map<Integer, int[]> search(List<Integer> distance) {//用MAP装返回两个数据
        arrangement = new ArrayList<int[]>(); //初始化全排列列表
        int[] a = new int[cityNum]; //a = ['','','','']
        for (int i = 0; i < cityNum; i++) {
            a[i] = i; //a=[0,1,2,3]
        }

//产生全排列
        permutations(a, 0, cityNum - 1); //a-> m-> n->

//数据矩阵
        int[][] array = new int[cityNum][cityNum];
        int count = 0;
        for (int i = 0; i < array.length; i++) {
            for (int j = i + 1; j < array.length; j++) {
                System.out.println("第" + (i + 1) + "个城市与第" + (j + 1) + "个城市的距离");
                array[j][i] = array[i][j] = distance.get(count);
                count++;
            }
        }
//输出矩阵
        matrix(array);
//输出线路
        calculateAndPrint(array, 0);

        Map<Integer, int[]> map = new HashMap<Integer, int[]>();
        map.put(minLength, minLengthPath);
        return map;
    }



   /*private static void printTst(){
        arrangement = new ArrayList<int[]>();
        Scanner s = new Scanner(System.in);
        System.out.println("蛮力法解决TSP问题");
        System.out.println("请输入点的个数");
        cityNum = s.nextInt();
        int[] a = new int[cityNum];
        for (int i = 0; i < cityNum; i++) {
            a[i] = i;
        }
        //产生全排列
        permutations(a, 0, cityNum - 1);

        //数据矩阵     4个城市 6个距离  3 + 2 + 1
        //数据矩阵     5个城市 10个距离 4 + 3 + 2 + 1
        int[][] array = new int[cityNum][cityNum];
        for (int i = 0; i < array.length; i++) {
            for (int j = i + 1; j < array.length; j++) {
                System.out.println("请输入第" + (i + 1) + "个点与第" + (j + 1) + "个点的距离");
                array[j][i] = array[i][j] = s.nextInt();
            }
        }

        //输出矩阵
        matrix(array);

        //计算并打印路径
        for (int i = 0; i < cityNum; i++) {
            //数组，从0开始
            calculateAndPrint(array, i);
        }

    }
*/

    //全排列
    private static void permutations(int[] a, int m, int n) {
        if (m == n) {
            arrangement.add(new int[cityNum]);
            for (int i = 0; i <= n; i++) {
                arrangement.get(arrangement.size() - 1)[i] = a[i];
            }
        } else {
            for (int i = m; i <= n; i++) {
                int temp = a[m];
                a[m] = a[i];
                a[i] = temp;
                permutations(a, m + 1, n);
                temp = a[m];
                a[m] = a[i];
                a[i] = temp;
            }
        }
    }

    //打印矩阵
    private static void matrix(int[][] array) {
        for (int i = 0; i < array.length; i++) {
            for (int j = 0; j < array.length; j++) {
                System.out.print(array[i][j]);
                System.out.print("\t");
            }
            System.out.print("\n");
        }
    }

   private static void calculateAndPrint(int[][] array, int startPoint) {//startPoint为开始点
        minLength = 10000;
        minLengthPath = new int[10];
        for (int i = arrangement.size() / cityNum * startPoint; i < arrangement.size() / cityNum * (startPoint + 1); i++) {//开始计算距离
            int nowLength = 0;
            for (int j = 0; j < cityNum - 1; j++) {//除了回去的最后一步
                nowLength += array[arrangement.get(i)[j]][arrangement.get(i)[j + 1]];
            }
            nowLength += array[arrangement.get(i)[0]][arrangement.get(i)[cityNum - 1]];//回到原点的最后一步
            if (nowLength < minLength) {//更新最短
                minLength = nowLength;
                minLengthPath = arrangement.get(i);
            }
        }
        System.out.print("从" + (startPoint + 1) + "点开始的最短路径为");
        for (int i = 0; i < cityNum; i++) {
            System.out.print((minLengthPath[i] + 1) + ",");
        }
        System.out.print(startPoint + 1);
        System.out.println("长度为" + minLength);
    }
}
