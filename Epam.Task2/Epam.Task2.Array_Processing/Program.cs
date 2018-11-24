﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Epam.Task2.Array_Processing
{
    class Program
    {
        static void Main(string[] args)
        {
            int[] array = new int[10];
            Random rnd = new Random();
            Console.WriteLine("Исходный массив:");
            for (int i = 0; i < array.Length; i++)
            {
                array[i] = rnd.Next(0, 100);
                Console.Write($"{array[i]} ");
            }



            ArraySort(ref array);
            Console.WriteLine();
            Console.WriteLine();
            Console.WriteLine($"Минимальный элемент массива = {array[0]}, максимальный элемент массива = {array[array.Length - 1]}");
            Console.WriteLine();
            Console.WriteLine("Отсортированный массив:");
            for (int i = 0; i < array.Length; i++)
            {
                Console.Write($"{array[i]} ");
            }
            Console.WriteLine();
            Console.WriteLine();
        }

        static void ArraySort(ref int[] array)
        {
            int k;

            for (int j = 0; j < array.Length; j++)
            {
                for (int i = 1; i < array.Length-j; i++)
                {
                    if (array[i - 1] > array[i])
                    {
                        k = array[i];
                        array[i] = array[i - 1];
                        array[i - 1] = k;
                    }
                }
            }
        }
    }
}
