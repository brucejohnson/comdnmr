/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.comdnmr.modelfree;

import java.util.ArrayList;
import java.util.List;
import org.comdnmr.modelfree.models.MFModel;
import org.comdnmr.modelfree.models.MFModelIso;

/**
 *
 * @author brucejohnson
 */
public class MolDataValues {

    final String specifier;
    final double[] vector = new double[3];
    final List<RelaxDataValue> dataValues = new ArrayList<>();
    MFModel model;

    public MolDataValues(String specifier, double[] vector) {
        this.specifier = specifier;
        System.arraycopy(vector, 0, this.vector, 0, 3);
    }

    public void addData(RelaxDataValue value) {
        dataValues.add(value);
    }

    public List<RelaxDataValue> getData() {
        return dataValues;
    }

    public void setTestModel(MFModel model) {
        this.model = model;
    }

    public MFModel getTestModel() {
        return model;
    }
    
    public double[] getVector() {
        return vector;
    }

}
