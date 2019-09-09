<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

      <div class="container-fluid">

        <!-- Breadcrumbs-->
        <ol class="breadcrumb">
          <li class="breadcrumb-item">
            <a href="#">Dashboard</a>
          </li>
          <li class="breadcrumb-item active">Monitoring</li>
        </ol>

        <!-- Icon Cards-->
        <div class="row">
          <div class="col-xl-3 col-sm-6 mb-3">
            <div class="card text-white bg-primary o-hidden h-100">
              <div class="card-body">
                <div class="card-body-icon">
                  <i class="fas fa-fw fa-comments"></i>
                </div>
                <div class="mr-5">${gadata}</div>
              </div>
              <a class="card-footer text-white clearfix small z-1" href="#">
                <span class="float-left">View Details</span>
                <span class="float-right">
                  <i class="fas fa-angle-right"></i>
                </span>
              </a>
            </div>
          </div>
          <div class="col-xl-3 col-sm-6 mb-3">
            <div class="card text-white bg-warning o-hidden h-100">
              <div class="card-body">
                <div class="card-body-icon">
                  <i class="fas fa-fw fa-list"></i>
                </div>
                <div class="mr-5">11 New Tasks!</div>
              </div>
              <a class="card-footer text-white clearfix small z-1" href="#">
                <span class="float-left">View Details</span>
                <span class="float-right">
                  <i class="fas fa-angle-right"></i>
                </span>
              </a>
            </div>
          </div>
          <div class="col-xl-3 col-sm-6 mb-3">
            <div class="card text-white bg-success o-hidden h-100">
              <div class="card-body">
                <div class="card-body-icon">
                  <i class="fas fa-fw fa-shopping-cart"></i>
                </div>
                <div class="mr-5">123 New Orders!</div>
              </div>
              <a class="card-footer text-white clearfix small z-1" href="#">
                <span class="float-left">View Details</span>
                <span class="float-right">
                  <i class="fas fa-angle-right"></i>
                </span>
              </a>
            </div>
          </div>
          <div class="col-xl-3 col-sm-6 mb-3">
            <div class="card text-white bg-danger o-hidden h-100">
              <div class="card-body">
                <div class="card-body-icon">
                  <i class="fas fa-fw fa-life-ring"></i>
                </div>
                <div class="mr-5">13 New Tickets!</div>
              </div>
              <a class="card-footer text-white clearfix small z-1" href="#">
                <span class="float-left">View Details</span>
                <span class="float-right">
                  <i class="fas fa-angle-right"></i>
                </span>
              </a>
            </div>
          </div>
        </div>

        <!-- Area Chart Example-->
        <div class="card mb-3">
          <div class="card-header">
            <i class="fas fa-chart-area"></i>
            Area Chart Example</div>
          <div class="card-body">
            <canvas id="myAreaChart" width="100%" height="30"></canvas>
          </div>
          <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
        </div>

     </div>
     
     
<!--  ga -->
<button id="auth-button" hidden>Authorize</button>
<div class="getViews">조회수 확인</div>

<h1>Hello Analytics</h1>

<textarea cols="80" rows="20" id="query-output"></textarea>

<script>

/*https://nubiz.tistory.com/654  */
    // Replace with your client ID from the developer console. https://console.developers.google.com/apis/credentials
//797674242275-q3ocnl8vpot5ke4oeog84q9eusfuqr5f.apps.googleusercontent.com
    var CLIENT_ID = '813555744368-m9rsmjp3ial0lorvo37rqfi3htmsis9i.apps.googleusercontent.com';

    // Replace with your view ID. from https://ga-dev-tools.appspot.com/account-explorer/

    var VIEW_ID = '196870503';

    var DISCOVERY = 'https://analyticsreporting.googleapis.com/$discovery/rest';

    var SCOPES = ['https://www.googleapis.com/auth/analytics.readonly'];



    function authorize(event) {

      // Handles the authorization flow.

      // `immediate` should be false when invoked from the button click.

      var useImmdiate = event ? false : true;

      var authData = {

        client_id: CLIENT_ID,

        scope: SCOPES,

        immediate: useImmdiate

      };

      gapi.auth.authorize(authData, function(response) {

        if (response.error) {

  	$(".getViews").text("인증필요");

        }

        else {

  	$(".getViews").text("불러오는 중");

          queryReports();

        }

      });

    }



    function queryReports() {

      // Load the API from the client discovery URL.

      gapi.client.load(DISCOVERY

      ).then(function() {

          // Call the Analytics Reporting API V4 batchGet method.

          gapi.client.analyticsreporting.reports.batchGet( {

            "reportRequests":[

            {

              "viewId":VIEW_ID,

              "dateRanges":[

                {

                  "startDate":"7daysAgo",

                  "endDate":"today"

                }],

              "dimensions": [

                {

                  "name": "ga:pagePath"

                }],

              "dimensionFilterClauses": [

                {

                  "filters": [

                    {

                      "dimensionName": "ga:pagePath",

                      "not": false,

                      "expressions": [

                        "\\"+location.pathname

                      ],

                      "caseSensitive": false,

                    }

                  ]

                }],

              "metrics":[

                {

                  "expression":"ga:hits"

                }],

              "orderBys": [

                {

                  "fieldName": "ga:hits",

                  "sortOrder": "DESCENDING",

                }

              ],

            }]

          } ).then(function(response) {

            var parse = JSON.parse(response.body);

            var views = "지난 1주일간 조회수: "+parse.reports[0].data.totals[0].values[0];

            console.log(views);

  	  $(".getViews").text(views);

          })

          .then(null, function(err) {

              // Log any errors.

              console.log(err);

          });

      });

    }

   $(".getViews").click(function(){authorize(event);});

  </script>

  <script async src="https://apis.google.com/js/client.js"></script>
