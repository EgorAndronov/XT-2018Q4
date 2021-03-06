﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace Epam.Task6.Backup_System
{
    public class BackupClass
    {
        private string pathFolder;
        private string pathBackup;

        public BackupClass()
        {
        }

        public BackupClass(string pathFolder, string pathBackup)
        {
            this.pathFolder = pathFolder;
            this.pathBackup = pathBackup;
            //this.BackupFolder();
        }

        public void ShowFolders()
        {
            DirectoryInfo back = new DirectoryInfo(this.pathBackup);
            DirectoryInfo[] files = back.GetDirectories().OrderByDescending(x => x.CreationTime).ToArray();
            foreach (DirectoryInfo file in files)
            {
                Console.WriteLine(file.CreationTime);
            }


            DateTime time = new DateTime(2019, 02, 6, 16, 19, 51);
            Console.WriteLine(time);
            foreach (DirectoryInfo file in files)
            {
                Console.WriteLine((DateTime)file.CreationTime >= time);
            }

            string f = Path.Combine("change", this.pathFolder);
            FileInfo newFile = new FileInfo(f);
            Console.WriteLine(Path.Combine("change", this.pathFolder));

        }

        public void BackupFolder()
        {
            DirectoryInfo back = new DirectoryInfo(this.pathBackup);
            DirectoryInfo folder = new DirectoryInfo(this.pathFolder);
            var p = back.EnumerateDirectories();
            DateTime time = new DateTime(2019, 02, 6, 16, 43, 03);
            var g = 0;
            DirectoryInfo[] files = back.GetDirectories().OrderByDescending(x => x.CreationTime).ToArray();
            foreach (DirectoryInfo file in files)
            {
                Thread.Sleep(1000);
                FileInfo backFile = file.GetFiles()[0];
                
                while (backFile.CreationTime >= time)
                {
                    string f = Path.Combine(this.pathFolder, backFile.Name.Substring(8));
                    FileInfo newFile = new FileInfo(f);
                    if (backFile.Name.Substring(0, 8) == "(change)")
                    {
                        FileInfo[] filesFolder = folder.GetFiles();
                        
                        for (int i = 0; i < filesFolder.Length; i++)
                        {
                            Console.WriteLine(++g);
                            Console.WriteLine(filesFolder.Length);
                            if (filesFolder[i].Name == backFile.Name.Substring(8))
                            {
                                
                                File.Delete(filesFolder[i].FullName);
                                backFile.CopyTo(newFile.FullName);
                                newFile.Create();
                            }
                        }
                    }
                    
                }
            }
        }
    }
}
