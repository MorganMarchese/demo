/**
 * @description       :
 * @author            : Morgan Marchese @ Zoetis Inc
 * @group             :
 * @last modified on  : 05-20-2021
 * @last modified by  : Morgan Marchese @ Zoetis Inc
 * Modifications Log
 * Ver   Date         Author                         Modification
 * 1.0   05-20-2021   Morgan Marchese @ Zoetis Inc   Initial Version
 **/
public with sharing class SObjectUtil {
  private static final String FILTER_VALUE = 'United States';
  // Filter US Records from INTL Records by Market
  public static ObjectList filterByMarket(
    List<SObject> listToFilter,
    Schema.SObjectField filterField
  ) {
    ObjectList objList = new ObjectList();

    for (SObject record : listToFilter) {
      if (record.get(filterField) == null)
        continue;
      if (record.get(filterField) == FILTER_VALUE) {
        objList.objListUS.add(record);
      } else {
        objList.objListINTL.add(record);
      }
    }
    return objList;
  }

  /*public static ObjectList filterByMarket(
    List<SObject> listToFilter,
    Schema.SObjectField filterField,
    Schema.SObjectField parentField,
    List<SObject> parentObjects,
    Boolean isEqual
  ) {
    List<SObject> recordsToBeProcessed = new List<SObject>();
    Map<Id, SObject> parentObjectsMap = new Map<Id, SObject>(parentObjects);

    for (SObject eachRecord : listToFilter) {
      if (isEqual) {
        //This is the case for US Market Accounts
        if (
          (parentObjectsMap.get((Id) eachRecord.get(parentField))) != null &&
          (parentObjectsMap.get((Id) eachRecord.get(parentField)))
            .get(filterField) != null &&
          (parentObjectsMap.get((Id) eachRecord.get(parentField)))
            .get(filterField) == FILTER_VALUE &&
          isEqual
        ) {
          recordsToBeProcessed.add(eachRecord);
        }
      } else {
        //INTL Market Accounts
        // two FALSE do not make a TRUE hence !isEqual
        if (
          (parentObjectsMap.get((Id) eachRecord.get(parentField))) != null &&
          (parentObjectsMap.get((Id) eachRecord.get(parentField)))
            .get(filterField) != FILTER_VALUE &&
          !isEqual
        ) {
          recordsToBeProcessed.add(eachRecord);
        }
      }
    }
    return recordsToBeProcessed;
  }*/

  public class ObjectList {
    List<SObject> objListUS;
    List<SObject> objListINTL;

    public ObjectList() {
      this.objListUS = new List<SObject>();
      this.objListINTL = new List<SObject>();
    }

    public List<SObject> getUS() {
      return this.objListUS;
    }
    public List<SObject> getINTL() {
      return this.objListINTL;
    }
  }
}
