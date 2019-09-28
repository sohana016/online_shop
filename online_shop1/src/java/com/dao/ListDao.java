/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;

import com.entity.Category;
import com.entity.Product;
import com.entity.SubCategory;
import com.util.HibernateUtil;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

/**
 *
 * @author Md Yasin Arif
 */
public class ListDao {
    
    public List catList(){
     SessionFactory factory = HibernateUtil.getSessionFactory();
            Session session = factory.openSession();
            List<Category> cList = session.createQuery("select al.catName FROM Category al").list();
            cList.toString();
            session.close();
    return cList;
    
    }
    
    
    public List subcatList(String name){
     SessionFactory factory = HibernateUtil.getSessionFactory();
            Session session = factory.openSession();
            List<Category> cList = session.createQuery("select al.subCatName FROM SubCategory al where al.category.catId IN (select a.catId from Category a where lower(a.catName)='"+name.toLowerCase()+"')").list();
            cList.toString();
            session.close();
    return cList;
    
    }
    
    
    public List<Category> catListByName(String name){
     SessionFactory factory = HibernateUtil.getSessionFactory();
            Session session = factory.openSession();
            List<Category> cList = session.createQuery("select al FROM Category al where lower(catName)='"+name.toLowerCase()+"'").list();
            cList.toString();
            session.close();
    return cList;
    
    }
     public List<SubCategory> subcatListByName(String name){
     SessionFactory factory = HibernateUtil.getSessionFactory();
            Session session = factory.openSession();
            List<SubCategory> cList = session.createQuery("select al FROM SubCategory al where lower(subCatName)='"+name.toLowerCase()+"'").list();
            cList.toString();
            session.close();
            
    return cList;
    
    }
     
     public List allProductList(){
     SessionFactory factory = HibernateUtil.getSessionFactory();
            Session session = factory.openSession();
            List<Product> cList = session.createQuery("select al FROM Product al").list();
            cList.toString();
            session.close();
    return cList;
    
    }
    
}
