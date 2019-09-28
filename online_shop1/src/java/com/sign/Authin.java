/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sign;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;

/**
 *
 * @author Md Yasin Arif
 */
@ManagedBean(name ="lu")
@SessionScoped
public class Authin {
    
    
    int id;
    String userId;
    String password;
    
    String fullname;
    String email;
    Date dob;
    String phone;
    String veriCode;
    String gender;
//    InfoDao dao = new InfoDao();

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getVeriCode() {
        return veriCode;
    }

    public void setVeriCode(String veriCode) {
        this.veriCode = veriCode;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }
    
    
    public String signUp(){
    
    return "signUp";
    }
    
        public void logRe(){
       this.userId="";
       this.password="";
    
    }
        public String submit(){
        
        return "";
        }
    
        public List<String> genders(String input){
      ArrayList<String> genders = new ArrayList<>();
       
      genders.add("Male");
      genders.add("Female");

     return genders;
     }
       
        
//        public List<Info> information() {
//        List<Info> inf = dao.getinfo();
//        return inf;
//    }
         public String addInfoUrl() {
        return "signUp";
    }
//             public String addInfo() {
//        dao.insert(new Info(fullname,email,dob,phone,veriCode,gender));
//        return "result";
//    }
              public String back() {
        return "result";
    }
}
