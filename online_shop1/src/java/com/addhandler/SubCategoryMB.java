/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.addhandler;

import com.dao.AddDao;
import com.dao.ListDao;
import com.entity.Category;
import com.entity.SubCategory;
import java.util.List;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;
import javax.faces.model.SelectItem;

/**
 *
 * @author Md Yasin Arif
 */
@ManagedBean
@SessionScoped
public class SubCategoryMB {
    SubCategory subCat = new SubCategory();
    String catName;
    List<Category> listCat;
    Category category = new Category();

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }
  
    public List<Category> getListCat() {
        return listCat;
    }

    public void setListCat(List<Category> listCat) {
        this.listCat = listCat;
    }

    public SubCategory getSubCat() {
        return subCat;
    }

    public void setSubCat(SubCategory subCat) {
        this.subCat = subCat;
    }

    public String getCatName() {
        return catName;
    }

    public void setCatName(String catName) {
        this.catName = catName;
    }
    
     public String addSubCategory() {
        listCat = new ListDao().catListByName(catName);
        category.setCatId(listCat.get(0).getCatId());
        subCat.setCategory(category);
       subCat.setSubCatId(listCat.get(0).getCatId());
       subCat.setSubCatName(subCat.getSubCatName());
       subCat.setSubCatDesc(subCat.getSubCatDesc());
       boolean status = new AddDao().addSubCategory(subCat);
        if (status) {
            FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "OK", "Data Saved"));
        }else{
         FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_WARN, "No", "Data  not Saved"));
        }

        return null;
    }
    
    public List<SelectItem> getCategoryName(){
    List<SelectItem> catname = new ListDao().catList();
    return catname;
    
    }
    
    
    
}
