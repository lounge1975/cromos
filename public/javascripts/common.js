function Common(){}

var Common = function(){this.init();}

Common.prototype = {
    init: function(){
    },

    openSubWindow: function(obj){
        return hs.htmlExpand(obj,
                             { outlineType: 'rounded-white',
                               wrapperClassName: 'draggable-header',
                               width: 400,
                               height: 600,
                               objectType: 'ajax' });
    },

    searchDiagnosisStart: function(){
        var name = $("#search_diagnosis_name").val();
        var params = "name=" + name;
        $.post("/interviews/search_diagnosis_start/",
              params,
              function(html){
                  $("#search_diagnosis_result").html(html);
              });
    },
    
    addRelation: function(diagnosisId){
        var interviewId = $("#interview_id").val();
        var params = "interview_id=" + interviewId;
        params += "&diagnosis_id=" + diagnosisId;
        $.post("/interviews/add_relation/",
              params,
              function(html){
                  $("#interview_diagnoses_list").html(html);
              });
    }
}

var common = new Common;
