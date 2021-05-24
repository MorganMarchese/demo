/**
 * @description       : Main Trigger Handler for Event Object
 * @author            : Morgan Marchese @ Zoetis Inc
 * @group             :
 * @last modified on  : 05-21-2021
 * @last modified by  : Morgan Marchese @ Zoetis Inc
 * Modifications Log
 * Ver   Date         Author                         Modification
 * 1.0   05-20-2021   Morgan Marchese @ Zoetis Inc   Replaced old Trigger Handler Framework with more robust Kevin O'Hara Framework
 *                                                   Consolidated and deduplicated logic from various other handlers
 **/
public with sharing class EventTriggerHandler extends TriggerHandler {
  // BEGIN FRAMEWORK SPECIFIC VARIABLES
  private List<Event> newList;
  private List<Event> oldList;
  private List<Event> recordListUS;
  private List<Event> recordListINTL;
  private Map<Id, Event> newMap;
  private Map<Id, Event> oldMap;
  private SObjectUtil.ObjectList filteredLists = new SObjectUtil.ObjectList();
  // END FRAMEWORK SPECIFIC VARIABLES

  // BEGIN CLASS SPECIFIC VARIABLES
  // Filter Field for US/INTL Split
  private Schema.sObjectField marketField = Event.ZTS_EU_Market__c.getDescribe()
    .getSObjectField();

  // Get SObject Types for WhoId/WhatId Comparison
  private static final Schema.SObjectType TIME_OFF_SOBJECT = Time_Out_of_Territory__c.getSObjectType();
  private static final Schema.SObjectType ACCOUNT_SOBJECT = Account.getSObjectType();
  private static final Schema.SObjectType CONTACT_SOBJECT = Contact.getSObjectType();

  // Get Record Types for Comparison
  private static final Map<String, Schema.RecordTypeInfo> rtMapByName = Schema.SObjectType.Event.getRecordTypeInfosByName();
  private static final Id GENERAL_EVENT_RT = rtMapByName.get('General_Event')
    .getRecordTypeId();

  // DML Result Variables
  List<Database.SaveResult> saveResults = new List<Database.SaveResult>();
  List<Database.DeleteResult> deleteResults = new List<Database.DeleteResult>();
  // END CLASS SPECIFIC VARIABLES

  public EventTriggerHandler() {
    // Set Trigger Data Variables
    this.newList = (List<Event>) Trigger.new;
    this.oldList = (List<Event>) Trigger.old;
    this.newMap = (Map<Id, Event>) Trigger.newMap;
    this.oldMap = (Map<Id, Event>) Trigger.oldMap;

    // Filter by New List, else, by Old List (for when New List is null)
    if (newList != null || !newList.isEmpty()) {
      this.filteredLists = SObjectUtil.filterByMarket(newList, marketField);
    } else if (oldList != null || !oldList.isEmpty()) {
      this.filteredLists = SObjectUtil.filterByMarket(oldList, marketField);
    }

    // Set Region Specific Lists from Filter Results
    this.recordListUS = (List<Event>) filteredLists.getUS();
    this.recordListINTL = (List<Event>) filteredLists.getINTL();
  }

  public override void beforeInsert() {
    List<SObject> objectList = new List<SObject>();
    // BEGIN GLOBAL BUSINESS LOGIC
    for (Event record : newList) {}
    // END GLOBAL BUSINESS LOGIC

    // BEGIN UNITED STATES BUSINESS LOGIC
    //for(Event record : recordListUS){}
    // END UNITED STATES BUSINESS LOGIC

    // BEGIN INTERNATIONAL BUSINESS LOGIC
    //for(Event record : recordListINTL){}
    // END INTERNATIONAL BUSINESS LOGIC

    // PROCESS ALL POST LOOP DML
    if (!objectList.isEmpty()) {
      saveResults = Database.insert(objectList, false);
    }
  }

  public override void beforeUpdate() {
    List<SObject> objectList = new List<SObject>();
    // BEGIN GLOBAL BUSINESS LOGIC
    for (Event record : newList) {}
    // END GLOBAL BUSINESS LOGIC

    // BEGIN UNITED STATES BUSINESS LOGIC
    //for(Event record : recordListUS){}
    // END UNITED STATES BUSINESS LOGIC

    // BEGIN INTERNATIONAL BUSINESS LOGIC
    //for(Event record : recordListINTL){}
    // END INTERNATIONAL BUSINESS LOGIC

    // PROCESS ALL POST LOOP DML
    if (!objectList.isEmpty()) {
      saveResults = Database.insert(objectList, false);
    }
  }

  public override void beforeDelete() {
    List<SObject> objectList = new List<SObject>();
    // BEGIN GLOBAL BUSINESS LOGIC
    for (Event record : newList) {}
    // END GLOBAL BUSINESS LOGIC

    // BEGIN UNITED STATES BUSINESS LOGIC
    //for(Event record : recordListUS){}
    // END UNITED STATES BUSINESS LOGIC

    // BEGIN INTERNATIONAL BUSINESS LOGIC
    //for(Event record : recordListINTL){}
    // END INTERNATIONAL BUSINESS LOGIC

    // PROCESS ALL POST LOOP DML
    if (!objectList.isEmpty()) {
      saveResults = Database.insert(objectList, false);
    }
  }

  public override void afterInsert() {
    List<SObject> objectList = new List<SObject>();
    // BEGIN GLOBAL BUSINESS LOGIC
    for (Event record : newList) {}
    // END GLOBAL BUSINESS LOGIC

    // BEGIN UNITED STATES BUSINESS LOGIC
    //for(Event record : recordListUS){}
    // END UNITED STATES BUSINESS LOGIC

    // BEGIN INTERNATIONAL BUSINESS LOGIC
    //for(Event record : recordListINTL){}
    // END INTERNATIONAL BUSINESS LOGIC

    // PROCESS ALL POST LOOP DML
    if (!objectList.isEmpty()) {
      saveResults = Database.insert(objectList, false);
    }
  }

  public override void afterUpdate() {
    List<SObject> objectList = new List<SObject>();
    // BEGIN GLOBAL BUSINESS LOGIC
    for (Event record : newList) {}
    // END GLOBAL BUSINESS LOGIC

    // BEGIN UNITED STATES BUSINESS LOGIC
    //for(Event record : recordListUS){}
    // END UNITED STATES BUSINESS LOGIC

    // BEGIN INTERNATIONAL BUSINESS LOGIC
    //for(Event record : recordListINTL){}
    // END INTERNATIONAL BUSINESS LOGIC

    // PROCESS ALL POST LOOP DML
    if (!objectList.isEmpty()) {
      saveResults = Database.insert(objectList, false);
    }
  }

  public override void afterDelete() {
    List<SObject> objectList = new List<SObject>();
    // BEGIN GLOBAL BUSINESS LOGIC
    for (Event record : newList) {}
    // END GLOBAL BUSINESS LOGIC

    // BEGIN UNITED STATES BUSINESS LOGIC
    //for(Event record : recordListUS){}
    // END UNITED STATES BUSINESS LOGIC

    // BEGIN INTERNATIONAL BUSINESS LOGIC
    //for(Event record : recordListINTL){}
    // END INTERNATIONAL BUSINESS LOGIC

    // PROCESS ALL POST LOOP DML
    if (!objectList.isEmpty()) {
      saveResults = Database.insert(objectList, false);
    }
  }

  public override void afterUndelete() {
    List<SObject> objectList = new List<SObject>();
    // BEGIN GLOBAL BUSINESS LOGIC
    for (Event record : newList) {}
    // END GLOBAL BUSINESS LOGIC

    // BEGIN UNITED STATES BUSINESS LOGIC
    //for(Event record : recordListUS){}
    // END UNITED STATES BUSINESS LOGIC

    // BEGIN INTERNATIONAL BUSINESS LOGIC
    //for(Event record : recordListINTL){}
    // END INTERNATIONAL BUSINESS LOGIC

    // PROCESS ALL POST LOOP DML
    if (!objectList.isEmpty()) {
      saveResults = Database.insert(objectList, false);
    }
  }
}
