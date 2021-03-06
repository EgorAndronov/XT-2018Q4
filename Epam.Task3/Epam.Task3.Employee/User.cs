﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Epam.Task3.Employee
{
    public class User
    {
        private string surName = string.Empty;
        private string firstName = string.Empty;
        private string patronymic = string.Empty;
        private DateTime dateOfBirth;

        public User()
        {
        }

        public User(string surname, string firstname, string patronymic, DateTime date)
        {
            this.SurName = surname;
            this.FirstName = firstname;
            this.Patronymic = patronymic;
            this.DateOfBirth = date;
        }

        public string SurName
        {
            get
            {
                return this.surName;
            }

            set
            {
                this.surName = value;
            }
        }

        public string FirstName
        {
            get
            {
                return this.firstName;
            }

            set
            {
                this.firstName = value;
            }
        }

        public string Patronymic
        {
            get
            {
                return this.patronymic;
            }

            set
            {
                this.patronymic = value;
            }
        }

        public DateTime DateOfBirth
        {
            get
            {
                return this.dateOfBirth;
            }

            set
            {
                this.dateOfBirth = value;
            }
        }

        public int Age
        {
            get
            {
                return DateTime.Now.Year - this.DateOfBirth.Year;
            }
        }
 
        public virtual void Display()
        {
            Console.WriteLine($"Surname: {SurName}, firstname: {FirstName}, patronymic: {Patronymic}, Date of Birth: {DateOfBirth.ToString("d")}, age: {Age}");
        }
    }
}
