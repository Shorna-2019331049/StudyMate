/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package helper;

/**
 *
 * @author User
 */
public class Message {
    private String info;
    private String type;
    private String CssClass;

    public Message() {
    }

    public Message(String info, String type, String CssClass) {
        this.info = info;
        this.type = type;
        this.CssClass = CssClass;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getCssClass() {
        return CssClass;
    }

    public void setCssClass(String CssClass) {
        this.CssClass = CssClass;
    }
    
    
}
